set number relativenumber
set scrolloff=14
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
" Incremental search that shows matches as you type
set incsearch

" Highlight search matches
set hlsearch

" Block cursor in normal mode
autocmd VimEnter,InsertLeave * silent! execute "!echo -ne '\e[2 q'"

" Slash cursor in insert mode
autocmd InsertEnter * silent! execute "!echo -ne '\e[6 q'"
