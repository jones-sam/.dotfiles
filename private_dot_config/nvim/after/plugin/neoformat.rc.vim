
let g:neoformat_try_node_exe = 1

" Neoformat format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END


