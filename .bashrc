#!/bin/bash


# Set shell prompt 
# Preview: vscode ➜ /workspaces/Teeleport (main) $ 
export PS1='\[\]`export XIT=$? && [ ! -z "${GITHUB_USER:-}" ] && echo -n "\[\033[0;32m\]@${GITHUB_USER:-} " || echo -n "\[\033[0;32m\]\u " && [ "$XIT" -ne "0" ] && echo -n "\[\033[1;31m\]➜" || echo -n "\[\033[0m\]➜"` \[\033[38;5;216m\]\w `if [ "$(git config --get devcontainers-theme.hide-status 2>/dev/null)" != 1 ] && [ "$(git config --get codespaces-theme.hide-status 2>/dev/null)" != 1 ]; then export BRANCH="$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git --no-optional-locks rev-parse --short HEAD 2>/dev/null)"; if [ "${BRANCH:-}" != "" ]; then echo -n "\[\033[0;36m\](\[\033[1;32m\]${BRANCH:-}" && if [ "$(git config --get devcontainers-theme.show-dirty 2>/dev/null)" = 1 ] && git --no-optional-locks ls-files --error-unmatch -m --directory --no-empty-directory -o --exclude-standard ":/*" > /dev/null 2>&1; then echo -n " \[\033[1;33m\]✗"; fi && echo -n "\[\033[0;36m\]) "; fi; fi`\[\033[0m\]$ \[\]'
