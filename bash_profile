alias diffmate='git diff --no-color|mate'

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/Users/hasan/bin/bin:/bin:/usr/bin:/sbin:/usr/sbin:/sw/bin:~/code/mzscheme/bin:~/bin/erlware/bin:~/bin:~/bin/bin:~/code/node:~/code/node/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/share/npm/bin
export MANPATH=/opt/local/lib/erlang/man:$MANPATH
export PATH=$PATH:~/bin/jruby-1.1.5/bin
export PATH=$PATH:/Applications/ffmpegX.app/Contents/Resources
export PATH=$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin

# add stuff to Java CLASSPATH
# Processing:
#export CLASSPATH=$CLASSPATH:/Applications/Processing.app/Contents/Resources/Java/core.jar
# Clojure:
#export CLASSPATH=$CLASSPATH:~/code/clojure/clojure.jar
# clj-processing
#export CLASSPATH=$CLASSPATH:~/code/clj-processing/rosado.processing.jar

#alias clojure_repl='java clojure.lang.Repl'

# common settings etc:

print_branch_name() {
    if [ -z "$1" ]
    then
        curdir=`pwd`
    else
        curdir=$1
    fi
    if [ -d "$curdir/.hg" ]
    then
        echo -n " "
        if [ -f  "$curdir/.hg/branch" ]
        then
            cat "$curdir/.hg/branch"
        else
            echo "default"
        fi
        return 0
    elif [ -d "$curdir/.git" ]
    then
        echo -n " "
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
    fi
    # Recurse upwards
    if [ "$curdir" == '/' ]
    then
        return 1
    else
        print_branch_name `dirname "$curdir"`
    fi
}

export SVN_EDITOR='emacs --quick'
export HGEDITOR='emacs --quick'
export GIT_EDITOR='emacs --quick'

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias ls='ls -hFG'
alias l='ls'

# colors
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# ~/path/to/somewhere(git-branch): _
# path in green, branch in black
# TODO: username @ host [dir] @branch:
export PS1='\u@\h \w $(print_branch_name): '

# History setup

export HISTCONTROL=erasedups # remove duplicates
export HISTSIZE=10000 # more items
shopt -s histappend # append to .bash_history not overwrite

alias ..='cd ..'
alias ...='cd ../..'
