return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin", lazy = false },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim", enable = true },
  { import = "astrocommunity.colorscheme.vscode-nvim", enable = true },
  -- { import = "astrocommunity.colorscheme.everforest", enable = true },
  -- { import = "astrocommunity.colorscheme.sonokai" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim", enabled = false },
  -- { import = "astrocommunity.colorscheme.gruvbox-baby", enabled = true },
  { import = "astrocommunity.colorscheme.github-nvim-theme", enabled = true },
  -- { import = "astrocommunity.colorscheme.monokai-pro-nvim", enabled = true },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  { import = "astrocommunity.color.tint-nvim" },

  -- Themes
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    config = function()
      vim.g.background = "light"
      require("vscode").setup {
        itatlic_comments = true,
        disable_nvimtree_bg = true,
      }
    end,
  },
  {
    "github-nvim-theme",
    lazy = false,
    config = function()
      vim.o.background = "light"
      require("github-theme").setup {

        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic, bold",
        },
        inverse = {
          match_paren = true,
          visual = true,
          search = true,
        },
        darken = {
          floats = true,
          -- bufferline = true,
          -- comment = true,
        },
        specs = {
          github_light = {
            syntax = { opertor = "orange" },
          },
          groups = {
            github_light = {
              Cursor = {
                fg = "#1F2328",
              },
              CursorLine = {
                fg = "#1F2328",
              },
              CursorLineNr = {
                fg = "#1F2328",
              },
            },
          },
        },
      }
    end,
  },
  {
    -- further customize the options set by the community
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = false,
          accept_word = "<C-l>",
          accept_line = "Tab",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C/>",
        },
      },
      filetypes = {
        markdown = true,
        yaml = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
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
    "jay-babu/project.nvim",
    main = "project_nvim",
    event = "VeryLazy",
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
  -- {
  --   "Civitasv/cmake-tools.nvim",
  --   ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  --   dependencies = {
  --     {
  --       "jay-babu/mason-nvim-dap.nvim",
  --       opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "codelldb") end,
  --     },
  --   },
  --   opts = {
  --     cmake_regenerate_on_save = false, -- auto generate when save CMakeLists.txt
  --   },
  -- },
}
