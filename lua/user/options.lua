vim.cmd [[au FileType c,cpp setlocal comments-=:// comments+=f://au FileType lua,py,go,c,cpp setlocal comments-=:// comments+=f://
]]
vim.cmd [[if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif]]
