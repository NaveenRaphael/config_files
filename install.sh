# This file is made so that it is easier on me to copy my bare necessities to newer systems. As time progresses, the links might have to be changed. But ideally... eh
# This is not a script that does things automatically; it needs monitoring

# Define colors for nicer output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper function to print status
log_start() {
    echo -e "${BLUE}==> [START] $1...${NC}"
}

log_done() {
    echo -e "${GREEN}==> [DONE] $1 installed successfully.${NC}\n"
}

log_skip() {
    echo -e "${YELLOW}==> [SKIP] $1 is already installed.${NC}\n"
}

# Function to safely add lines to bashrc
add_to_bashrc() {
    local LINE="$1"
    local BASHRC="$HOME/.bashrc"

    # -F matches fixed strings (no regex), -x matches whole line, -q is quiet
    if ! grep -qFx "$LINE" "$BASHRC"; then
        echo "$LINE" >> "$BASHRC"
        echo -e "    ${GREEN}+ Added to bashrc:${NC} $LINE"
    else
        echo -e "    ${YELLOW}~ Already in bashrc:${NC} $LINE"
    fi
}

# git
if ! command -v git &> /dev/null; then
    log_start "Git"
    sudo apt install git
    log_done "Git"
else
    log_skip "Git"
fi

# 3. CURL
if ! command -v curl &> /dev/null; then
    log_start "Curl"
    sudo apt install curl
    log_done "Curl"
else
    log_skip "Curl"
fi

# 4. RUST
if ! command -v cargo &> /dev/null; then
    log_start "Rust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # Load cargo environment immediately so we can use it later in this script
    source "$HOME/.cargo/env"
    log_done "RUST"
else
  log_skip "RUST"
fi

# helix editor; I am compiling from source because I usually get used to the dev build
if ! command -v hx &> /dev/null; then
    log_start "Helix"

    mkdir -p ~/coding

    if [ ! -d "$HOME/coding/helix" ]; then
        git clone https://github.com/helix-editor/helix.git ~/coding/helix
    fi
    cd ~/coding/helix
    cargo build --release
    ln -sf ~/coding/helix/target/release/hx ~/.cargo/bin/hx

    add_to_bashrc 'export EDITOR="hx"'
    add_to_bashrc "export HELIX_RUNTIME=~/coding/helix/runtime"

    cd
    log_done "hx"
else
  log_skip "hx"
fi
    
# 6. UV
if ! command -v uv &> /dev/null; then
    log_start "uv"
    curl -LsSf https://astral.sh/uv/install.sh | sh
    log_done "uv"
else
    log_skip "uv"
fi


# 7. MINIFORGE
if ! command -v conda &> /dev/null; then
    log_start "Miniforge"
    MINIFORGE_FILE="Miniforge3-$(uname)-$(uname -m).sh"
    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/$MINIFORGE_FILE"
    bash "$MINIFORGE_FILE"
    rm "$MINIFORGE_FILE"
    log_done "Miniforge"
else
    log_skip "Miniforge (conda detected)"
fi
# 8. FZF
if ! command -v fzf &> /dev/null; then
    log_start "fzf"
    sudo apt install fzf 
    add_to_bashrc '[ -f ~/.fzf.bash ] && source ~/.fzf.bash'
    add_to_bashrc 'eval "$(fzf --bash)"'
    log_done "fzf"
else
    log_skip "fzf"
fi
# 9. ZOXIDE
if ! command -v zoxide &> /dev/null; then
    log_start "zoxide"
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    add_to_bashrc 'eval "$(zoxide init bash --cmd cd)"'
    log_done "zoxide"
else
    log_skip "zoxide"
fi


# vs code
# install this with the deb from the site; link might change
#

# 11. FFMPEG
if ! command -v ffmpeg &> /dev/null; then
    log_start "ffmpeg"
    sudo apt install ffmpeg
    log_done "ffmpeg"
else
    log_skip "ffmpeg"
fi
# 12. FD (fd-find)
if ! command -v fd &> /dev/null; then
    log_start "fd"
    sudo apt install fd-find 
    mkdir -p ~/.local/bin
    ln -sf "$(which fdfind)" ~/.local/bin/fd
    log_done "fd"
else
    log_skip "fd"
fi

# 13. RIPGREP
if ! command -v rg &> /dev/null; then
    log_start "ripgrep"
    sudo apt install ripgrep 
    log_done "ripgrep"
else
    log_skip "ripgrep"
fi
# 14. YAZI
if ! command -v yazi &> /dev/null; then
    log_start "yazi"
    source "$HOME/.cargo/env"
    cargo install --force yazi-build
    log_done "yazi"
else
    log_skip "yazi"
fi

# 15. FLATPAK
if ! command -v flatpak &> /dev/null; then
    log_start "flatpak"
    sudo apt install flatpak 
    log_done "flatpak"
else
    log_skip "flatpak"
fi
