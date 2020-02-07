Last Change: 2019/12/13 18:58:39.

auther: tsuyo-pon

# bash の設定
bash の設定についてあれこれ書いてあります．

## Contents
1. 設定ファイルの場所
1. 設定の反映

## 設定ファイルの場所
[]({{{)
- 設定ファイル
    - [.bash_profile](../../.bash_profile)
    - [.bashrc](../../.bashrc)
- 設定ファイルはhome直下に置く
    ```
    cp ../../.bash_profile ~/
    cp ../../.bashrc ~/
    ```
[](}}})

## 設定の反映
[]({{{)
- 設定ファイルを反映させる
    ```
    source ~/.bash_profile
    ```
[](}}})
