# zhist

Backup script and cheatsheet for Z Shell history.

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



# Cheat Sheet

**TODO** Read [this](https://zsh.sourceforge.io/Guide/zshguide04.html#l89)

Print most frequently used commands,
only considers commands in `$HISTFILE`. See [functions.zsh](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/functions.zsh)
```sh
zsh_stats
```

Print most frequently used commands in all `~/.zsh_history*` files
```sh
zhist_stats
```

Search history for *"foo"*
```sh
zhist foo
```

Convert `bash_history` to `zsh_history`
```sh
zhist_convert bash_history
```

