" プラグインを導入
" {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" }}}

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
" {{{
Plugin 'davidhalter/jedi-vim'             " python補完
Plugin 'tomasr/molokai'                   " vimの色合いが綺麗になる．
Plugin 'Yggdroot/indentLine'              " インデントライン可視化
Plugin 'bronson/vim-trailing-whitespace'  " 末尾の全角と半角の空白文字を赤くハイライト
Plugin 'dhruvasagar/vim-table-mode'       " テーブルを整形してくれる
Plugin 'dense-analysis/ale'               " リアルタイム構文チェッカー管理ツール
Plugin 'Shougo/neocomplcache.vim'         " vim補完
Plugin 'Shougo/neosnippet.vim'            " テンプレート作成機能
Plugin 'Shougo/neosnippet-snippets'       " テンプレート作成機能のテンプレート
Plugin 'vim-scripts/autodate.vim'         " ファイル保存時，自動でタイムスタンプを記述

call vundle#end()
filetype plugin indent on
" }}}

" 導入したプラグインの設定
" {{{
" indentLine
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
" let g:indentLine_fileTypeExclude = ['help', 'markdown']

" molokai
colorscheme molokai " カラースキームにmolokaiを設定する

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける

" vim-table-mode
let g:table_mode_corner = '|'

" ale
" flake8をLinterとして登録
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ }
" 各ツールをFixerとして登録
let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ }
" ファイル保存時に自動的にFix
let g:ale_fix_on_save = 1

" snippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'
" }}}

" autodate
let autodate_format = '%Y/%m/%d %H:%M:%S'    " Last Change: . を検出して記述する日付の設定


" カーソル移動
" {{{
set whichwrap=b,s,h,l,<,>,[,],~    " 行末からのカーソル移動を可能にする
" }}}

" 検索
"{{{
set incsearch     " 検索ワードの最初の文字を入力した時点で検索を開始する
set smartcase     " 小文字のみで検索したときに大文字小文字を無視する
set hlsearch      " 検索結果をハイライト表示する
"}}}

" インデント
" {{{
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4  " 自動インデントでずれる幅
" }}}

" 表示系
" {{{
set number                    " 行番号を表示
set foldmethod=marker         " vim内の畳み込み
set laststatus=2              " ステータスラインを常に表示
set cursorline                " カーソルラインを表示
set cursorcolumn              " カラムラインを表示
set ruler                     " ルーラーを表示
set list                      " 見えない文字の可視化
set showmatch
set matchtime=1
" highlight CursorLine cterm=none ctermbg=darkgray    " カーソルラインの色を変更
" highlight CursorColumn cterm=none ctermbg=darkgray " カーソルラインの色を変更
highlight Visual cterm=none ctermbg=darkgray  " Visual modeの色を変更
" }}}

set clipboard+=unnamed          " クリップボードをvimで使える
set backspace=indent,eol,start  " バックスペースを有効化

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
