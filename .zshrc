for keymap in 'emacs' 'viins' 'vicmd'; do
  # Home variations (Kitty native, App Cursor, Tmux, xterm)
  bindkey -M $keymap '\e[H'  beginning-of-line 2>/dev/null
  bindkey -M $keymap '\eOH'  beginning-of-line 2>/dev/null
  bindkey -M $keymap '\e[1~' beginning-of-line 2>/dev/null
  bindkey -M $keymap '\e[7~' beginning-of-line 2>/dev/null
  bindkey -M $keymap '\eOw'  beginning-of-line 2>/dev/null

  # End variations
  bindkey -M $keymap '\e[F'  end-of-line 2>/dev/null
  bindkey -M $keymap '\eOF'  end-of-line 2>/dev/null
  bindkey -M $keymap '\e[4~' end-of-line 2>/dev/null
  bindkey -M $keymap '\e[8~' end-of-line 2>/dev/null
  bindkey -M $keymap '\eOq'  end-of-line 2>/dev/null

  # Delete key
  bindkey -M $keymap '\e[3~' delete-char 2>/dev/null
done


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/deodato/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
export PATH=$PATH:~/.local/bin
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if command -v lsd &> /dev/null; then
    alias ls='lsd'
    alias ll='lsd -l'
    alias la='lsd -a'
    alias lla='lsd -la'
fi
alias less=bat
alias kssh="kitten ssh"
alias kdiff="kitten diff"
alias icat="kitten icat"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VISUAL="nvim"
export EDITOR="nvim"

export PATH=$PATH:/var/lib/gems/3.2.0/bin/

# opencode
export PATH=/home/deodato/.opencode/bin:$PATH

play-video() {
    mpv --profile=sw-fast --vo=kitty --vo-kitty-use-shm=yes --really-quiet "$*"
}
