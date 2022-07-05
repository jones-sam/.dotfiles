let g:go_addtags_transform = 'camelcase'
let g:go_auto_type_info = 1

augroup go
    autocmd FileType go nmap <leader>M <Plug>(go-metalinter)
augroup END
