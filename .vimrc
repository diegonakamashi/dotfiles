" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Vim shortcuts + Tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Vim Tabs
nnoremap <c-t>      :tabnew .<CR>
nnoremap <c-x>      :tabclose<CR>
nnoremap <c-Left>   :tabprevious<CR>
nnoremap <c-Right>  :tabnext<CR>

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

filetype plugin on
syntax on
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

" CtrlP
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ##########NEOCOMPLCACHE#############
" neocomplcache
" Bundle 'Shougo/neocomplcache'
" let g:acp_enableAtStartup = 0                           " Disable AutoComplPop
" let g:neocomplcache_enable_at_startup = 1               " Use neocomplcache
" let g:neocomplcache_enable_smart_case = 1               " Use smartcase
" let g:neocomplcache_enable_camel_case_completion = 1    " Use camel case completion
" let g:neocomplcache_enable_underbar_completion = 1      " Use underbar completion
" let g:neocomplcache_min_syntax_length = 3               " Set minimum syntax keyword length

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
" let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" ###########END NEOCOMPLCACHE######################"

" ###########################YouCompleteMe##################
 Bundle 'Valloric/YouCompleteMe' 
" ###########################END YouCompleteMe#############


" Vimwiki
Bundle 'vim-scripts/vimwiki'

" Coloschemes
Bundle 'flazz/vim-colorschemes'
