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
}
