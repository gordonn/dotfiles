--[[
██████╗░░█████╗░░██████╗██╗░█████╗░  ░█████╗░██████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
██╔══██╗██╔══██╗██╔════╝██║██╔══██╗  ██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
██████╦╝███████║╚█████╗░██║██║░░╚═╝  ██║░░██║██████╔╝░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
██╔══██╗██╔══██║░╚═══██╗██║██║░░██╗  ██║░░██║██╔═══╝░░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
██████╦╝██║░░██║██████╔╝██║╚█████╔╝  ╚█████╔╝██║░░░░░░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░╚════╝░  ░╚════╝░╚═╝░░░░░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
]]

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true

opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard = "unnamedplus"

opt.splitright = true
opt.splitbelow = true

opt.virtualedit = "block"

opt.fillchars = { eob = " " }

opt.scrolloff = 999

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.wo.signcolumn = "no"

--[[
██╗░░██╗███████╗██╗░░░██╗███╗░░░███╗░█████╗░██████╗░░██████╗
██║░██╔╝██╔════╝╚██╗░██╔╝████╗░████║██╔══██╗██╔══██╗██╔════╝
█████═╝░█████╗░░░╚████╔╝░██╔████╔██║███████║██████╔╝╚█████╗░
██╔═██╗░██╔══╝░░░░╚██╔╝░░██║╚██╔╝██║██╔══██║██╔═══╝░░╚═══██╗
██║░╚██╗███████╗░░░██║░░░██║░╚═╝░██║██║░░██║██║░░░░░██████╔╝
╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═════╝░
]]

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

--[[
██╗░░░░░░█████╗░███████╗██╗░░░██╗███╗░░██╗██╗░░░██╗██╗███╗░░░███╗
██║░░░░░██╔══██╗╚════██║╚██╗░██╔╝████╗░██║██║░░░██║██║████╗░████║
██║░░░░░███████║░░███╔═╝░╚████╔╝░██╔██╗██║╚██╗░██╔╝██║██╔████╔██║
██║░░░░░██╔══██║██╔══╝░░░░╚██╔╝░░██║╚████║░╚████╔╝░██║██║╚██╔╝██║
███████╗██║░░██║███████╗░░░██║░░░██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║
╚══════╝╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  --[[
██████╗░██╗░░░░░██╗░░░██╗░██████╗░██╗███╗░░██╗░██████╗
██╔══██╗██║░░░░░██║░░░██║██╔════╝░██║████╗░██║██╔════╝
██████╔╝██║░░░░░██║░░░██║██║░░██╗░██║██╔██╗██║╚█████╗░
██╔═══╝░██║░░░░░██║░░░██║██║░░╚██╗██║██║╚████║░╚═══██╗
██║░░░░░███████╗╚██████╔╝╚██████╔╝██║██║░╚███║██████╔╝
╚═╝░░░░░╚══════╝░╚═════╝░░╚═════╝░╚═╝╚═╝░░╚══╝╚═════╝░
]]

  {
    {
      "goolord/alpha-nvim",
      config = function()
        require("gordon.ui.alpha")
      end,
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use
    "christoomey/vim-tmux-navigator", -- tmux & split window navigation

    -- lsp plugins
    { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    { "onsails/lspkind.nvim" },
  },

  { import = "gordon.ui" },
  { import = "gordon.syntax" },
  { import = "gordon.navigation" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

vim.cmd([[colorscheme gruvbox]])

require("gordon.lsp")
