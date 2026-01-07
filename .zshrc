# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
bindkey -s '^F' 'cd "$(find . -maxdepth 10 -type d | fzf --preview "tree -L 1 {}")"\n'
# bindkey -s '^E' 'nvim $(fzf)\n'

command_center () {
    local out=$(sh ~/command_center.sh)
    if [[out = "1"]]; then
        exit
    fi
}
bindkey -s '^A' 'sh ~/command_center.sh\n' #'systemctl start dnscrypt-proxy\n'
bindkey -s '^U' 'fg %1\n'
bindkey -s '^p' 'source ~/Documents/programming/python/.env/bin/activate\n'
bindkey -s '^b' 'uv run ~/Documents/programming/python/The-Caverns-Original/main.py\n'
bindkey -s '^G' 'grep -rnw . -e "$(gum input)" \n'
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Neovim customizations
nvim_dirfix() {
	nvim "$@"
 	echo \n
}
alias nvim="nvim_dirfix"
alias ls="lsd"
alias yya="yay"
# alias sl="sl | lolcat"
alias cura="cura -platformtheme gtk3 &"
alias stocks="ticker -w DKNG,COIN,FIVE,IBM,SPY"

nvim_edit() {
	local file=$(find "$(pwd)" -maxdepth 12 -type f 2>/dev/null | fzf --preview 'bat --style=numbers --color=always {} 2>/dev/null')
	cd $(dirname "$file")

    mime=$(file --mime-type -b "$file")

    case "$mime" in
        application/pdf)
            exec zathura "$file" &
            ;;
        image/*)
            exec loupe "$file"
            ;;
        *)
            nvim "$file"
            ;;
    esac
	zle reset-prompt
}
vim_edit() {
	local file=$(find "$(pwd)" -type f -not -path "*/\.*" | fzf --preview 'bat {} ')
	# cd $(dirname "$file")
	vim "$file"
	zle reset-prompt
}
zle -N nvim_edit
zle -N vim_edit
bindkey "^E" nvim_edit
bindkey "^V" vim_edit



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# My very exaggerated greeter
# ./greeter | lolcat
# pr -m -t -w 150 <(fortune | cowsay) <(cal --color=always) <(remindme) | lolcat
# zsh ~/greeter.sh
