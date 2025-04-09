local lsp_zero = require("lsp-zero")

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file

local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})


-- yelp python server config
-- https://yelp.slack.com/archives/CA7F2EM6G/p1673370381993289?thread_ts=1673342577.011049&cid=CA7F2EM6G

-- local lspconfig = require("lspconfig")
-- local configs = require("lspconfig.configs")

-- if not configs.pyls then
--     configs.pyls = {
--
--         default_config = {
--             cmd = { "pyls" },
--             filetypes = { "python" },
--             root_dir = function(fname)
--                 return vim.fn.getcwd()
--             end,
--         },
--         docs = {
--             package_json =
--             "https://raw.githubusercontent.com/palantir/python-language-server/develop/vscode-client/package.json",
--             description = [[
-- https://github.com/palantir/python-language-server
-- `python-language-server`, a language server for Python.
-- The language server can be installed via `pipx install 'python-language-server[all]'`.
--     ]],
--             default_config = {
--                 root_dir = "vim's starting directory",
--             },
--         },
--     }
-- end
--
-- lspconfig["pyls"].setup({})

-- pylsp setup outside Yelp
require 'lspconfig'.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 100
                }
            }
        }
    }
}

-- Auto completion

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp' },
    },
})

-- mason
require("mason").setup()

-- lua ls
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})


-- eslint
-- lspconfig.eslint.setup({
--     root_dir = require('lspconfig').util.root_pattern(".eslintrc.json", "package.json", ".git"),
--     on_attach = function(client, bufnr)
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = bufnr,
--             command = "EslintFixAll",
--         })
--     end,
-- })

-- require 'lspconfig'.eslint.setup {}

require 'lspconfig'.ts_ls.setup {
    on_attach = function(client, bufnr)
        -- other custom settings
    end,
    flags = {
        debounce_text_changes = 150,
    }
}
