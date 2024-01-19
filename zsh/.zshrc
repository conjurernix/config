# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"
plug "zap-zsh/completions"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Aliases
alias ll="ls -la"
alias cat=bat
alias convex="$HOME/convex/convex"

#env vars

export SDKMAN_DIR="$XDG_DATA_HOME"/sdkman
export ANDROID_HOME="$HOME/Library/Android/sdk"
export XDG_CONFIG_HOME="$HOME/.config"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh

# Path
export PATH=".local/bin:$PATH"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/build-tools:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="/usr/local/texlive/2023basic/bin/universal-darwin/:$PATH"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
