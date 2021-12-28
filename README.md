# hist

Backup script and cheatsheet for Z Shell history


# Quick start

Get the script
```
cd ~
git clone https://github.com/mozey/hist .hist
```

**TODO**


# Cheat Sheet

Print most frequently used commands,
only considers commands in `$HISTFILE`
```sh
# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/functions.zsh
zsh_stats
```

Print most frequently used commands in all `~/zsh_history*` files
```sh
hist_stats
```

Search history for *"foo"*
```sh
hist foo
```

Convert `bash_history` to `zsh_history`
```sh
hist_convert bash_history
```

