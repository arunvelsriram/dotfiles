# dotfiles
Repo to hold my Mac OS X configurations. Helps to setup my Mac easily in case of failure or replacement.

## Setup

```
xcode-select --install
./setup
```

## Warning ##
Use at your own risk!

Review the code and remove things that are not necessary to you before setting this up on your Mac.

A backup of the existing dotfiles will be placed inside `dotfiles.backup.{date}` during the setup. Use this to restore your old dotfiles in case you mess up.

## TODO ##
- [ ] Include VS Code preferences
- [ ] Include Sublime Text preferences

## Notes

### neovim

```
pip install pynvim
pip3 install pynvim

rbenv global <version>
gem install neovim

npm install -g neovim
```

### Override OS X Defaults

```
./osx-overrides
```

### yabai and skhd

#### Install yabai-utils

```
ln -s $PWD/yabai-utils /usr/local/bin/yabai-utils
```

