local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

-- ts js

lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

require 'lspconfig'.eslint.setup {}

-- yelp python server config
-- https://yelp.slack.com/archives/CA7F2EM6G/p1673370381993289?thread_ts=1673342577.011049&cid=CA7F2EM6G

if not configs.pyls then
    configs.pyls = {

        default_config = {
            cmd = { "pyls" },
            filetypes = { "python" },
            root_dir = function(fname)
                return vim.fn.getcwd()
            end,
        },
        docs = {
            package_json =
            "https://raw.githubusercontent.com/palantir/python-language-server/develop/vscode-client/package.json",
            description = [[
https://github.com/palantir/python-language-server
`python-language-server`, a language server for Python.
The language server can be installed via `pipx install 'python-language-server[all]'`.
    ]],
            default_config = {
                root_dir = "vim's starting directory",
            },
        },
    }
end

lspconfig["pyls"].setup({})

-- Auto completion

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
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
