# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"
plug "zap-zsh/completions"

# keybindings
bindkey ";3D" backward-word    # Option + Left Arrow
bindkey ";3C" forward-word     # Option + Right Arrow
bindkey ";9D" beginning-of-line  # Command + Left Arrow
bindkey ";9C" end-of-line        # Command + Right Arrow

# Load and initialise completion system
autoload -Uz compinit
compinit

# Aliases
alias ll="ls -la"
alias cat=bat
alias convex="$HOME/convex/convex"
alias biff="clj -M:dev"
#env vars

export SDKMAN_DIR="$XDG_DATA_HOME"/sdkman
export ANDROID_HOME="$HOME/Library/Android/sdk"
export XDG_CONFIG_HOME="$HOME/.config"

# OMP and MPI vars

export OpenMP_ROOT=$(brew --prefix)/opt/libomp

export MPI_ROOT=$(brew info open-mpi | grep -o "$(brew --prefix)/Cellar/open-mpi/[0-9]*\.[0-9]*\.[0-9]*" | head -1)

export MPI_INCLUDE_PATH="$(brew --prefix)/opt/openmpi/include"
export MPI_LIBRARIES="$(brew --prefix)/opt/openmpi/lib"

export MPI_COMPILE_FLAGS="-I$(brew --prefix)/opt/openmpi/include"
export MPI_LINK_FLAGS="-L$(brew --prefix)/opt/openmpi/lib -lmpi"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh
source <(fzf --zsh)

# Completions
if command -v ngrok &>/dev/null; then
   eval "$(ngrok completion)"
fi

# Path
export PATH=".local/bin:$PATH"
export PATH="$HOME/.privates:$PATH"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/build-tools:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools:$PATH"
export PATH="$(brew --prefix)/opt/postgresql@15/bin:$PATH"
export PATH="$(brew --prefix)/opt/openmpi/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
