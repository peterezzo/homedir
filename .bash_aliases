# start ssh-agent (linux)
if [ ! -f ~/.noagent ]; then
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
    fi
    if [[ ! "$SSH_AUTH_SOCK" ]]; then
        source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
    fi
fi

# this for ls?
export QUOTING_STYLE=literal

# umask 0002 is insanity
umask 0022

# so is non-UTC time
export TZ="Etc/UTC"

# do path
export PATH=~/bin:$PATH

# prompt from kali EVERYWHERE but also with the date
prompt_color='\[\033[;32m\]'
info_color='\[\033[1;34m\]'
prompt_symbol=㉿
if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
    prompt_color='\[\033[;94m\]'
    info_color='\[\033[1;31m\]'
    prompt_symbol=💀
fi
PS1=$prompt_color'┌──('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\D{%F %T}'$prompt_color']-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
unset prompt_color info_color prompt_symbol
