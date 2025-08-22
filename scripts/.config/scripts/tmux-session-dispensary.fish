#!/usr/bin/env fish

set DIRS "$HOME/documents" "$HOME" "$HOME/documents/notes" "$HOME/documents/projects"

if test (count $argv) -eq 1
	set selected $argv[1]
else
	set selected (fd $DIRS --type=dir --max-depth=1 --full-path | sed "s|^$HOME/||" | sk --margin 10% --color="bw")
	if test -n "$selected"
		set selected "$HOME/$selected"
	end
end

if not test -n "$selected"
	exit 0
end

set selected_name (basename $selected | tr . _)
if not tmux has-session -t $selected_name
	tmux new-session -ds $selected_name -c $selected
	tmux select-window -t "$selected_name:1"
end

tmux switch-client -t $selected_name
