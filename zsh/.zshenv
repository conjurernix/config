ZDOTDIR=$HOME/.config/zsh
export OpenMP_ROOT=$(brew --prefix)/opt/libomp

export MPI_ROOT=$(brew info open-mpi | grep -o "$(brew --prefix)/Cellar/open-mpi/[0-9]*\.[0-9]*\.[0-9]*" | head -1)

export MPI_INCLUDE_PATH="$(brew --prefix)/opt/openmpi/include"
export MPI_LIBRARIES="$(brew --prefix)/opt/openmpi/lib"

export MPI_COMPILE_FLAGS="-I$(brew --prefix)/opt/openmpi/include"
export MPI_LINK_FLAGS="-L$(brew --prefix)/opt/openmpi/lib -lmpi"

