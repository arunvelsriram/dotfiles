# dotfiles
Repo to hold my Mac OS X configurations. Helps to setup my Mac easily in case of failure or replacement.

## Setup

1. Setup SSH access to GitHub
2. Provide "Full Disk Access" for Terminal/iTerm under Privacy & Security preferences
3. Clone and run setup:
```
git clone --recurse-submodules git@github.com:arunvelsriram/dotfiles.git
./setup
```
4. After completing the setup, complete GPG setup as its required for git commits

## Warning ##
Use at your own risk!

Review the code and remove things that are not necessary to you before setting this up on your Mac.

A backup of the existing dotfiles will be placed inside `dotfiles.backup.{date}` during the setup. Use this to restore your old dotfiles in case you mess up.

## TODO ##
- [ ] Include VS Code preferences
- [ ] Include Sublime Text preferences
