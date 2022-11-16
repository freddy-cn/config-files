-- this file must be placed inside ./config/nvim/lua/

require'lspconfig'.pyright.setup{
    on_attach = function()
        vim.keymap.set("n", "ñ!", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "ñd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "ñx", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "ñc", vim.lsp.buf.rename, {buffer=0})
    end
}

require'lspconfig'.quick_lint_js.setup {
    on_attach = function()
        vim.keymap.set("n", "ñ!", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "ñd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "ñx", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "ñc", vim.lsp.buf.rename, {buffer=0})
    end
}

-- install phpactor from:
-- https://phpactor.readthedocs.io/en/master/usage/standalone.html#installation-global and
-- https://github.com/phpactor/phpactor
require'lspconfig'.phpactor.setup{
    on_attach = function()
        vim.keymap.set("n", "ñ!", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "ñd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "ñx", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "ñc", vim.lsp.buf.rename, {buffer=0})
    end,
    init_options = {
        ["language_server_phpstan.enabled"] = true,
        ["language_server_psalm.enabled"] = false,
    }
}
