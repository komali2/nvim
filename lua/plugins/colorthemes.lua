return {
  { "datsfilipe/min-theme.nvim" },
  { "datsfilipe/vesper.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "glepnir/zephyr-nvim",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000, -- load early
    config = function()
      require("kanagawa").setup({
        theme = "dragon", -- optional, defaults to 'wave'
      })
      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- Using Lazy
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "darker",
      })
    end,
  },
  { "EdenEast/nightfox.nvim" },
}
