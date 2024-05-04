local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local opts = {
    sources = {
        -- golang
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.staticcheck,
        -- null_ls.builtins.diagnostics.gospel,

        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,

        -- frontend
        null_ls.builtins.code_actions.eslint,

        -- markdown
        -- null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.formatting.mdformat,

        -- scripting
        null_ls.builtins.formatting.beautysh, --shell
        null_ls.builtins.formatting.shellharden, --shell
        null_ls.builtins.diagnostics.hadolint, --docker

        --general
        null_ls.builtins.diagnostics.semgrep.with({
        extra_args = { "--config","auto"},
    }),
        null_ls.builtins.formatting.prettier,
    },
    on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts
