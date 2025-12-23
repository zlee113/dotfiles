-- Settings
-- Updated last 12/22/25
-- Use system clipboard
vim.opt.clipboard = "unnamedplus"
-- Enable mouse
vim.opt.mouse = "a"
-- Better command-line completion
vim.opt.wildmenu = true
-- Border for info
vim.opt.winborder = "rounded"
-- Remove swap fiels
vim.opt.swapfile = false

-- Line numbers
vim.opt.relativenumber = true -- relative line numbers

-- Tabs & indentation
vim.opt.tabstop = 2      -- number of spaces a tab counts for
vim.opt.shiftwidth = 2   -- size of an indent
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true

-- Searching
vim.opt.ignorecase = true -- case-insensitive search...
vim.opt.smartcase = true  -- ...unless uppercase is used
vim.opt.hlsearch = true   -- highlight search matches
vim.opt.incsearch = true  -- show matches while typing

-- UI tweaks
vim.opt.termguicolors = true -- better colors
vim.opt.signcolumn = "yes"   -- always show sign column
vim.opt.cursorline = true    -- highlight current line
vim.opt.scrolloff = 8        -- keep lines above/below cursor

-- Syntax highlighting
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Keybinds
vim.g.mapleader = " "

-- Packages
vim.pack.add({
    { src = 'https://github.com/eldritch-theme/eldritch.nvim' },
    { src = 'https://github.com/echasnovski/mini.pick' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
})

-- Setup Eldritch theme
require "eldritch".setup()
vim.cmd("colorscheme eldritch")

-- Setup fuzzyfind with mini pick
require "mini.pick".setup()
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set("n", "<leader>c", function()
  vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, { desc = "Open Neovim config" })

-- Setup lspconfig
vim.lsp.enable({"lua_ls", "clangd"})
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

