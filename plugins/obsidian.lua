local vault_dir = "/home/siyuan/Notes"
return {
  {
    "epwalsh/obsidian.nvim",
    lazy = false,
    -- event = { "BufReadPre " .. vault_dir .. "/**.md" },
    -- event = "",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- Optional, for completion.
      "hrsh7th/nvim-cmp",

      -- Optional, for search and quick-switch functionality.
      "nvim-telescope/telescope.nvim",

      -- Optional, an alternative to telescope for search and quick-switch functionality.
      -- "ibhagwan/fzf-lua"

      -- Optional, another alternative to telescope for search and quick-switch functionality.
      -- "junegunn/fzf",
      -- "junegunn/fzf.vim"

      -- Optional, alternative to nvim-treesitter for syntax highlighting.
      -- "godlygeek/tabular",
      -- "preservim/vim-markdown",
    },
    opts = {
      dir = vault_dir,
      -- Optional, if you keep notes in a specific subdirectory of your vault.
      notes_subdir = "06-Cards",

      -- Optional, if you keep daily notes in a separate directory.
      daily_notes = {
        folder = "01-Diary/日志存档",
      },
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart { "open", url } -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
      end,
      open_app_foreground = true,
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
      -- see also: 'follow_url_func' config option above.
      vim.keymap.set("n", "gf", function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end, { noremap = false, expr = true })
    end,
  },
}
