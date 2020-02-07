" ------------------------------------------------------------
" dein.vim set up
" ------------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('davidhalter/jedi-vim')             " python動的補完
  call dein#add('Shougo/deoplete.nvim')             " 単語補完
  call dein#add('deoplete-plugins/deoplete-jedi')   " python静的補完
  call dein#add('tomasr/molokai')                   " vimの色合いが綺麗になる．
  call dein#add('Yggdroot/indentLine')              " インデントライン可視化
  call dein#add('bronson/vim-trailing-whitespace')  " 末尾の全角と半角の空白文字を赤くハイライト
  call dein#add('dhruvasagar/vim-table-mode')       " テーブルを整形してくれる
  call dein#add('dense-analysis/ale')               " リアルタイム構文チェッカー管理ツール
  call dein#add('Shougo/neocomplcache.vim')         " vim補完
  call dein#add('Shougo/neosnippet-snippets')       " テンプレート作成機能のテンプレート
  call dein#add('Shougo/neosnippet.vim')            " テンプレート作成機能
  call dein#add('vim-scripts/autodate.vim')         " ファイル保存時，自動でタイムスタンプを記述
  call dein#add('glacambre/firenvim', { 'hook_post_update': { _ -> firenvim#install(0) } })  " ブラウザでnvimを使いたい

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" 導入したプラグインの設定
" {{{
" indentLine
" {{{
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
" let g:indentLine_fileTypeExclude = ['help', 'markdown']
" }}}

" molokai
" {{{
colorscheme molokai " カラースキームにmolokaiを設定する

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける
" }}}

" vim-table-mode
let g:table_mode_corner = '|'

" ale
" {{{
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
" }}}

" snippet
" {{{
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
"
" jedi
" {{{
let g:deoplete#sources#jedi#server_timeout=100
let g:deoplete#sources#jedi#statement_length=100

" jedi本体の補完は切る（deoplete-jediで非同期処理をしてくれるため）
let g:jedi#completions_enabled = 0
" }}}
" }}}
"
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

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
