local opt = vim.opt

-- Spacing
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = false

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("cache") .. "/vim/undodir"
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.encoding = "UTF-8"

