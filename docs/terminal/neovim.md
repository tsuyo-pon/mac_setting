Last Change: 2020/02/07 12:28:51.

auther: tsuyo-pon

# neovim の導入から設定など
neovim について何とか書いていこうと思っています．

Neovim への移行を決心したのは，Firenvim の存在です．

ブラウザ上で vim の キーバインドで動けるのは大変魅力的でした (なんか思ってたのと違った)．

## Contents
1. neovim のインストール
1. neovim の初期設定
1. Python の連携
1. dein の導入
1. init.vim の設定
1. ブラウザの設定

## neovim のインストール
- neovim をインストールしていない場合は，homebrew からインストールしてください．
    ```
    brew install neovim
    ```
## neovim の初期設定
[]({{{)
- Neovim は，home直下に.config/nvim を作成する必要があります．
- 以下のコマンドで必要なディレクトリ・ファイルを作成しましょう．
    ```
    mkdir -p ~/.config/nvim
    touch ~/.config/nvim/init.vim
    ```
- vim で言う所の.vimrc は，neovim では，init.vim と言います．
[](}}})

## Python の連携
[]({{{)
- Neovim は，pythonと連携させる必要があるそうです．
- 以下のコマンドで連携しましょう．
    ```
    pip install neovim
    ```
[](}}})

## dein の導入
[]({{{)
- プラグイン管理のための dein を導入
- 以下のコマンドを実行
    ```
    mkdir ~/.vim/dein
    cd ~/.vim/dein
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.vim/dein
    ```
[](}}})

## init.vim の設定
[]({{{)
- init.vim を設定する．
    ```
    cp ~/mac_setting/mode_dein/init.vim ~/.config/nvim/init.vim
    ```
- 手元で書き換えた時に，修正版を更新する
    ```
    cp ~/.config/nvim/init.vim ~/mac_setting/mode_dein/init.vim
    ```
[](}}})

## ブラウザの設定
[]({{{)
- 以下のウェブサイトに行って，Firenvim をブラウザに追加する．
    - [chrome](https://chrome.google.com/webstore/detail/firenvim/egpjdkipkomnmjhjmdamaniclmdlobbo)
    - [Firefox](https://addons.mozilla.org/en-US/firefox/addon/firenvim/)
[](}}})
