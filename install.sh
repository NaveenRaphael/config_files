# This file is made so that it is easier on me to copy my bare necessities to newer systems. As time progresses, the links might have to be changed. But ideally... eh
# This is not a script that does things automatically; it needs monitoring

# git
sudo apt install git

# curl
sudo apt install curl

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# helix editor; I am compiling from source because I usually get used to the dev build
mkdir coding
cd coding
git clone https://github.com/helix-editor/helix.git
cargo build --release
ln -s ./target/release/hx ~/.cargo/bin/hx
cd
echo "export HELIX_RUNTIME=/home/naveen/Documents/Naveen/helix/runtime" >> ~/.bashrc
echo 'export EDITOR="hx"' >> ~/.bashrc

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# miniforge
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
# Do the miniforge setup manually

# fzf
sudo apt install fzf
echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >>~/.bashrc
echo 'eval "$(fzf --bash)"' >>~/.bashrc

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo 'eval "$(zoxide init bash --cmd cd)"' >> ~/.bashrc

# vs code
# install this with the deb from the site; link might change
#

# ffmpeg
sudo apt install ffmpeg

# fd
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd

# ripgrep
sudo apt install ripgrep

# yazi
cargo install --force yazi-build

# flatpak
sudo apt install flatpak
