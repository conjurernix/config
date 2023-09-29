# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Aliases
alias ll="ls -la"
alias cat=bat

#env vars

export SDKMAN_DIR="$XDG_DATA_HOME"/sdkman
export ANDROID_HOME="~/Library/Android/sdk"
export XDG_CONFIG_HOME="$HOME/.config"


# Path
export PATH=".local/bin:$PATH"
export PATH=~/Android/Sdk/platform-tools:$PATH
export PATH=~/Android/Sdk/build-tools:$PATH
export PATH=~/Android/Sdk/cmdline-tools:$PATH


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
