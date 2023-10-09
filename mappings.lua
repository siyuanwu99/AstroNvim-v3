local astro_utils = require "astronvim.utils"
-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  -- Normal --
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"

    -- Buffer
    ["<A-q>"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<A-k>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<A-j>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<A-S-k>"] = {
      function() require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Move buffer tab right",
    },
    ["<A-S-j>"] = {
      function() require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Move buffer tab left",
    },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>c"] = false, -- disable original mappings

    -- Resize
    ["<A-;>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" },
    ["<A-'>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" },
    ["<A-[>"] = { "<cmd>vertical resize -5<CR>", desc = "Resize split left" },
    ["<A-]>"] = { "<cmd>vertical resize +5<CR>", desc = "Resize split right" },

    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

    -- Telescope
    ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Projects" },
    ["<leader>fr"] = { "<cmd>Telescope ros ros<cr>", desc = "ROS" },
    ["<leader>fg"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" },

    -- ROS
    ["<leader>r"] = { desc = "󱨚 ROS" },
    ["<leader>rl"] = { function() require("ros-nvim.ros").open_launch_include() end, desc = "Open launch include" },
    -- show definition for messages/services in floating window
    ["<leader>rm"] = {
      function() require("ros-nvim.ros").show_message_definition() end,
      desc = "Show message definition",
    },
    ["<leader>rs"] = {
      function() require("ros-nvim.ros").show_service_definition() end,
      desc = "Show services definition",
    },

    -- NeoTree
    ["<leader>o"] = false,
    ["<C-e>"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },

    -- Terminal
    ["<C-\\>"] = { "<cmd>ToggleTerm size=20 direction=horizontal<cr>", desc = "Terminal: Toggle horizontal" },
    ["<A-\\>"] = { "<cmd>ToggleTerm size=40 direction=vertical<cr>", desc = "Terminal: Toggle horizontal" },
    ["<C-A-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal: Toggle horizontal" },

    -- Markdown and LaTeX
    ["<leader>m"] = { desc = "󱁤 Compiler" },

    -- LSP
    ["<leader>lS"] = false,
    ["<leader>lo"] = { function() require("aerial").toggle() end, desc = "Language: Outline" },

    -- Obsidian
    -- ["<leader>o"] = { desc = "󰈙 Obsidian" },
    ["<leader>oq"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian: Quick search" },
    ["<leader>of"] = { "<cmd>ObsidianSearch<cr>", desc = "Obsidian: Search" },
    ["<leader>ob"] = { "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian: Back links" },
    ["<leader>ot"] = { "<cmd>ObsidianToday<cr>", desc = "Obsidian: Today" },
    ["<leader>oo"] = { "<cmd>ObsidianFollowLink<cr>", desc = "Obsidian: Follow link" },
    ["<leader>op"] = { "<cmd>ObsidianTemplate<cr>", desc = "Obsidian: Paste Template" },

    -- VimTex
    ["<leader>v"] = { desc = "󰈙 VimTex" },
    ["<leader>vo"] = { "<cmd>VimtexTocToggle<cr>", desc = "VimTex: Toggle toc" },
    ["<leader>vm"] = { "<cmd>VimtexCompile<cr>", desc = "VimTex: Compile" },
    ["<leader>vc"] = { "<cmd>VimtexClean<cr>", desc = "VimTex: Clean" },
    ["<leader>vv"] = { "<cmd>VimtexView<cr>", desc = "VimTex: View" },
    ["<leader>vt"] = { "<cmd>VimtexTocToggle<cr>", desc = "VimTex: TOC" },
  },

  -- Terminal Mode --
  t = {
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Terminal: Toggle horizontal" },
    ["<A-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Terminal: Toggle horizontal" },
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  -- Insert Mode --
  i = {
    ["<C-\\>"] = { "<Esc><Cmd>ToggleTerm direction=horizontal<CR>", desc = "Terminal: Toggle horizontal" },
    ["<A-\\>"] = { "<Esc><Cmd>ToggleTerm direction=vertical<CR>", desc = "Terminal: Toggle horizontal" },
  },

  -- Visual Mode --
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Edit: Move this line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Edit: Move this line up" },
  },
}
