#!/bin/bash

# Set shell prompt via PROMPT_COMMAND for subshell compatibility
# Preview: vscode ➜ /workspaces/Teeleport (main) $
__dotfile_prompt() {
    local xit=$?

    # User identifier
    if [ -n "${GITHUB_USER:-}" ]; then
        PS1="\[\033[0;32m\]@${GITHUB_USER} "
    else
        PS1="\[\033[0;32m\]\u "
    fi

    # Arrow (red on non-zero exit)
    if [ "$xit" -ne 0 ]; then
        PS1+="\[\033[1;31m\]➜"
    else
        PS1+="\[\033[0m\]➜"
    fi

    # Working directory
    PS1+=" \[\033[38;5;216m\]\w "

    # Git branch
    if [ "$(git config --get devcontainers-theme.hide-status 2>/dev/null)" != 1 ] && \
       [ "$(git config --get codespaces-theme.hide-status 2>/dev/null)" != 1 ]; then
        local branch
        branch="$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || \
                   git --no-optional-locks rev-parse --short HEAD 2>/dev/null)"
        if [ -n "$branch" ]; then
            PS1+="\[\033[0;36m\](\[\033[1;32m\]${branch}"
            if [ "$(git config --get devcontainers-theme.show-dirty 2>/dev/null)" = 1 ] && \
               git --no-optional-locks ls-files --error-unmatch -m --directory --no-empty-directory \
                   -o --exclude-standard ":/*" > /dev/null 2>&1; then
                PS1+=" \[\033[1;33m\]✗"
            fi
            PS1+="\[\033[0;36m\]) "
        fi
    fi

    PS1+="\[\033[0m\]$ "
}
PROMPT_COMMAND='__dotfile_prompt'

# ll baby 
alias ll='ls -alFh --color=auto'

# Danger 
alias claude='claude --dangerously-skip-permissions'