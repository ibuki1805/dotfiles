" vim-airline
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
let g:airline_section_a = airline#section#create(['mode', 'crypt'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
