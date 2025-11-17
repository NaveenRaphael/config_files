# This file is made so that it is easier on me to copy my bare necessities to newer systems. As time progresses, the links might have to be changed. But ideally... eh
# This is not a script that does things automatically; it needs monitoring

# git
echo "Installing git"
sudo apt install git

# curl
echo "Installing curl"
sudo apt install curl

# rust
echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# helix editor; I am compiling from source because I usually get used to the dev build
echo "Installing hx"
mkdir coding
cd coding
git clone https://github.com/helix-editor/helix.git
cargo build --release
ln -s ./target/release/hx ~/.cargo/bin/hx
cd
echo "export HELIX_RUNTIME=/home/naveen/Documents/Naveen/helix/runtime" >> ~/.bashrc
echo 'export EDITOR="hx"' >> ~/.bashrc

# uv
echo "Installing uv"
curl -LsSf https://astral.sh/uv/install.sh | sh

# miniforge
echo "Installing miniforge"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
# Do the miniforge setup manually

# fzf
echo "Installing fzf"
sudo apt install fzf
echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >>~/.bashrc
echo 'eval "$(fzf --bash)"' >>~/.bashrc

# zoxide
echo "Installing zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo 'eval "$(zoxide init bash --cmd cd)"' >> ~/.bashrc

# vs code
# install this with the deb from the site; link might change
#

# ffmpeg
echo "Installing ffmpeg"
sudo apt install ffmpeg

# fd
echo "Installing fd"
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd

# ripgrep
echo "Installing ripgrep"
sudo apt install ripgrep

# yazi
echo "Installing yazi"
cargo install --force yazi-build

# flatpak
echo "Installing flatpak"
sudo apt install flatpak
