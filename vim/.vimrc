" syntax highlighting
syntax on

" set more undo levels as default is 100
set undolevels=128

" set tabs to spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" copy indent from current line when starting a new line
set autoindent

" command-line auto-completion is enhanced 
set wildmenu

" show line numbers
set number

" highlight search terms
set hlsearch

" options for diffsplit and vimdiff
set diffopt=filler,vertical

" command-line abbreviation to open help in tab
cabbrev help tab help

" map control+s to save/write file
nnoremap <silent> <c-s> :update<cr>

" map control+q to quit all
nnoremap <silent> <c-q> :qall<cr>

" normal mode map ctrl+h no highlight search terms, turns back on when searching
nnoremap <c-h> :nohlsearch<cr>

" enable status line
set laststatus=2

" enable ruler metrics
set ruler

" enable code comment fold markers
set foldmethod=marker

" unix style line endings \n
set fileformat=unix

" set backspace/delete to operate on indents, newlines
set backspace=indent,eol,start

" map Q to no-operation to disable ex mode
nnoremap Q <nop>

" switch to an existing tab if the buffer is open, or creating a new one if not
set switchbuf=usetab,newtab

" set whitespace to visible characters
"set listchars=eol:¶,tab:»›,trail:·,extends:▷,precedes:◁,space:·,nbsp:·

" toggle visibility of whitespace characters by control+l in normal mode
nnoremap <c-l> :set invlist list?<cr>

" toggle paste options
execute "set <a-p>=\ep"
nnoremap <a-p> :set invpaste paste?<cr>

"" set .md to markdown file extension
""autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"
"" enable fenced code block syntax highlighting
"let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java', 'php', 'c']

" enable 256 colors
set t_Co=256

" enable pathogen plugin
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" search by file using regex settings for ctrlp
let ctrlp_by_filename = 1
let ctrlp_regexp = 1
let ctrlp_show_hidden = 1

" nerd tree options
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

" enable custom color scheme
colorscheme forests

" set background=light
" colorscheme solarized
" hi TabLine      ctermfg=248         ctermbg=LightGray   cterm=NONE
" hi TabLineFill  ctermfg=248         ctermbg=LightGray   cterm=NONE
" hi TabLineSel   ctermfg=DarkGreen   ctermbg=White       cterm=NONE

" 24-bit true color
" let &t_8f="\e[38;2;%ld;%ld;%ldm"
" let &t_8b="\e[48;2;%ld;%ld;%ldm"
" set termguicolors

