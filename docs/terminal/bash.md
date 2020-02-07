Last Change: 2020/02/07 12:56:35.

auther: tsuyo-pon

# bash の設定
bash の設定についてあれこれ書いてあります．

## Contents
1. 設定ファイルの場所
1. 設定の反映

## 設定ファイルの場所
[]({{{)
- 設定ファイル
    - [.bash_profile](../../conf/.bash_profile)
    - [.bashrc](../../conf/.bashrc)
- 設定ファイルはhome直下に置く
    ```
    cp ../../conf/.bash_profile ~/
    cp ../../conf/.bashrc ~/
    ```
[](}}})

## 設定の反映
[]({{{)
- 設定ファイルを反映させる
    ```
    source ~/.bash_profile
    ```
[](}}})
