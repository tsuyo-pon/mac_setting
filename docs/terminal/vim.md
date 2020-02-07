Last Change: 2020/02/07 12:34:16.

auther: tsuyo-pon

# vim の設定などについて
vim の設定についてあれこれ書いてあります．

## Contents
1. 設定ファイルの場所
1. クリップボードとヤンクを連携させる
1. カラースキーマを使用可能にする
1. プラグインの導入
1. snippets の導入

## 設定ファイルの場所
[]({{{)
- 設定ファイルはhome直下に置く
    - プラグイン管理でvundle を使う場合(更新止まってます)
        - [.vimrc]()
    - プラグイン管理でdein を使う場合
        - [.vimrc]()
[](}}})

## クリップボードとヤンクを連携させる
[]({{{)
- vimのバージョンを確認．
    ```
    brew list vim
    ```
- クリップボードが生きていることを確認(8.1.1600とかは，各自の環境で変わります)．
- (+clipboardになってれば使える)
    ```
    /usr/local/Cellar/vim/8.1.1600/bin/vim --version | grep clipboard
    ```
- 以下のコマンドで，過去のvimをrenameする．
    ```
    sudo mv /usr/bin/vim /usr/bin/old_vim
    ```
    - うまくいかなかったら(permission deniedとか言われたら)
        - Macをシャットダウン
        - command + R を押しながら起動
        - 主に日本語を使用する．
        - ユーティリティからターミナルを起動
        - 以下のコマンドを打つ
            ```
            csrutil enable
            reboot
            ```
        - ターミナルを開いて，次のコマンドを打つ．
            ```
            sudo mv /usr/bin/vim /usr/bin/old_vim
            ```
- 過去のvimをrenameできたら，次のコマンドを打つ
    ```
    sudo ln /usr/local/Cellar/vim/8.1.1600/bin/vim /usr/bin/
    ```
- クリップボードが使えることを確認(+clipboardになってれば使える)
    ```
    vim --version | grep clipboard
    ```
    - 最後に(permission deniedとか言われてた人なら)
        - Macをシャットダウン
        - command + R を押しながら起動
        - 主に日本語を使用する．
        - ユーティリティからターミナルを起動
            ```
            csrutil enable
            reboot
            ```
[](}}})

## カラースキーマを使用可能にする
[]({{{)
- 以下のコマンドで，syntaxを利用可能にする
    ```
    ln -s /usr/local/Cellar/vim/8.1.2200/share/vim/vim81 /usr/local/share/vim
    ```
[](}}})

## プラグインの導入
[]({{{)
- vundle の場合(更新止まってます)
    - 以下のコマンドで，プラグインをgithubから持ってくる．
        ```
        source ~/mac_setting/mode_vundle/vim_plugin_list.txt
        ```
    - プラグインをインストール
        ```
        vim +PluginInstall +qall
        ```
- dein の場合
[](}}})

## snippets の導入
[]({{{)
- 以下のコマンドでsnippetファイルを共有しておく．
    ```
    cp ~/.vim/snippets/*.snip ~/mac_setting/snip/
    ```
- 以下のコマンドでsnippetファイルを使えるようにする．
    ```
    cp ~/mac_setting/snip/*.snip ~/.vim/snippets/
    ```
- 以下のコマンドをvimで展開(snippetを追記)
    ```
    :NeoSnippetEdit
    ```
[](}}})
