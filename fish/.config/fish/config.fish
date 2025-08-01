# fzf --fish | source
sk --shell fish | source

if status is-login	
	if type -q keychain
		keychain --quiet --eval id_ed25519 | source
	end
	
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
