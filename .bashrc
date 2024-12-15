# ...

# zoxide init
eval "$(zoxide init bash --cmd cd)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. "$HOME/.cargo/env"

export EDITOR="hx"

alias netaccess="~/naveen/netaccess/target/release/netaccess"
alias tv="teamviewer"
alias open="xdg-open"
alias source_bash="source ~/.bashrc"
alias clipboard="xclip -sel clip"
alias ebash="hx ~/.bashrc"
alias sbash="source ~/.bashrc"
alias sudo='sudo '
alias apt='\nala'
alias apt0='\apt'
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
mce() {
    mamba create -n $1 python=$2
}
