" Moving lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" :w === :W
com! W w

" delete without yanking
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
