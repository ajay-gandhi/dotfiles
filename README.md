# dotfiles

## Install

1. Install [vundle](https://github.com/VundleVim/Vundle.vim)
2. Clone repo and run install script:

```bash
git clone https://github.com/ajay-gandhi/dotfiles.git ~/.dotfiles
bash ~/.dotfiles/install.sh
```

3. Launch vim and run `:PluginInstall`
4. [Optional] Install [Fira Code](https://github.com/tonsky/FiraCode)

## Bash scripts

The `scripts/` directory is a set of bash scripts that is added to my `$PATH`.

* `ccompile`:  Basic alias for C compiler
* `do-all`:    Runs all the given commands in order on the last argument
* `f`:         Shortcut for `find` command
* `git-start`: So that I don't have to always type `git@github.com:`, and
               sometimes even my username, when cloning repos
* `git-open`:  Opens the GitHub URL for the current repo
* `P`:         Shortcut for pandocing latex files to pdf
