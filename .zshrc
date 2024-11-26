
# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# lunarvim
export PATH="$HOME/.local/bin":$PATH

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

##########
# HISTORY
##########

#HISTFILE=$HOME/.zsh_history
#HISTSIZE=20000
#SAVEHIST=20000

#setopt INC_APPEND_HISTORY     # Immediately append to history file.
#setopt EXTENDED_HISTORY       # Record timestamp in history.
#setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
#setopt HIST_IGNORE_DUPS       # Dont record an entry that was just recorded again.
#setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
#setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
#setopt HIST_IGNORE_SPACE      # Dont record an entry starting with a spacer.
#setopt HIST_SAVE_NO_DUPS      # Dont write duplicate entries in the history file.
#setopt SHARE_HISTORY          # Share history between all sessions.
#unsetopt HIST_VERIFY          # Execute commands using history (e.g.: using !$) immediately

#############
# Autin History and co
#############

#for importing old history file
#atuin import auto

#############
# COMPLETION
#############

# Speed up completion init, see: https://gist.github.com/ctechols/ca1035271ad134841284
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#############
#fzf
#############
#
alias f='fzf'

#############
#############


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#####################################################
#####################################################
#####################################################
#own alias
alias ,aptup='sudo apt update && sudo apt upgrade -y'
alias c='clear'
alias vim='nvim'
alias eixt='exit'
alias la="ls -lah --group | awk 'BEGIN {print \"Permission\tSize\tMonth\tDay\tTime\tName\"} NR==1 {print} NR>1 {if (\$1 ~ /^d/) {print \"\033[34m\" \$1 \"\t\" \$5 \"\t\" \$6 \"\t\" \$7 \"\t\" \$8 \"\t\" \$9 \"\033[0m\"} else {print \$1 \"\t\" \$5 \"\t\" \$6 \"\t\" \$7 \"\t\" \$8 \"\t\" \$9}}' | awk 'NR==2 {save=\$0; next}; {print} END{print save, \"| time now: \", strftime(\"%d %b %R\")}' | awk '\$1 ~ /total/ {print \"________________\"} {print}'"
alias rm='rm -i'
alias ,dateweek='date +%V'
alias layzgit='lazygit'
alias lazy='lazygit'
alias lg='lazygit'
alias idea='intellij-idea-community'
alias idae='intellij-idea-community'
alias jq='jq --color-output'
alias less='less -R'

#navigation
alias ..='cd ..'
alias ...='cd ../..'

#yarn alias
alias ,yarnint="rm -rf node_modules/.yarn-integrity && yarn install"
alias ,yarnnode="rm -rf node_modules && yarn install"

#git alias
alias ,gitdev="git checkout develop"
alias ,gits="git status -s"

#setup
alias ,setA='vim ~/.zshrc'
alias ,ez='vim ~/.zshrc'
alias ,sz='source ~/.zshrc'

#cheatsheets
#add them too cht
alias ,vimc='vim ~/dotfiles/cheatSheets/vim-cheatsheet.txt'
alias ,gitc='vim ~/dotfiles/cheatSheets/git.txt'
alias ,lc='vim ~/dotfiles/cheatSheets/linux.txt'
alias ,javacheat='vim ~/dotfiles/cheatSheets/java.txt'
alias ,vitec='vim ~/dotfiles/cheatSheets/vite.txt'
alias ,restc='vim ~/dotfiles/cheatSheets/rest.txt'
alias ,npmc='vim ~/dotfiles/cheatSheets/npm.txt'
alias ,comg='vim ~/dotfiles/cheatSheets/commitGuide.txt'

#plan alias
alias ,plano='awk "NR > 15 && /^[^*+-=]/" /home/alex/Documents/notes/.plan | awk "{print NR \":  \" \$0}" | head -n -1 | awk "{printf \$1 \"\\t\"}{ s = \"\"; for (i = 2; i <= NF; i++) s = s \$i \" \"; print s }"'
alias ,planc="awk 'NR > 15 && /^[*+=]/' /home/alex/Documents/notes/.plan"
alias ,pland="awk 'NR > 15 && /^[-]/' /home/alex/Documents/notes/.plan"

