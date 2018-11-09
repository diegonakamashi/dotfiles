" set t_Co=256
set encoding=utf-8
set nocompatible
let g:loaded_python_provider = 1

" Remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

set ttimeoutlen=0
filetype plugin on
set clipboard+=unnamedplus          " Share System Clipboard
syntax enable
set noswapfile                      " No swap file
set ignorecase  	                  " Do case in sensitive matching with
set smartcase		                    " be sensitive when there's a capital letter
set nowrap
set textwidth=0	                    " Don't wrap lines by default
set tabstop=2                       " tell vim how many columns a tab counts for
set softtabstop=2                   " control how many columns vim uses when you hit Tab in insert mode.
set shiftwidth=2                    " control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation
set expandtab                       " Make tabs into spaces (set by tabstop)
set smarttab                        " Smarter tab levels
set autoindent
set backspace=2                     " make backspace work like most other app
set number
set cursorline
set synmaxcol=300

" Vim shortcuts + Tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Mapping xclip clipboard support
if system("echo $DISPLAY") =~ ""
  vmap <C-c> y: call system("> /tmp/theClipboardWithoutX", getreg("\""))<CR>
  map <C-v> :call setreg("\"", system("< /tmp/theClipboardWithoutX"))<CR>p
else
  vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
  map <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
endif

call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'

Plug 'rakr/vim-one'

" Git
Plug 'tpope/vim-fugitive'

" vim-javascript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}

Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'vim-scripts/CSApprox'
Plug 'ervandew/supertab'

Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'roxma/ncm-rct-complete'

Plug 'Raimondi/delimitMate'

Plug 'w0rp/ale'
Plug 'mattn/emmet-vim', {'for': ['html', 'javascript', 'eruby']}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'tpope/vim-surround'
Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'digitaltoad/vim-jade', {'for': 'jade'}
Plug 'elmcast/elm-vim', {'for': 'elm'}

Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" Uses <C-p> as fzf trigger
nnoremap <silent> <C-p> :FZF<CR>

" Uses <C-a> as fzf on buffers
nnoremap <silent> <C-l> :Buffers<CR>

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" Apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

nmap ; :

let g:jsx_ext_required = 0

" Open edit mode like NERDTree
let g:netrw_liststyle=3
nnoremap <F2> :NERDTreeToggle<CR>


" COLORSCHEME
set termguicolors
colorscheme one
set background=dark

