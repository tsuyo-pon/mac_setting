Last Change: 2020/02/07 12:38:17.

auther: tsuyo-pon

# zsh の設定
zsh の設定についてあれこれ書いてあります．

## Contents
1. 設定ファイルの場所
1. zsh への切り替え
1. prezto の活用

## 設定ファイルの場所
[]({{{)
- 設定ファイルはhome直下に置く
- [.zprofile](../../.zprofile)
- [.zshrc](../../.zshrc)
    ```
    source ~/.zsh_profile
    ```
[](}}})

## zsh への切り替え
[]({{{)
- zshの場所を探す
    ```
    which zsh
    ```
- zsh の場所を /etc/shells の最後に書き足す．
    ```
    sudo vim /etc/shells
    ```
- 起動シェルを変更する．
    ```
    chsh -s /usr/local/bin/zsh
    ```
[](}}})

## prezto の活用
[]({{{)
- preztoをクローンしてくる
    ```
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    ```
- シェルで以下のコマンドを打つ
    ```
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    ```
- デフォルトで立ち上がるエディタをvim に変更する
    ```
    vim ~/.zprofile
    ```
    - 以下のように修正
        ```
        # Editors
        export EDITOR='nvim'
        export VISUAL='nvim'
        ```
- zsh のテーマを変更
    ```
    vim ~/.zpreztorc
    ```
    - テーマをpureに変更(趣味)，探すのは大変なので以下のワードで検索をかける．
        ```
        zstyle ':prezto:module:prompt'
        ```
    - 'pure'じゃなくても良いが，個人的に'pure'が好き
        ```
        zstyle ':prezto:module:prompt' theme 'pure'
        ```
- .zshrc に以下を追加
    ```
    fpath=(path/to/zsh-completions/src $fpath)
    ```
- zcompdump をリビルドする
    ```
    rm -f ~/.zcompdump; compinit
    ```
- カレントディレクトリの色を変更する
    ```
    vim ~/.zprezto/modules/prompt/functions/prompt_pure_setup
    ```
    - 加筆だか修正だか忘れた．以下のワードで検索をかける．
        ```
        Set the path
        ```
    - 次のようにする．
        ```
        # Set the path
        preprompt_parts += ('%F{cyan}%~%f')
        ```
- lsの色を変更する
    ```
    vim ~/.zprezto/modules/utility/init.zsh
    ```
    - 以下のワードで検索をかける．確か加筆ではなく修正
        ```
        export
        ```
    - 色は完全に好み．以下の設定が気に入らない人は，自分で調べてなんとかしてください．
        ```
        export LSCOLORS='gxfxcxdxbxGxDxabagacad'
        export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
        ```
[](}}})
