return {
  "ThePrimeagen/99",
  keys = {
    { "<leader>9v", mode = "v", function() require("99").visual() end, desc = "99: Edit Selection" },
    { "<leader>9s", function() require("99").search() end, desc = "99: AI Search" },
    { "<leader>9x", function() require("99").stop_all_requests() end, desc = "99: Stop All Requests" },

    -- Model/provider pickers need telescope.nvim or fzf-lua (you have neither right now,
    -- so these are dead until you install one). Uncomment + add the dependency below if wanted.
    -- { "<leader>9m", function() require("99.extensions.telescope").select_model() end, desc = "99: Select Model" },
    -- { "<leader>9p", function() require("99.extensions.telescope").select_provider() end, desc = "99: Select Provider" },
  },
  dependencies = {
    -- required for completion.source = "blink" below; LazyVim's blink extra only
    -- installs this as `optional = true`, so 99 needs it declared for real here.
    { "saghen/blink.compat", version = "2.*" },
    -- "nvim-telescope/telescope.nvim", -- or "ibhagwan/fzf-lua", for the model/provider pickers
  },
  config = function()
    local _99 = require("99")
    _99.setup({
      -- Claude Code is what you're actually running day to day, so default to it.
      -- Swap for _99.Providers.OpenCodeProvider / CursorAgentProvider / GeminiCLIProvider if you want.
      provider = _99.Providers.ClaudeCodeProvider,
      completion = {
        -- you're already on the blink.cmp extra, so wire 99 into it instead of "native"
        source = "blink",
      },
      md_files = { "AGENTS.md" },
    })
  end,
}
