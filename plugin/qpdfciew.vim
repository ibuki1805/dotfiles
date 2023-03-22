" Starting server for LaTeX inverse search.
function! s:myinversetex()
    if !filereadable('/tmp/sv4nvim' . expand("%:p"))
        call mkdir('/tmp/sv4nvim' . expand("%:p:h"),"p")
        call serverstart('/tmp/sv4nvim' . expand("%:p"))
    endif
endfunction
command! Serverorig call s:myinversetex()

augroup latex_new
" texソースのときに自動実行
autocmd!
autocmd BufRead *.tex Serverorig
autocmd BufRead *.ltx Serverorig
autocmd BufWritePost *.tex Serverorig
autocmd BufWritePost *.ltx Serverorig
augroup END
