0x() {
    echo $((16#$1))
}

0o() {
    echo $((8#$1))
}

0b() {
    echo $((2#$1))
}

p16() {
    echo $(([#16] $1))
}

p8() {
    echo $(([#8] $1))
}

p2() {
    echo $(([#2] $1))
}

rr() {
    (($+max_process)) || typeset -gi max_process=10
    (($+running_process)) || typeset -gA running_process=()

    while {getopts j:h arg} {
        case $arg {
            (j)
            ((OPTARG > 0)) && max_process=$OPTARG
            ;;

            (h)
            echo "Usage: $0 [-j max_process] [cmd] [args]"
            return
            ;;
        }
    }

    shift $((OPTIND - 1))

    (($# == 0)) && {
        for i (${(k)running_process}) {
            [[ -e $i ]] || unset "running_process[$i]"
        }

        echo "running/max: $#running_process/$max_process"
        (($#running_process > 0)) && echo "pids:" ${${(k)running_process/\/proc\/}/\/exe}
        return 0
    }

    while ((1)) {
        local running_process_num=$#running_process

        if (($running_process_num < max_process)) {
            $* &
            running_process[/proc/$!/exe]=1
            return
        }

        for i (${(k)running_process}) {
            [[ -e $i ]] || unset "running_process[$i]"
        }

        (($#running_process == $running_process_num)) && {
            echo "wait $running_process_num pids:" ${${(k)running_process/\/proc\/}/\/exe}
            inotifywait -q ${(k)running_process}
        }
    }
}

calc() {
    zmodload zsh/mathfunc
    echo $(($*))
}

stty -ixon
export PATH=~/.local/bin:$PATH
export VISUAL=vim
export PAGER='less -irf'
export GREP_COLOR='45;35;01'
alias python=python3
alias pip=pip3
alias js="noglob calc"
