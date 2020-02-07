Last Change: 2020/02/07 12:13:16.

auther: tsuyo-pon

# pyenv
pyenv 周りの話が書いてあります．

## Contents
1. pyenv で python の必要なバージョンをインストール
1. pyenv の設定方法

## pyenv で python の必要なバージョンをインストールする
[]({{{)
- pyenv で python の必要なバージョンをインストールする
    - pyenv_installer に記載
        ```
        source ~/mac_setting/install_list/pyenv.txt
        ```
[](}}})

## pyenv の設定方法
[]({{{)
- pyenv は local の設定の方が global の設定よりも優先される．
- pyenv で python のバージョンをディレクトリごとに設定する．
    ```
    pyenv local 3.7.3
    ```
- pyenv で python のバージョンを全体で設定する．
    ```
    pyenv global 3.7.3
    ```
[](}}})
