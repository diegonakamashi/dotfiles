set t_Co=256
set nocompatible

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
"set cursorline
set synmaxcol=300

" Bubble Text
" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

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

" colorscheme solarized
Plug 'altercation/vim-colors-solarized'

" CoffeeScript
Plug 'kchmck/vim-coffee-script'

" Snips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Vim Multiple Cusors
Plug 'terryma/vim-multiple-cursors'

" powerline
Plug 'itchyny/lightline.vim'

Plug 'tomasr/molokai'

" Git
Plug 'tpope/vim-fugitive'

" vim-javascript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug  'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}

Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'vim-scripts/CSApprox'
Plug 'ervandew/supertab'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }


Plug 'christoomey/vim-tmux-navigator'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'benekastah/neomake'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'tpope/vim-surround'
Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'scrooloose/nerdtree'

Plug 'w0ng/vim-hybrid'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

Plug 'morhetz/gruvbox'
call plug#end()

" CSApprox, for emulating gvim colors on teh terminal
if !has('gui_running') && exists(':CSApprox')
  CSApprox
endif

if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
   set t_Co=256
endif

" Uses <C-p> as fzf trigger
nnoremap <silent> <C-p> :FZF<CR>

let g:rehash256 = 1

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'

"NeoMake
let g:neomake_javascript_eslint_maker = {
        \ 'args': ['-f', 'compact', '-c', '/home/diegonakamashi/.eslint.json'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized

" lightline
let g:lightline = {
 \ 'active': {
 \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
 \ },
 \ 'component': {
 \   'readonly': '%{&readonly?"":""}',
 \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
 \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
 \ },
 \ 'component_visible_condition': {
 \   'readonly': '(&filetype!="help"&& &readonly)',
 \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
 \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
 \ },
\ 'separator': { 'left': '⮀', 'right': '⮂' },
\ 'subseparator': { 'left': '⮁', 'right': '⮃' }
 \ }


" Open edit mode like NERDTree
let g:netrw_liststyle=3
nnoremap <F2> :NERDTreeToggle<CR>
set background=dark
colorscheme gruvbox


