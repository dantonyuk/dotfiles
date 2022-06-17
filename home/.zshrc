zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/go/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
  export WSL_HOST=$(ip route | grep default | awk '{print $3}')
  export DISPLAY=$WSL_HOST:0
fi
export GPG_TTY=$(tty)

export PAGER="/usr/bin/less -X -F"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=nvim
[ -f ~/bin/browser ] && export BROWSER=~/bin/browser

export FZF_DEFAULT_COMMAND='rg --hidden --files --glob "!.git/"'
export FZF_CTRL_T_OPTS="--preview 'fzf-preview {}' --preview-window up:75%
--height 100% --layout default --inline-info"
export FZF_DEFAULT_OPTS="--bind ctrl-u:preview-up,ctrl-d:preview-down
--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
--color info:150,prompt:110,spinner:150,pointer:167,marker:174
"

setopt extendedglob
unsetopt BG_NICE

[[ -s $HOME/.zsh_aliases ]] && source ~/.zsh_aliases
[[ -s $HOME/.zsh_ssh ]] && source $HOME/.zsh_ssh

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

autoload -U zmv

# fasd
#bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (files and directories)
#bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
#bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)

#POWERLEVEL9K_MODE='nerdfont-complete'
#source  ~/powerlevel9k/powerlevel9k.zsh-theme
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(date time dir vcs anaconda newline status)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_MODE='nerdfont-complete'


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

#zinit ice atinit'zmodload zsh/zprof' \
#  atload'zprof | head -n 20; zmodload -u zsh/zprof'
zinit light zdharma-continuum/fast-syntax-highlighting
#zinit ice atinit'zmodload zsh/zprof' \
#  atload'zprof | head -n 20; zmodload -u zsh/zprof'
zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=true

#zinit wait lucid for \
#  romkatv/powerlevel10k

setopt sharehistory
zinit lucid for \
  OMZL::prompt_info_functions.zsh \
  OMZL::git.zsh \
  OMZL::history.zsh

zinit wait lucid for \
  OMZL::grep.zsh \
  OMZL::history.zsh \
  OMZL::cli.zsh \
  OMZL::key-bindings.zsh \
  OMZL::spectrum.zsh \
  OMZL::completion.zsh \
  OMZP::git \
  OMZP::git-extras \
  OMZP::autojump \
  OMZP::fzf \
  OMZP::fasd \
  OMZP::command-not-found

CASE_SENSITIVE="true"

setopt promptsubst

PS1="> "
zinit ice wait'!0'
#zinit lucid for OMZT::gnzh
#zinit lucid for OMZT::agnoster
zinit ice depth=1
zinit light romkatv/powerlevel10k

forgit_log=fglo
forgit_diff=fgd
forgit_add=fga
forgit_reset_head=fgrh
forgit_ignore=fgi
forgit_checkout_file=fgcf
forgit_checkout_branch=fgcb
forgit_checkout_commit=fgco
forgit_clean=fgclean
forgit_stash_show=fgss
forgit_cherry_pick=fgcp
forgit_rebase=fgrb
forgit_fixup=fgfu
zinit load wfxr/forgit

zinit wait lucid for \
  atinit"zicompinit; zicdreplay"  \
    zdharma-continuum/fast-syntax-highlighting \
    OMZP::colored-man-pages \
  as"completion" \
    OMZP::docker/_docker

#zinit light matthieusb/zsh-sdkman
zinit light zdharma-continuum/zinit-annex-bin-gem-node

zinit pack"bgn+keys" for fzf
zinit light Aloxaf/fzf-tab
zinit snippet "https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/6e5d520bfc96d6b3e42571a54cb4d1ebc8e2dd84/functions.sh"
zinit snippet "https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/6e5d520bfc96d6b3e42571a54cb4d1ebc8e2dd84/key-binding.zsh"
#zstyle ':completion:*:*:*:default' menu yes select search

# SDKMAN!

if [[ ! -s ~/.sdkman/bin/sdkman-init.sh ]]
then
  if read -q "INSTALL_SDKMAN?SDKMAN! is not installed. Do you want to install it? [yN]"
  then
    curl -s "https://get.sdkman.io" | bash
  fi
fi
if [[ -s ~/.sdkman/bin/sdkman-init.sh ]]
then
  export SDKMAN_DIR="$HOME/.sdkman"
  zinit wait lucid src"$HOME/.sdkman/bin/sdkman-init.sh" for zdharma-continuum/null
fi

cd $HOME

export __p9k_force_term_shell_integration=1
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
if [ -d ~/.fnm ]
then
  export PATH=~/.fnm:$PATH
  eval "`fnm env`"
fi
