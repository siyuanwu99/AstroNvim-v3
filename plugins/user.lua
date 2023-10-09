return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --
  --
  {
    "tadachs/ros-nvim",
    config = function() require("ros-nvim").setup { only_workspace = true } end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- {
  --   "edluffy/hologram.nvim",
  --   lazy = false,
  --   ft = { "markdown" },
  --   config = function()
  --     require("hologram").setup {
  --       auto_display = true,
  --     }
  --   end,
  -- },

  -- Chinese Input
  -- { "kevinhwang91/nvim-ibus-sw", config = function() require("ibus-sw").setup {} end, lazy = false },
}
