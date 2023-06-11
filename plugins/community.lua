return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.sonokai" },
  { import = "astrocommunity.colorscheme.github-nvim-theme",           enabled = true },
  -- { import = "astrocommunity.colorscheme.monokai-pro-nvim",            enabled = false },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  {
    -- further customize the options set by the community
    "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
      },
    },
  },
  {
    -- further customize the options set by the community
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "Tab",
          prev = "<S-Tab>",
          dismiss = "<C/>",
        },
      },
    },
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
  {
    "project.nvim",
    opts = {
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      ignore_lsp = { "null-ls", "efm", "copilot" },
      exclude_dirs = { "./logs", "./log", "./tmp", "./.vscode", "./build", "./devel" },
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = "global",
      datapath = vim.fn.stdpath "data",
    },
  },
  {
    "neogen",
    opts = {
      enabled = true,
      input_after_comment = true,
    },
  },
}
