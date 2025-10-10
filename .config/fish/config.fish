# Interactive shell setup
if status is-interactive

  # starship
  starship init fish | source

  # yazi
  function y
	  set tmp (mktemp -t "yazi-cwd.XXXXXX")
	  yazi $argv --cwd-file="$tmp"
	  if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		  builtin cd -- "$cwd"
	  end
	    rm -f -- "$tmp"
    end
  end

  # zoxide
  zoxide init --cmd cd fish | source

bind alt-backspace backward-kill-path-component
bind \e\x7f backward-kill-path-component
bind \e\b backward-kill-path-component

# Aliases
alias nv="nvim"
alias py="python3"
alias c="gcc"
alias cpp="g++"
alias rails="rails.ruby3.4"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

##############################################################################

# Envs
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH $HOME/bin $PATH
set -gx DOTNET_ROOT $HOME/.dotnet
set -gx PATH $DOTNET_ROOT $PATH
set -gx PATH $HOME/.local/share/gem/ruby/3.4.0/bin $PATH
set -gx EDITOR nvim
set -gx LS_COLORS (vivid generate rose-pine)
set -Ux PYTHONHISTFILE /dev/null
