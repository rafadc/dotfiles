# Setup fzf
# ---------
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
        export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
    fi

    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

    source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi
