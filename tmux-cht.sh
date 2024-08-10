#!/usr/bin/bash

languages=$(echo "golang javascript java bash" | tr " " "\n")
core_utils=$(echo "tmux fzf sort uniq diff find fd man tldr sed awk tr cp ls grep xargs rg ps mv kill lsof less head tail tar cp rm rename jq cat ssh cargo git git-worktree git-status git-commit git-rebase docker docker-compose stow chmod chown make" | tr " " "\n")
#core_utils=$(echo "find fd xargs grep rg awk sed tr fzf tmux" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "GIMMIE YOUR QUERY:" query

if echo "$languages" | grep -qs $selected; then
	tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | batcat"
	#curl cht.sh/$selected/$(echo "$query" | tr " " "+")
else
	tmux split-window -h bash -c "curl cht.sh/$selected~$query | batcat"
fi
