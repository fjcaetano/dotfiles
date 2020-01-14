💻 dotfiles
===

# Getting started

1. Create a symlink for `.gitconfig` and `.zshrc` in your user's home folder:

```sh
$ ln -s "$(pwd)/.gitconfig" ~/.gitconfig
$ ln -s "$(pwd)/.zshrc" ~/.zshrc
```

This will ensure every change made to your .zshrc and global git config variables gets reflected in this repository.

2. Create a symlink for the `emulator` plugin in your zsh plugins folder.

The path to the zsh plugins folder may vary depending on how zsh was installed: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

```sh
$ ln -s "$(pwd)/zsh-plugins/emulator" ~/.oh-my-zsh/plugins
```