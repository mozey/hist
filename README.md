# zhist

Backup scripts for Z Shell history.

Creates monthly and yearly backups of `~/.zsh_history` when starting a new session.

Use this to avoid the OS arbitrarily wiping history.

Note, `bak.sh` is using bash because zsh doesn't have a nice linter? [See this](https://www.reddit.com/r/zsh/comments/gt03ki/state_of_zsh_linters/). So basically I'm just using zsh because it's pretty and it has useful plugins, but for scripting I'll probably keep using bash for now...


# Quick start

Get the script
```sh
cd ~
git clone https://github.com/mozey/zhist .zhist
```

Run it from `~/.zshrc`, [see this](https://superuser.com/a/892248)
```sh
if [ -f ~/.zhist/bak.sh ]; then . ~/.zhist/bak.sh; fi
```

**TODO** Read [this](https://zsh.sourceforge.io/Guide/zshguide04.html#l89)
**TODO** Consider [functions.zsh](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/functions.zsh)

Create `zhist` function in `~/.zshrc`
```sh
HISTSIZE=90000 # Set HISTSIZE to more commands than you can type in a month
function zhist { 
    grep "$1" -h --color ~/.zsh_history* | \
    sort -t: -u -k1,1 | \
    grep "$1" --color; 
}
alias zh="zhist" 
```


# Usage

Search history for *"foo"*
```sh
zhist foo
```

Print most frequently used commands, only considers commands in `$HISTFILE`
```sh
zsh_stats
```

**TODO** Print most frequently used commands in all `~/.zsh_history*` files
```sh
zhist_stats
```

**TODO** Convert `bash_history` to `zsh_history`
```sh
zhist_convert bash_history
```

