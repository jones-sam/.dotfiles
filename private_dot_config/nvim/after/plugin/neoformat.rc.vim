
let g:neoformat_try_node_exe = 1

" Neoformat format on save
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry
augroup END
