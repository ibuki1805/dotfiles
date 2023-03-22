" 手動でコンパイル
let g:vimtex_compiler_latexmk = { 'continuous' : 0,}
" qpdfviewでpdfプレビュー
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
