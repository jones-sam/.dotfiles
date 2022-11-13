" Moving lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" :w === :W
com! W w

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

vnoremap <leader>p "_dP

" yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

nnoremap <leader>cf <CMD>lua require('cmp').setup.buffer { enabled = false }<CR>
nnoremap <leader>ct <CMD>lua require('cmp').setup.buffer { enabled = true }<CR>
