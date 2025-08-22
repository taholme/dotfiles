#!/usr/bin/env fish

set dir (tmux run "echo #{pane_start_path}")
cd $dir
set url (git remote get-url origin | sed "s|^git@|https://|" | sed "s|\.com:|.com/|")

if string match -q "*github.com*" $url
	open $url
else
	echo "This repository is not hosted on GitHub"
end
