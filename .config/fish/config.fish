fish_add_path (brew --prefix)/bin $HOME/.local/bin


# ----- Plugin settings -----

# direnv - https://github.com/direnv/direnv/blob/master/docs/hook.md#fish
if type -q direnv
    direnv hook fish | source
end

# asdf - https://asdf-vm.com/guide/getting-started.html
if type -q asdf
    source (brew --prefix asdf)/libexec/asdf.fish
end


# ----- Aliases and environment varialbes -----

alias rm="rm -i"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
if type -q nvim
    set -x EDITOR (which nvim)
    alias vim="nvim"
end

# See https://powerline.readthedocs.io/en/latest/installation/osx.html#python-package
# This must be below pyenv init because `pip` command depends on it
set -x POWERLINE_REPOSITORY_ROOT (pip show powerline-status | grep Location | cut -d ' ' -f 2)


# ----- Local settings -----

if test -f ~/.local/fish/config.fish
    source ~/.local/fish/config.fish
end


# Trigger starshi - https://starship.rs/guide/
starship init fish | source
