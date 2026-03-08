# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew macos xcode) # emulator

source $ZSH/oh-my-zsh.sh

# User configuration

# PATH - consolidated
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/bin:$HOME/.local/bin:$HOME/.fastlane/bin:$PNPM_HOME:$HOME/.rbenv/bin:$HOME/.rvm/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/Library/Python/2.7/lib/python/site-packages"

# Lazy-load rbenv
_load_rbenv() {
  unset -f rbenv ruby gem bundle irb 2>/dev/null
  eval "$(command rbenv init -)"
}

rbenv()  { _load_rbenv; rbenv  "$@"; }
ruby()   { _load_rbenv; ruby   "$@"; }
gem()    { _load_rbenv; gem    "$@"; }
bundle() { _load_rbenv; bundle "$@"; }
irb()    { _load_rbenv; irb    "$@"; }

autoload -U add-zsh-hook
# export MANPATH="/usr/local/man:$MANPATH"

# New Terminal Window
newterm() { open -a Terminal "$PWD"; }


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export LC_ALL="en_US.UTF-8"

# GIT ALIASES
alias grb='git rebase'
alias gdel='git reset --hard && git clean -df'
alias gclog='git log $(git describe --abbrev=0)..HEAD --pretty=oneline --abbrev-commit'
alias gtlog='gts -m "$(gclog)"'
alias gpp='gp -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gfup='gc --fixup'
alias gcan='gc --amend --no-edit'
gn() {
  dev=$(git config core.dev-branch);
  curr=$(git rev-parse --abbrev-ref HEAD);
  if [ "$curr" = "$dev" ]; then
    echo "Already on $dev; nothing to delete.";
  else
    git checkout "$dev" && git branch -D "$curr";
  fi;
};

gbdp() { gb -d $1 && gp --no-verify origin :$1}
compdef _git gbdp=git-checkout
#setopt complete_aliases

compdef _git eqxp=git-checkout

# Rake
alias rake="noglob rake"

# Android
alias emulator="$HOME/Library/Android/sdk/tools/emulator"
alias arr="adb shell input text \"RR\""
alias arn="adb shell input keyevent 82"

# GPG - use zsh built-in $TTY instead of spawning tty subprocess
export GPG_TTY=$TTY

# Enable `code` from VS Code
# (path already in consolidated PATH block above)

# Zsh autosuggestions (hardcoded path to avoid slow $(brew --prefix) call)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Disable Fastlane checks
export FASTLANE_HIDE_CHANGELOG=1
export FASTLANE_SKIP_UPDATE_CHECK=1


# Alias to react-native link
alias rnl='npx react-native link'

# Lazy-load NVM (major speedup - NVM is very slow to load)
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME}/.nvm"

_load_nvm() {
  unset -f nvm node npm npx yarn 2>/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm()  { _load_nvm; nvm  "$@"; }
node() { _load_nvm; node "$@"; }
npm()  { _load_nvm; npm  "$@"; }
npx()  { _load_nvm; npx  "$@"; }
yarn() { _load_nvm; yarn "$@"; }


# Lazy-load RVM
_load_rvm() {
  unset -f rvm 2>/dev/null
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
}

rvm() { _load_rvm; rvm "$@"; }


export PROVISIONING_PROFILES="$HOME/Library/MobileDevice/Provisioning Profiles"

alias ddxcode="killall Xcode; rm -rf ~/Library/Developer/Xcode/DerivedData/ && rm -rf ~/Library/Developer/Xcode/watchOS\ DeviceSupport/ && rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/"

# Proxyman Certs
alias proxyman='set -a && source "$HOME/.proxyman/proxyman_env_automatic_setup.sh" && set +a'
alias proxyman_deactivate="set -a && source $HOME/projects/dotfiles/bin/proxyman_deactivate.sh && set +a"

# Custom Prompt — ${PROXYMAN_INJECTION_ACTIVE:+🚀 } expands inline, no subprocess
export PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) ${PROXYMAN_INJECTION_ACTIVE:+🚀 }%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# Lazy-load pyenv
_load_pyenv() {
  unset -f pyenv python python3 pip pip3 2>/dev/null
  eval "$(command pyenv init --path)"
  eval "$(command pyenv init -)"
}

pyenv()   { _load_pyenv; pyenv   "$@"; }
python()  { _load_pyenv; python  "$@"; }
python3() { _load_pyenv; python3 "$@"; }
pip()     { _load_pyenv; pip     "$@"; }
pip3()    { _load_pyenv; pip3    "$@"; }

# Single combined chpwd hook — one tree walk per cd, stops at first match
_version_manager_auto_use() {
  local dir="$PWD"
  # nvm_auto only exists when real NVM is sourced, not when it's just the lazy stub
  local nvm_was_loaded=0
  typeset -f nvm_auto > /dev/null 2>&1 && nvm_was_loaded=1

  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/.nvmrc" ]]; then
      _load_nvm; nvm use --silent 2>/dev/null; return
    fi
    if [[ -f "$dir/.ruby-version" || -f "$dir/.rvmrc" ]]; then
      _load_rbenv; return
    fi
    if [[ -f "$dir/.python-version" ]]; then
      _load_pyenv; return
    fi
    dir="${dir:h}"
  done

  # Left all versioned dirs — revert nvm to default only if real NVM was active
  (( nvm_was_loaded )) && nvm use default --silent 2>/dev/null
}

add-zsh-hook chpwd _version_manager_auto_use
_version_manager_auto_use  # run once on new terminal open
