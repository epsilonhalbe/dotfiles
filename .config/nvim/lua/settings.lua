
vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax enable'
vim.g.python3_host_prog='/opt/homebrew/bin/python3'

-- vim.o.confirm
-- vim.o.ffs = unix,dos,mac
-- vim.o.fillchars = '⣿'
-- vim.o.laststatus = 2
-- vim.o.lazyredraw
-- vim.o.linebreak
-- vim.o.matchtime = 3
-- vim.o.modelines = 0
-- vim.o.ruler
-- vim.o.scrolloff = 5                                      -- vertical scrolloff
-- vim.o.shell = /bin/zsh
-- vim.o.shiftround
-- vim.o.showbreak = '\ \ \ ↪'
-- vim.o.showcmd
vim.o.showmatch = true
-- vim.o.showmode -- to see which indentation modes are set type in command mode verbose set ai? cin? cink? cino? si? inde? indk?
-- vim.o.sidescroll = 1
-- vim.o.sidescrolloff = 5                                  -- horzontal scrolloff
-- vim.o.signcolumn = yes
-- vim.o.smartcase
-- vim.o.tabpagemax = 30
-- vim.o.termencoding = utf-8
-- vim.o.ttyfast
-- vim.o.undofile = true
-- vim.o.undoreload = 2000
-- vim.o.updatetime = 300
-- vim.o.virtualedit+ = block
-- vim.o.visualbell
--vim.o.cpoptions+ = J
--vim.o.scrolloff=999                                    -- vertical scrolloff if set to 999 cursor is always in the middle of the screen
local indent = 2
vim.g.autoindent = true
vim.g.mapleader = ' '
vim.g.smartindent = true

vim.o.clipboard ='unnamed,unnamedplus'
vim.o.cmdheight = 2
vim.o.timeoutlen = 200
vim.o.cursorline = true
vim.o.encoding = 'utf-8'
vim.o.errorbells = true
vim.o.hidden = true
vim.o.history = 2000
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.joinspaces = false
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 4
vim.o.shiftround = true
vim.o.shiftwidth = indent
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.softtabstop = indent
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = indent
vim.o.wrap = false

vim.opt.completeopt = {
  'longest',
  'menuone',
  'preview',
}
vim.opt.expandtab = true
vim.opt.listchars = {
  tab = '▸ ',
  extends = '❯',
  nbsp = '␣',
  precedes = '❮',
  trail = '␣',
}
vim.opt.wildmode = {
  'list',
  'longest',
}

-- Highlight on yank
vim.cmd[[autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]
