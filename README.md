# Alex's Dotfiles

To use these settings

* fork and clone this repo into your own home directory, i.e. `~/dotfiles`
* then copy some or all of the contents of `dotfiles/bash_profile` into your `~/.bash_profile`

They're tailored for my personal setup on OS X (though lots of the settings should work for Linux as well).

If you want IRB to have a simple prompt, and/or to use `awesome_print` to show values, copy or symlink `dotfiles/irbrc` into `~/.irbrc`

If you want git to automatically strip trailing whitespace on commits, see instructions in `pre-commit`

# my git config

To use my git colors and aliases and branch settings, run

    git config --global --edit

and use these settings

    [color]
            diff = auto
            status = auto
            branch = auto
            interactive = auto
    [alias]
            st = status
            ci = commit
            co = checkout
            br = branch
            unadd = reset HEAD
            diffc = diff --cached
            amend = commit -a --amend
            last = log -1 HEAD
            l = log --oneline --decorate --graph
    [push]
            default = matching
    [branch]
            autosetupmerge = true

now `git l` will make a pretty short log, and a mere `l` will do the same but with more info

