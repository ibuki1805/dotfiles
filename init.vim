" dein
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
"call dein#add('Shougo/dein.vim')
"call dein#add('tomtom/t_comment_vim')
"call dein#add('tomasr/molokai')
" call map(dein#check_clean(), \"delete(v:val, 'rf')")
"call dein#recache_runtimepath()

if dein#load_state(expand('~/.config/nvim/dein'))
    call dein#begin(expand('~/.config/nvim/dein'))

    let g:dein_dir = expand('~/dotfiles')
    let s:toml = g:dein_dir . '/dein.toml'
    let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'

    " TOMLファイルにpluginを記述
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" 未インストールを確認
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on

"basic settings
"encodeing
set encoding=utf-8
set fenc=utf-8
scriptencoding

set nobackup "DNT make backup files. Never save automatically.
set noswapfile "DNT make swap files.
set autoread "changed after opend file on vim and not edited on vim update the file auto"
set hidden "allow open other files without saving current file.
set showcmd "show on the entering command on status.
set nowritebackup "never make backup before overwriting.
set mouse=a "enable use mouse.

"key config
"leader key
let mapleader = "\<SPACE>"
"escape from insert mode by jj
inoremap jj <Esc>
"move beyond row.
set whichwrap=b,s,h,l,<,>,[,],~
"enable cursor movement in display line units.
nnoremap j gj
nnoremap k gk
"move to begin
nnoremap <S-h> 0
"move to end
nnoremap <S-l> $
"unite indende to pasted place
nnoremap p ]p
nnoremap P ]P
"enable backspace beyond rows
set backspace=indent,eol,start
"window control
nnoremap <Leader>s :%s<space>
nnoremap <Leader>\| :vsplit<space>
nnoremap <Leader>- :split<space>
nnoremap <C-d> :close<cr>
"window move
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader><Leader> <C-w>w
nnoremap <Leader><Left> <C-w><Left>
nnoremap <Leader><Right> <C-w><Right>
nnoremap <Leader><Up> <C-w><Up>
nnoremap <Leader><Down> <C-w><Down>


"edit setting
"yunk to clipboard
set clipboard=unnamedplus
"always global
set gdefault
"delete space located the end of row when save the file
autocmd BufWritePre * :%s/\s\+$//ge

"appearance settings
colorscheme molokai
set t_Co=256
set number "visible row number
set title "visible title
set cursorline "emphasis current row
" set cursorcolumn "emphasis current colomn
set virtualedit=onemore "let move one more left from the end of row
set visualbell "visualise bell sound
set showmatch "highlight a pair of () when entering the other side
set laststatus=2 "always show status line
set wildmode=list:longest "complement on commandline
set shellslash "use / for path delimiter on Windows
set showmatch matchtime=1 "highlight a pair of () when scope on
syntax on "syntax highlight
set scrolloff=3
" set spell "spell checking
" set spelllang=en,cjk "exclusion Japanese
" set foldmethod=indent "fold by indend

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 開行時に前の行のインデントを継続する
set autoindent
" 貼付け時tabを入れない
"set paste
" ペーストモード解除
"autocmd InsertLeave * set nopaste

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

if has('persistent_undo')
  set undodir=~/.config/nvim/undo
  set undofile
endif




" ale
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_colmun_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_cursor = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 3
let g:airline#extensions#ale#enabled = 1
let g:python3_host_prog = '/home/amsl/.pyenv/versions/3.9.4/bin/python'
" let g:python3_host_prog = '/usr/bin/python3'

function! s:sudo_write_current_buffer() abort
    if has('nvim')
        let s:askpass_path = '/tmp/askpass'
        let s:password = input("Enter password: ")
        let $SUDO_ASKPASS  = s:askpass_path

        try
            call delete(s:askpass_path)
            call writefile(['#!/bin/sh'],                 s:askpass_path, 'a')
            call writefile(["echo '" . s:password . "'"], s:askpass_path, 'a')
            call setfperm(s:askpass_path, "rwx------")
            write ! sudo -A tee % > /dev/null
        finally
            unlet s:password
            call delete(s:askpass_path)
        endtry
    else
        write ! sudo tee % > /dev/null
    endif
endfunction
command! SudoWrite call s:sudo_write_current_buffer()

" :command SudoWrite w !sudo  tee % > /dev/null
"terminal mode settings
:tnoremap jj  <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
autocmd TermOpen * startinsert


"load settings of plugins
source ~/dotfiles/plugin/airline.vim
source ~/dotfiles/plugin/nerdtree.vim
source ~/dotfiles/plugin/deoplete.vim
source ~/dotfiles/plugin/yankround.vim
source ~/dotfiles/plugin/coc.vim
source ~/dotfiles/plugin/denite.vim
source ~/dotfiles/plugin/vim-figitive.vim
source ~/dotfiles/plugin/vim-quickrun.vim
source ~/dotfiles/plugin/treesitter.vim
" source ~/dotfiles/plugin/qpdfciew.vim
" source ~/dotfiles/plugin/vimtex.vim
" source ~/dotfiles/plugin/ddu.vim
