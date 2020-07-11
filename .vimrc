au BufNewFile,BufRead *.py
\ set tabstop=4         |
\ set softtabstop=4     |
\ set shiftwidth=4      |
\ set textwidth=79      |
\ set expandtab         |
\ set autoindent        |
\ set fileformat=unix

set nu
syntax on
set tabstop=4
filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G
