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

## Fancy bash prompt

The fancy version of the bash prompt requires a specially-patched font to enable
the full-height arrows, etc. These fonts are the same that are required for
[Powerline](https://github.com/powerline/powerline). I personally use Fira Code,
and the patched version is available through
[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode).

You must also be using a 256-color GUI terminal. You can customize the colors
for the fancy prompt by changing these variables:

```bash
fClr="19"
sClr="21"
tClr="27"
```

The relevant colors you can use are in
[this SE answer](https://unix.stackexchange.com/a/124409).

The fancy prompt version also includes a couple APIs for customizing the prompt
even further, such as the `chClr` function which makes it easier to change bg
and fg colors.
