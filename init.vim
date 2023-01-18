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
Plug 'dietsche/vim-lastplace'
Plug 'ekalinin/Dockerfile.vim'
" usage: :Tabularize /|
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jose-elias-alvarez/null-ls.nvim'
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
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
" telescope dependency
" brew install ripgrep
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'pageer/pdv', { 'for': 'php' }
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'ryanoasis/vim-devicons'
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
Plug 'patstockwell/vim-monokai-tasty'
call plug#end()

lua require('plugins-setup')
lua require('keymaps')

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
set nohidden
set cursorline
set background=dark
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=100
set tabstop=4
set shiftwidth=4
set expandtab
set showtabline=2                     " always show tab
set tags+=tags,tags.vendors
set autoindent
set smartindent
set smarttab
set virtualedit=block
"set autochdir
set lazyredraw
set redrawtime=100000
set re=1

"auto reload while file changed
set autoread
au CursorHold * checktime

if (has("termguicolors"))
  set termguicolors
  let g:vim_monokai_tasty_machine_tint = 1
  colorscheme vim-monokai-tasty
else
  "colorscheme desert
  colorscheme webberwu
end

filetype plugin indent on

autocmd BufNewFile,BufRead *.yml set filetype=yaml
autocmd FileType crontab set nobackup nowritebackup
autocmd FileType php set colorcolumn=120

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

" vim-fugitive
nnoremap gbb <cmd>Git blame<CR>
autocmd FileType fugitiveblame nmap <C-t> O

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
" Show brief information about the symbol under the cursor
autocmd FileType php nnoremap <C-h> :call phpactor#Hover()<CR>
autocmd FileType php setlocal omnifunc=phpactor#Complete

" mgedmin/python-imports.vim
autocmd FileType python nnoremap <C-i> :ImportName<CR>

" ryanoasis/vim-devicons
" refs. https://github.com/ryanoasis/nerd-fonts#font-installation
" install font on macOS
" cd ~/Library/Fonts && curl -fLo 'Droid Sans Mono for Powerline Nerd Font Complete.otf' https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
