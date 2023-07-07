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
      -- Optional, for templates (see below).
      templates = {
        subdir = "09-Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M:%S",
      },                 -- Optional, completion.
      completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
      },
      -- Optional, set to true if you don't want Obsidian to manage frontmatter.
      disable_frontmatter = false,

      -- Optional, alternatively you can customize the frontmatter data.
      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { title = note.title, id = note.id, date = note.date, tags = note.tags }
        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.

        -- set out.date to current date and time:
        if note.date == nil then out.date = os.date "%Y-%m-%d %H:%M:%S" end

        if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart { "open", url } -- Mac OS
        vim.fn.jobstart { "xdg-open", url } -- linux
      end,
      open_app_foreground = true,
      finder = "telescope.nvim",
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
