# https://ubuntu-mate.community/t/display-execution-time-for-long-running-commands/11780
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
LASTCMDTIME=`date +%s`

function trackduration {
    t1=$LASTCMDTIME
    t2=$(date +%s)
    DURATION=$(expr $t2 - $t1)
    if [ $DURATION -gt 1 ]; then
        echo "[Execution took: $DURATION s]"
    fi
    LASTCMDTIME=$t2
}

function preexec() { LASTCMDTIME=`date +%s`; };
function precmd() { trackduration; }
