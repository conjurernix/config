ZDOTDIR=$HOME/.config/zsh
export OpenMP_ROOT=$(brew --prefix)/opt/libomp

export MPI_INCLUDE_PATH="$(brew --prefix)/opt/openmpi/include"
export MPI_LIBRARIES="$(brew --prefix)/opt/openmpi/lib"

export MPI_COMPILE_FLAGS="-I$(brew --prefix)/opt/openmpi/include"
export MPI_LINK_FLAGS="-L$(brew --prefix)/opt/openmpi/lib -lmpi"

