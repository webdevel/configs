local opt = vim.opt

-- use clipboard instead of default registers
opt.clipboard:append { 'unnamedplus' }

-- opt.termguicolors = true
opt.guicursor = ''

-- line numbers on
opt.number = true
opt.relativenumber = true
-- lines around cursor
opt.scrolloff = 8
-- opt.numberwidth = 2

-- tabs to spaces
opt.tabstop = 4
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 2
opt.smarttab = true
opt.smartindent = true

-- autocompletion options
opt.wildmode = 'longest,list,full'

-- undo levels default 100
opt.undolevels = 256

opt.diffopt = 'filler,vertical'
opt.foldmethod = 'marker'
opt.fileformat = 'unix'
opt.backspace = 'indent,eol,start'
opt.switchbuf = 'usetab,newtab'

-- set whitespace to visible characters
--opt.listchars='eol:¶,tab:»›,trail:·,extends:▷,precedes:◁,space:·,nbsp:·'

-- colors 256
--opt.t_Co = 256

-- highlight current line of cursor
opt.cursorline = true
-- opt.cursorcolumn = true

opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath('state')..'/undo'
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true

-- signcolumn = 'yes'
-- opt.isfname:append("@-@")
-- opt.updatetime = 50
-- opt.colorcolumn = '80'

opt.winbar = '%=%m %F'
