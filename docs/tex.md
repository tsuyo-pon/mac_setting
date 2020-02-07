Last Change: 2020/02/07 12:14:03.

auther: tsuyo-pon

# TeX 系
TeX 導入の話が書いてあります．

## Contents
1. TeX インストール
1. TeX アップデート

## contents1
[]({{{)
- TeXインストール
    ```
    sudo tlmgr update --self --all
    sudo cjk-gs-integrate --link-texmf --force
    sudo mktexlsr
    sudo kanji-config-updmap-sys hiragino-elcapitan-pron
    ```
[](}}})

## contents2
[]({{{)
- TeXのアップデート
    ```
    sudo tlmgr update --self --all
    ```
[](}}})
