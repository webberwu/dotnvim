-- import Comment plugin safely
local setup, markview = pcall(require, "markview")
if not setup then
    print("module 'markview' not found")
    return
end

markview.setup({
    filetypes = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
    buf_ignore = {},
    max_length = 99999,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "Avante",
    command = "setlocal filetype=markdown"
})
