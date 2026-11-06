return {
  "zbirenbaum/copilot.lua",

  -- Load on-demand:
  cmd = "Copilot",
  event = "BufReadPost", -- or "InsertEnter", etc.
  build = ":Copilot auth", -- only if you need to authenticate

  -- >>> Your custom settings go under `opts`
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = false, -- handled by nvim-cmp
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },

    -- Disable Copilot in Markdown (and optionally help/text)
    filetypes = {
      markdown = false,
      help = false,
      text = false,
      -- ["*"] = false,    -- uncomment to disable everywhere by default
    },
  },
}
