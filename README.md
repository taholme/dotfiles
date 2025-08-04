# dotfiles
Dotfiles, setup and configuration repository

```bash
stow git # on conflict use --adopt flag or rm the conflicting file since dotfiles should be master

# for keyd it is stored in /etc/keyd and not in ~/ or ~/.config, so the path must be supplied and executed with sudo
sudo stow -t / keyd
```
