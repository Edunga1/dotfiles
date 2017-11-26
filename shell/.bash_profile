# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# History Setup
export HISTTIMEFORMAT="%d/%m/%y %T "

# LOCALE 한글 꺠짐 방지
export LC_ALL=ko_KR.UTF-8

# Java Env
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home

# Android SDK PATH
export PATH=/Users/park/Library/Android/sdk/platform-tools:/Users/park/Library/Android/sdk:/Users/park/Library/Android/sdk/build-tools/25.0.3:$PATH

# grep 출력 시 매칭하는 단어 강조
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export PATH="/usr/local/sbin:$PATH"
