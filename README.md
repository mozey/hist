# zhist

Backup script for Z Shell history.

Creates a backup of `~/.zsh_history` when starting a new session. 

Use this to avoid wiping history


# Quick start

Get the script
```sh
cd ~
git clone https://github.com/mozey/zhist .zhist
```

Add history settings to `~/.zshrc`, [see this](https://unix.stackexchange.com/a/273863/309572)
```sh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
```

Run backup script from `~/.zprofile`, [see this](https://superuser.com/a/892248)
```sh
if [ -f ~/.zhist/bak.sh ]; then ~/.zhist/bak.sh; fi
```

**NOTE** `bak.sh` is using bash because zsh doesn't have a nice linter? [See this](https://www.reddit.com/r/zsh/comments/gt03ki/state_of_zsh_linters/). So basically I'm just using zsh because it's pretty and it has useful plugins, but for scripting I'll probably keep using bash for now...


# Usage

Convert `.bash_history` to `.zsh_history`.
**WARNING** Does not preserve timestamps
```sh
~/.zhist/convert_bash_to_zsh_history.sh
```

Print most frequently used commands, only considers commands in `$HISTFILE`
```sh
zsh_stats
```

Search history, works well with [fzf](https://github.com/junegunn/fzf) plugin
```sh
ctrl + r
```


# Reference

- [History and searching](https://zsh.sourceforge.io/Guide/zshguide04.html#l89)


