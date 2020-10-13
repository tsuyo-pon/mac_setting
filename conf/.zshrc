#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:$HOME/mac_tsuyo-pon_tools      # 自作コマンドにPATHを通す
export PYENV_ROOT="$HOME/.pyenv"                 # pyenvを使えるようにする
export PATH="$PYENV_ROOT/bin:$PATH"              # pyenvを使えるようにする
eval "$(pyenv init -)"                           # pyenvを使えるようにする
eval "$(gh completion -s zsh)"                   # GitHub のコマンド補完設定
fpath=(path/to/zsh-completions/src $fpath)
