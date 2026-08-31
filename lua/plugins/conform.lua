-- lua/plugins/formatting.lua
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs({
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
        "css",
        "scss",
        "less",
        "markdown",
        "markdown.mdx",
        "yaml",
      }) do
        -- prefer prettierd (fast) then fall back to prettier via pnpm
        opts.formatters_by_ft[ft] = { "prettierd", "prettier" }
      end

      opts.default_format_opts = vim.tbl_deep_extend("force", opts.default_format_opts or {}, {
        timeout_ms = 9000, -- pnpm + workspaces + plugins can be slower
      })

      opts.formatters = opts.formatters or {}
      -- prettierd: just use the command name; it resolves project-local automatically
      opts.formatters.prettierd = { command = "prettierd" }

      opts.formatters.prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
      }
    end,
  },
}
