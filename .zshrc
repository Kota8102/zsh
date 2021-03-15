# Created by newuser for 5.8

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

# prompt
PROMPT='%F{magenta}%B%n%b%f@%F{blue}%U%m%u%f %F{green}[%~]%f %# '

### alias

# ll
alias ll='ls -lh'

# よく使うコマンド
alias h='history'

#zsh
alias szsh='source ~/.zshrc'


# history 保存数
HISTSIZE=100000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

### option

# 同時に起動しているhistoryを共有
setopt share_history

# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups

# cd無しでもディレクトリ移動
setopt auto_cd

# 以前移動したディレクトリを表示
setopt auto_pushd

# コマンドのスペルミスを指摘
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "
