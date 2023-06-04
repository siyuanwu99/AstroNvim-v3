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
    ["<A->>"] = {
      function() require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Move buffer tab right",
    },
    ["<A-<>"] = {
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
    ["<C-\\>"] = { "<cmd>ToggleTerm size=20 direction=horizontal<cr>", desc = "terminal: Toggle horizontal" },
    ["<A-\\>"] = { "<cmd>ToggleTerm size=40 direction=vertical<cr>", desc = "terminal: Toggle horizontal" },
    ["<C-A-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "terminal: Toggle horizontal" },

    -- Markdown and LaTeX
    ["<leader>m"] = { desc = "󱁤 Compiler" },
  },

  -- Terminal Mode --
  t = {
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "terminal: Toggle horizontal" },
    ["<A-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "terminal: Toggle horizontal" },
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  -- Insert Mode --
  i = {
    ["<C-\\>"] = { "<Esc><Cmd>ToggleTerm direction=horizontal<CR>", desc = "terminal: Toggle horizontal" },
    ["<A-\\>"] = { "<Esc><Cmd>ToggleTerm direction=vertical<CR>", desc = "terminal: Toggle horizontal" },
  },
}
