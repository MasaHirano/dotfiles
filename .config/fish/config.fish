fish_add_path /opt/homebrew/bin

# ----- Theme settings for ilanCosman/tide -----

# See https://github.com/IlanCosman/tide/wiki/Configuration
set --global tide_git_icon '\UE0A0'


# ----- Plugin settings -----

# direnv
# See https://github.com/direnv/direnv/blob/master/docs/hook.md#fish
direnv hook fish | source

# asdf
# See https://asdf-vm.com/guide/getting-started.html
if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
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

if test -f ~/.local/config.fish
  source ~/.local/config.fish
end
