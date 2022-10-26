let g:go_addtags_transform = 'camelcase'

augroup go
    autocmd FileType go nmap <leader>M <Plug>(go-metalinter)
augroup END
