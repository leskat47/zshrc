source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
autoload -Uz compinit

# OMZ Libs
zinit snippet OMZ::lib/bzr.zsh
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/compfix.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/correction.zsh
zinit snippet OMZ::lib/diagnostics.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/grep.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/misc.zsh
zinit snippet OMZ::lib/nvm.zsh
zinit snippet OMZ::lib/prompt_info_functions.zsh
zinit snippet OMZ::lib/spectrum.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
  zinit ice wait"0"
  zinit snippet OMZ::plugins/brew/brew.plugin.zsh
  zinit ice svn wait"0" lucid atinit"local ZSH=\$PWD" \
    atclone"mkdir -p plugins; cd plugins; ln -sfn ../. osx"
  zinit snippet OMZ::plugins/osx
  zinit ice wait"0"
  zinit snippet OMZ::plugins/iterm2/iterm2.plugin.zsh
elif [[ $CURRENT_OS == 'Linux' ]]; then

  if [[ $DISTRO == 'CentOS' ]]; then

  elif [[ $DISTRO == 'Ubuntu' ]]; then

  fi

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
  zinit ice wait"0"
  zinit snippet OMZ::plugins/cygwin/cygwin.plugin.zsh
fi

# OS - Command Not Found Helper
zinit ice wait"0"
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

# Common aliases
zinit ice wait"0"
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

# History
zinit ice wait"0"
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit ice wait"0"
zinit snippet OMZ::plugins/per-directory-history/per-directory-history.zsh
zinit ice wait"0"
zinit light zdharma/history-search-multi-word

# Git
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" nocompile'!'
zinit light tj/git-extras

# Repo (for git)
zinit ice svn; zinit snippet OMZ::plugins/repo

# Python
zinit snippet OMZ::plugins/pip/pip.plugin.zsh
zinit snippet OMZ::plugins/python/python.plugin.zsh
export VIRTUAL_ENV_DISABLE_PROMPT=1
if type workon &>/dev/null; then
  zinit snippet OMZ::plugins/virtualenv/virtualenv.plugin.zsh
  unset VIRTUAL_ENV_DISABLE_PROMPT
  zinit snippet OMZ::plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
fi

# Diff
zinit ice wait"0" as"program" pick"bin/git-dsf"
zinit light zdharma/zsh-diff-so-fancy

# Completions
zinit ice wait"0" blockf
zinit light zsh-users/zsh-completions

zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# Load the pure theme, with zsh-async that's bundled with it
zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure
