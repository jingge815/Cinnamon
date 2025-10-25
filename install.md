# Prerequisties:
- CMake (at least version 3.22)
- just
- A somewhat recent Python installation (>=3.7?)

# Make sure you install build dependencies:
- sudo add-apt-repository ppa:deadsnakes/ppa
- sudo apt install software-properties-common
- sudo apt update
- sudo apt-get install clang ninja-build mold libvulkan-dev ccache python3.8 libpython3.8-dev

# Clone the Repository:
- git clone https://github.com/jingge815/Cinnamon.git --branch feature/develop-compiler  
- cd Cinnamona

# Environment Setup:
- cp env-example .env
- Set the CINNAMON_BASE_DIR variable in the .env file to the path of your Cinnamon folder, such as CINNAMON_BASE_DIR=/home/fengjingge/src/downmem/new2-downmem/cinm/Cinnamon

# Install just:
- mkdir -p ~/bin
- curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/bin
- export PATH="$PATH:$HOME/bin"
- just --help # Verify installation succeeds

# Build Process (This may take a while):
- just configure -no-torch-mlir # Downloads LLVM, compiles LLVM, then compiles with LLVM

# Usage:
- add "source 'the path of your Cinnamon'/third-party/upmem/upmem_env.sh" into compile-benches.sh 
- for example: source /home/fengjingge/src/downmem/new2-downmem/cinm/Cinnamon/third-party/upmem/upmem_env.sh 
- chmod +x compile-benches.sh
- ./compile-benches.sh









