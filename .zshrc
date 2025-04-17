# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
source ~/.commacd.sh
source /home/luke/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey -s '^F' 'cd "$(find . -type d | fzf)"\n'
# bindkey -s '^E' 'nvim $(fzf)\n'
bindkey -s '^A' 'systemctl start dnscrypt-proxy\n'
bindkey -s '^d' 'alacritty &\n'
bindkey -s '^U' 'fg %1\n'
bindkey -s '^g' 'xrandr --output DisplayPort-6 --mode 1920x1200\n'
bindkey -s '^p' 'source ~/Documents/programming/python/.env/bin/activate\n'
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Neovim customizations
nvim_dirfix() {
	nvim "$@"
 	echo \n
}
alias nvim="nvim_dirfix"
alias ls="lsd"
alias sl="sl | lolcat"
alias cura="cura -platformtheme gtk3 &"
nvim_edit() {
	local file=$(find "$(pwd)" -type f 2>/dev/null | fzf --preview 'bat --style=numbers --color=always {} 2>/dev/null')
	cd $(dirname "$file")
	nvim "$file"
	zle reset-prompt
}
zle -N nvim_edit
bindkey "^E" nvim_edit


# Python Customizations
TARGET_DIR="/Documents/programming/python"

chpwd() {
	# echo "$TARGET_DIR"
	# echo "$PWD"
	if [[ "$PWD" == "~/Documents/programming/python" ]]; then
		echo "Entered $TARGET_DIR, starting environment..."
		source .env/bin/activate\n
	fi
}



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# My very exaggerated greeter
zsh ~/greeter.sh
export BROWSER=thorium-browser
