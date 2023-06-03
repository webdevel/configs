local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local webdevel_group = augroup('webdevel', {})
local yank_group = augroup('HighlightYank', {})

-- highlight on yank
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- remove trailing whitespace on save
autocmd({"BufWritePre"}, {
    group = webdevel_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

--vim.cmd.colorscheme('forests')
vim.cmd.highlight({'CursorLine', 'ctermbg=Black', 'guibg=#000000'})
