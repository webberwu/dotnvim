" https://github.com/vim/vim/issues/668#issuecomment-191420742
let g:vimsyn_embed='0'

" vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged/')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'andymass/vim-matchup'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'avakhov/vim-yaml', { 'for': ['yml', 'yaml'] }
Plug 'dense-analysis/ale'
Plug 'dietsche/vim-lastplace'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
" usage: :Tabularize /|
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'lewis6991/impatient.nvim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'taoso/phpcd.vim', { 'branch': 'php8', 'for': 'php', 'do': 'composer install' }
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mgedmin/python-imports.vim', { 'for': 'python' }
Plug 'mkitt/tabline.vim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-tree/nvim-web-devicons'
" telescope dependency
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'pageer/pdv', { 'for': 'php' }
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tobyS/vmustache', { 'for': 'php' }
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" need to install phpctags: `composer global require techlivezheng/phpctags`
Plug 'vim-php/tagbar-phpctags.vim'
call plug#end()

syntax on

set t_Co=256
set incsearch
set hlsearch
set number
set ruler
set ignorecase
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,big5
set mouse=
set modeline
set cursorline
set background=dark
set nocompatible
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=100
set tabstop=4
set shiftwidth=4
set expandtab
set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set tags+=tags,tags.vendors
set autoindent
set smartindent
set smarttab
set virtualedit=block
"set autochdir
set lazyredraw
set redrawtime=100000
set re=1

"colorscheme desert
colorscheme webberwu

set laststatus=2
set statusline=%0*\ %{fugitive#statusline()}\ %*
set statusline+=%2*\ %*
set statusline+=%3*%m%r%*
set statusline+=%2*%f\ %*
set statusline+=%1*\ %{&ff},%{&fileencoding}%Y%H%W
set statusline+=%=%*
set statusline+=%1*\ dec:\%3.b,\ hex:\%2.B\ %*
set statusline+=%2*\ row:%4.l/%4.L,\ col:%3.c\ %*
set statusline+=%0*\ %3.p%%\ %*
highlight User1 cterm=none ctermbg=235 ctermfg=grey
highlight User2 cterm=none ctermbg=237 ctermfg=white
highlight User3 cterm=none ctermbg=237 ctermfg=darkred

filetype plugin indent on

autocmd BufNewFile,BufRead *.yml set filetype=yaml
autocmd FileType crontab set nobackup nowritebackup

highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set foldmethod=indent
set foldlevelstart=99
" will become slow if open many lines file
"autocmd BufWinLeave *.* silent! mkview
"autocmd BufWinEnter *.* silent! loadview
"autocmd Syntax php normal zR

noremap me $
noremap ms ^
noremap .rs :%s/\s\+$//<CR>
noremap gb :Buffers<CR>
noremap gbp :bp<CR>
noremap gbn :bn<CR>
nnoremap <silent> cu :set undoreload=0 \| edit<CR>
inoremap jj <ESC>
inoremap jm $
inoremap jk ->
inoremap jl =>

"forked from tobyS/pdv, pageer/pdv has implemented feature which return type.
"dependence: SirVer/ultisnips, tobyS/vmustache
let g:pdv_cfg_Uses = 1
let g:pdv_template_dir = $HOME . '/.vim/plugged/pdv/templates_snip'
nnoremap <C-K> :call pdv#DocumentWithSnip()<CR> :%s/\s\+$//<CR>
vnoremap <C-K> :call pdv#DocumentWithSnip()<CR> :%s/\s\+$//<CR>

"nerdtree
let NERDTreeShowHidden = 1

"tagbar
nmap mm :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_width = 70

"vim-easy-align
"usage: vmode: ga*|
nnoremap ga <Plug>(EasyAlign)
xnoremap ga <Plug>(EasyAlign)
" https://robots.thoughtbot.com/align-github-flavored-markdown-tables-in-vim
vnoremap <Leader><Bslash> :EasyAlign*<Bar><Enter>

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_powerline_fonts = 1
"airline-theme
"screenshots: https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='powerlineish'
let g:airline_section_warning = airline#section#create_right(['%{gutentags#statusline()}', 'ycm_warning_count', 'whitespace'])

"vim-gutentags
let g:gutentags_cache_dir = '~/.cache/vim-gutentags'
let g:gutentags_project_root = ['.git', '.project', '.vimtag']
" :ts list match file
" :ptselect same with :ts
" :tp previous match file
" :tn next match file
nmap <C-]> :tab tag <C-R><C-W><CR>

"vim-php-namespace: use statements
let g:php_namespace_sort_after_insert = 1
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>nu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>nu :call PhpInsertUse()<CR>

"vim-php-namespace: fully qualified
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"vim-multiple-cursors
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

"junegunn/fzf.vim
nnoremap <C-j> :Files<CR>
nnoremap <C-t> :Tags<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore "*.swp" -f -U -g ""'
let g:fzf_files_options = "--ansi --preview-window 'right:55%' --preview '(bat --color=always --style=header,grid {} || cat {}) 2> /dev/null | head -" . &lines . "' --bind alt-down:preview-page-down,alt-up:preview-page-up,alt-j:preview-down,alt-k:preview-up"
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Identifier'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Identifier'],
    \ 'info':    ['fg', 'Delimiter'],
    \ 'prompt':  ['fg', 'Comment'],
    \ 'pointer': ['fg', 'Identifier'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" phpactor/phpactor
" Include use statement
autocmd FileType php nnoremap <C-u> :call phpactor#UseAdd()<CR>
" Goto definition of class or class member under the cursor
autocmd FileType php nnoremap <C-o> :call phpactor#GotoDefinition()<CR>
" Show brief information about the symbol under the cursor
autocmd FileType php nnoremap <C-h> :call phpactor#Hover()<CR>
autocmd FileType php setlocal omnifunc=phpactor#Complete

" mgedmin/python-imports.vim
autocmd FileType python nnoremap <C-i> :ImportName<CR>

" ryanoasis/vim-devicons
" refs. https://github.com/ryanoasis/nerd-fonts#font-installation
" install font on macOS
" cd ~/Library/Fonts && curl -fLo 'Droid Sans Mono for Powerline Nerd Font Complete.otf' https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

" dense-analysis/ale
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1
let g:ale_php_phpcs_standard = 'PSR12'
let g:ale_php_phpcs_options = '--exclude=PSR1.Files.SideEffects'
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_options = '--disable=line-too-long,missing-docstring,too-few-public-methods'
let g:ale_linters = {
        \'php': ['php', 'phpcs']
    \}

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'

" fatih/vim-go
let g:go_auto_type_info = 1
let g:go_autodetect_gopath = 1
let g:go_fmt_command = 'goimports'
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_null_module_warning = 0

autocmd FileType go inoremap <buffer> . .<C-x><C-o>
autocmd FileType go inoremap <buffer> <C-n> <C-x><C-o>
autocmd FileType go nmap <C-o> <Plug>(go-def-tab)

" numToStr/Comment.nvim
lua require('Comment').setup()

" neoclide/coc.nvim
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
set updatetime=500
set signcolumn=number
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>

" nvim-telescope/telescope.nvim
" brew install ripgrep
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-g>b <cmd>Telescope git_branches<cr>
nnoremap <C-g>g <cmd>Telescope live_grep<cr>
