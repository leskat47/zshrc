source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
autoload -Uz compinit

# OMZ Libs
zplugin snippet OMZ::lib/bzr.zsh
zplugin snippet OMZ::lib/clipboard.zsh
zplugin snippet OMZ::lib/compfix.zsh
zplugin snippet OMZ::lib/completion.zsh
zplugin snippet OMZ::lib/correction.zsh
zplugin snippet OMZ::lib/diagnostics.zsh
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::lib/functions.zsh
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::lib/grep.zsh
zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::lib/key-bindings.zsh
zplugin snippet OMZ::lib/misc.zsh
zplugin snippet OMZ::lib/nvm.zsh
zplugin snippet OMZ::lib/prompt_info_functions.zsh
zplugin snippet OMZ::lib/spectrum.zsh
zplugin snippet OMZ::lib/termsupport.zsh
zplugin snippet OMZ::lib/theme-and-appearance.zsh

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
  zplugin ice wait"0"
  zplugin snippet OMZ::plugins/brew/brew.plugin.zsh
  zplugin ice svn wait"0" lucid atinit"local ZSH=\$PWD; mkdir -p plugins; cd plugins; ln -sfn ../. osx";
  zplugin snippet OMZ::plugins/osx
  zplugin ice wait"0"
  zplugin snippet OMZ::plugins/iterm2/iterm2.plugin.zsh
elif [[ $CURRENT_OS == 'Linux' ]]; then

  if [[ $DISTRO == 'CentOS' ]]; then

  elif [[ $DISTRO == 'Ubuntu' ]]; then

  fi

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
  zplugin ice wait"0"
  zplugin snippet OMZ::plugins/cygwin/cygwin.plugin.zsh
fi

# OS - Command Not Found Helper
zplugin ice wait"0"
zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

# Common aliases
zplugin ice wait"0"
zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

# History
zplugin ice wait"0"
zplugin snippet OMZ::plugins/history/history.plugin.zsh
zplugin ice wait"0"
zplugin snippet OMZ::plugins/per-directory-history/per-directory-history.zsh
zplugin ice wait"0"
zplugin light zdharma/history-search-multi-word

# Git
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" wait"0"
zplugin light tj/git-extras
zplugin ice svn wait"0" lucid; zplugin snippet OMZ::plugins/git
zplugin ice svn wait"0" lucid; zplugin snippet OMZ::plugins/gitfast

# Repo (for git)
zplugin ice svn wait"0" lucid; zplugin snippet OMZ::plugins/repo

# Python
zplugin snippet OMZ::plugins/pip/pip.plugin.zsh
zplugin snippet OMZ::plugins/python/python.plugin.zsh
if type workon &>/dev/null; then
  zplugin snippet OMZ::plugins/virtualenv/virtualenv.plugin.zsh
  unset VIRTUAL_ENV_DISABLE_PROMPT
  zplugin snippet OMZ::plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
fi

# Diff
zplugin ice wait"0" as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy

# Completions
zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# Load the pure theme, with zsh-async that's bundled with it
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure
