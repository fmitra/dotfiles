## Git

Colorized short git logs

```
git history -n 5
```

```
git config --global alias.history "log --pretty='%C(yellow)%H %C(cyan)%ad %C(green)%aN%C(auto)%d %Creset%s' --date=relative --date-order --graph"
```

## GPG Signing

```
git config --global commit.gpgsign true
git config --global user.signingkey ${YOUR_KEY}
```

## Silver Searcher

`ag` supports an `.aignore` file where we can specify directories/files to ignore
in the same format as a `.gitignore`. Create it at `~/.aignore` for universal usage.

## iTerm2

On iOS, under Preferences > Profiles > Keps, map Option to Esc+ to fix
quick pane resizing.
