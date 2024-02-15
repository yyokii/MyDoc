# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/git-prompt.sh
# ステージングされている場合「＋」、そうでなければ「＊」が表示される
GIT_PS1_SHOWDIRTYSTATE=true
# 新規ファイルがあるかどうかを表示
GIT_PS1_SHOWUNTRACKEDFILES=true
# 表示名等の変更
setopt PROMPT_SUBST ; PS1='%F{cyan}%n%f: %F{cyan}%~%f %F{magenta}$(__git_ps1 "(%s)")%f
\$ '