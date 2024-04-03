alias ..='cd ..'
alias latex='docker run -v `pwd`:/tmp latex pdflatex'

# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
#PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
 PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]\[\033[01;32m\]\[\033[00m\]:\[\033[01;34m\]\[\033[01;31m\]$(parse_git_branch)\[\033[00m\] -> \[\033[0m\]"
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

promptFunc() {

    branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    if [ ! $branch ]; then
        PS1="\[\e[32m\]"${PWD}"\[\e[00m\]$ "
    else
        PS1="\[\e[32m\]\W: \[\e[91m\]("${branch}")\[\e[00m\]-> "
    fi
}

export PROMPT_COMMAND="promptFunc"