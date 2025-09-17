-- Basic Neovim configuration (init.lua)

-- Set leader key
vim.g.mapleader = " "

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse support
vim.o.mouse = "a"

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Set indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Enable clipboard
vim.o.clipboard = "unnamedplus"

-- Set colorscheme (default)
vim.o.termguicolors = true
vim.cmd("colorscheme default")

-- Save undo history
vim.o.undofile = true

-- Set up basic keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Plugins can be managed below (e.g., with lazy.nvim or packer)
