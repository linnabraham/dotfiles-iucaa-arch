# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
# number of lines that are saved in memory
HISTSIZE=1000000
# number of lines that are saved to file
SAVEHIST=500000
setopt autocd # Automatically cd into typed directory.
bindkey -v # enable vi mode
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/linn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# BEGIN Copied from bashrc
export XDG_CONFIG_HOME="$HOME/.config"
[ -f $XDG_CONFIG_HOME/shortcutrc ] && source $XDG_CONFIG_HOME/shortcutrc

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [[ -f ~/.bashrc_scripts ]]; then
    source ~/.bashrc_scripts
fi
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
export EDITOR="/usr/bin/vim"

# END copied from bashrc
# BEGIN Lukesmiths changes
stty stop undef         # Disable ctrl-s to freeze terminal.
# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
# END Lukesmiths changes
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
ENABLE_CORRECTION="true"
setopt CORRECT

autoload -Uz add-zsh-hook

function xterm_title_precmd () {
        print -Pn -- '\e]2;%n@%m %~\a'
        [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
        print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
        [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*|st*) ]]; then
        add-zsh-hook -Uz precmd xterm_title_precmd
        add-zsh-hook -Uz preexec xterm_title_preexec
fi

export TEXMFHOME=/home/linn/.texmf/
export PATH="$PATH:$HOME/.virtualenvs/py37/bin" # append path in the beginning to not override default python

autoload -U colors && colors # load color support in prompt
autoload -Uz vcs_info # load version control info package
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true # tells the back-end to check for working-copy changes and staged changes.
zstyle ':vcs_info:git*' formats "%{$fg[red]%}%b%a%{$reset_color%}[%m%u%c]%{$reset_color%}"
#zstyle ':vcs_info:git*' formats "%b (%a) %m%u%c "
#### Changes to prompt ######
precmd() { vcs_info }

trunc_path(){
current_path=${${PWD}/#$HOME/"~"}
paths=(${(s:/:)${current_path//"~\/"/}})
local num=$(( ${#paths} - 1 ))
for (( i=1; i<$num; i++ )); do
paths[$i+1]=.
done
[[ $current_path != '~'* ]] && current_path="/" || current_path=""
current_path+="${(j:/:)paths}"
}

add-zsh-hook precmd trunc_path

# Set up the prompt (with git branch name)

setopt PROMPT_SUBST

if [ -n "$ZSH_VERSION" ]; then
  autoload -U bashcompinit
  bashcompinit
fi

export LS_OPTIONS="--color=auto"

# change the different background coloring for directores which have o+w access
# to merely underline
export LS_COLORS="$LS_COLORS:ow=1;34;4:"

