fzf --fish | source

if status is-login	
	set TTY1 (tty)
	[ "$TTY1" = /dev/tty1 ] && exec sway &>~/.Wsession.errors
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    if set -q SSH_CONNECTION
	    set -Ux EDITOR vim
    else
	    set -Ux EDITOR nvim
    end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