#browser alias
alias ,l8='start microsoft-edge:https://localhost:8443/'
alias ,l3='start microsoft-edge:http://localhost:3000'
alias ,l31='start microsoft-edge:http://localhost:3001'

#pushd popd dirs
alias gd=pushd
alias pd=popd
alias slurp='pushd - && pushd'
alias dirs='dirs -v'

# tmux
alias ,tma='tmux attach -t'
alias ,tmn='tmux new -s'
alias ,tmm='tmux new -s main'
alias ,ttldr='$HOME/tmux-cht.sh'
alias ,tsess='$HOME/tmux-sessionizer'
alias ,tks='tmux kill-server'

#shell startup speed
alias ,perfStartup='for i in $(seq 1 10); do time $SHELL -i -c exit; done'

#functions
function ,take {
    mkdir -p $1
    cd $1
}

# [f]uzzy go to any folder on the system
,fcd() {
    local dir
    dir=$(fd -t d . "$HOME" | fzf) && cd "$dir"
}

# [f]uzzy check[o]ut
,fgo() {
  git branch --no-color --sort=-committerdate --format='%(refname:short)' | fzf --header 'git checkout' | xargs git checkout
}

function process_notes_file {
    local notes_file="$1"
    local temp_file=$(mktemp)

    # Remove trailing empty lines
    awk 'NR==FNR && NF>0 {line=NR} NR!=FNR && FNR<=line' "$notes_file" "$notes_file" > "$temp_file"
    mv "$temp_file" "$notes_file"

    if [ -n "$2" ]; then
        local last_date
        last_date=$(tail -n 1000 "$notes_file" | grep -oE '[0-9]{2}\.[0-9]{2}\.[0-9]{4}' | tail -n 1)
        current_date=$(date +'%d.%m.%Y')
        current_day=$(date +'%A')
        if [ "$last_date" != "$current_date" ]; then
            echo "" >> "$notes_file"
            echo "" >> "$notes_file"
            echo "" >> "$notes_file"
            echo "= $current_day, $current_date =============================================================" >> "$notes_file"
        fi
        echo "${@:2}" >> "$notes_file"
    else
        vim "$notes_file"
    fi
}

# tennis functions
# get current log
function ,currentLog {
    local curDir=$(ls -lah $HOME/Documents/coding/vsCode/puppeteer/Tennis-Backtest/backtest/data/logs/ | sort -k 9r | head -1 | awk '{print $NF}')
    (    
        cd "$HOME/Documents/coding/vsCode/puppeteer/Tennis-Backtest/backtest/data/logs/$curDir" 
        file=$(ls -lh | sort -k 7nr | head -1 | awk '{print $NF}')
        echo "file: " $file
        echo ""

    if [ $1 -z ]; then
        tail -n 40 $file 
    elif [ $1 -lt 300 ]; then
        tail -n $1 $file 
    else
        cat $file
    fi
    )
}

function ,note {
    process_notes_file "$HOME/Documents/notes/notes.txt" "$@"
}

function ,plan {
    process_notes_file "$HOME/Documents/notes/.plan" "$@"
}


. "$HOME/.cargo/env"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

#[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

#starship
eval "$(starship init zsh)"

#atuin
eval "$(atuin init zsh --disable-up-arrow)"
bindkey '^r' _atuin_search_widget

#fzf
bindkey -s '^F' "$HOME/tmux-sessionizer\n"
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
export FZF_TMUX_OPTS='-p80%,60%'
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --exclude node_modules'
export PATH="$HOME/.tmux.conf/bin:$PATH"

#z -> zoxide
eval "$(zoxide init --cmd cd zsh)"
