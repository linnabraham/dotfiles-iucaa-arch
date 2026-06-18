# Setup color scheme <brokenman> for list call
alias ll='/bin/ls --color=auto -lF'
alias la='/bin/ls --color=auto -axF'
alias lt='\ls -lt | head '
#alias lsd='ls -d */'
alias lsd='ls --group-directories-first'
alias df='df -hT'
alias sudox="sudo chmod u+x"
alias p='ping -c 10 google.com'
alias wget='wget -c'
alias yta='yt-dlp --extract-audio --audio-format mp3'
alias gd='git diff --word-diff --color=always'
alias ga='git add'
alias gp="git push"
alias gs='git status'
alias gsu='git status -uno'
alias gcm='git commit -m'
alias gl='git log --graph --pretty=format:"%C(auto)%h%C(reset) %ad %C(auto)%d%C(reset) %s" --date=format:"%b %d, %Y"'
alias sb='source ~/.zshrc'
alias cheat='cheat --all'
alias vi='nvim'
alias vim='nvim'
alias bm='bashmount'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias x='exit'
alias tm='tmux'
alias pconf='sudo nvim /etc/pacman.conf'
# confirm before overwriting something
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkd="mkdir -pv"
alias pi='sudo pacman -S --needed --noconfirm'
alias pai='paru -S --needed --noconfirm'
alias y='yadm'
alias trr='transmission-remote'
if command -v exa >/dev/null; then
    alias ls='exa-wrapper.sh'
fi
alias ytdl-short='yt-dlp -o "%(id)s.%(ext)s'
alias mem='BLOCK_BUTTON=1 memory'

# colorize commands
alias \
    ls="ls -hN --color=auto"\
    ip="ip -color=auto" \
    diff="diff --color=auto" \
    grep="grep --color=auto"

# frequently used programs
alias \
    g='git' \
    p='pacman' \
    v='nvim' \
    py='python'
# ZSH aliases
alias zreloadkeys="killall sxhkd && sxhkd &!"
# use fzf for searching among non hidden files and cd to the base directory
alias fcd='locate $HOME | grep -Pv "/\..*" | fzf | xargs -d "\n" dirname'
alias ftc='fcp "$(locate $HOME | grep -Pv "/\..*" | fzf)"'

alias ftg='locate $HOME | grep -Pv "/\..*" | fzf | xclip -selection clipboard'
alias cdd='cd $(find ~/ -type d  "(" -name ".?*" -prune -o -print ")" | fzf +m --preview "tree -C -L 1 {}")'
alias fch='cd $(find ~ .local -type f -not -path \*/.\* -print0 2>/dev/null | fzf --read0 | xargs -r -0 dirname)'
alias tnh="cd $HOME/work/writings/2025/jun/TeXNotes"
alias wjh="cd $HOME/work/writings/work-journal/"
alias pnh="source personal-notes"
alias lh="cd $HOME/work/writings/link-home"
alias fh="cd $HOME/work/git-repos/2025/aug/ledger-tools/"
alias nh="cd /run/media/linn/notesbox/HomeNotes"
alias ml="ledger -f $HOME/work/git-repos/2025/aug/ledger-tools/main.ledger \
		  --price-db $HOME/work/git-repos/2025/aug/ledger-tools/ballava_prices.ledger --sort date --exchange ₹"
alias lu="hledger -f $HOME/work/git-repos/2025/aug/ledger-tools/main.ledger add"
alias hl="hledger"
alias panc="paru --noconfirm"
alias np='ncmpcpp'
alias n='neomutt'
alias t='task'
alias th='taskhelper'
alias tp='taskprojects'
alias td='task end:today status:completed all'
alias pa='paru --regex --noconfirm'
alias word='dict -d wn'
alias bc='bc -lq'
alias cdf='cd "$(dirname "$(fzf)")"'
alias tadd='task add'
alias showtime="cat /tmp/active_time.out"
alias tw='task showtasks -@house -sidequest -@outside -backlog project.not:house'
alias startvnc='sudo systemctl start vncserver@:1 && x0vncserver -display :0 -rfbauth ~/.vnc/passwd'
alias scrcpy-connect='scrcpy --legacy-paste --video-codec=h265 --max-size=1920 --max-fps=60 --no-audio --keyboard=aoa'
alias tnm="/opt/miniconda3/envs/texnotes/bin/python3 manage.py"
