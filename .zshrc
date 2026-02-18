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
plugins=(git pod brew python macos xcode yarn) # emulator

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rbenv/bin:$HOME/Library/Python/2.7/lib/python/site-packages"

# Lazy-load rbenv (only initialized when first called)
rbenv() {
  unfunction rbenv
  eval "$(command rbenv init -)"
  rbenv "$@"
}
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

# added by travis gem
[ -f /Users/flaviocaetano/.travis/travis.sh ] && source /Users/flaviocaetano/.travis/travis.sh

# Rake
alias rake="noglob rake"

# Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export PATH="$HOME/.fastlane/bin:$PATH"

alias emulator="$HOME/Library/Android/sdk/tools/emulator"
alias arr="adb shell input text \"RR\""
alias arn="adb shell input keyevent 82"

export GPG_TTY=$(tty)

# Enable `code` from VS Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Zsh autosuggestions (hardcoded path to avoid slow $(brew --prefix) call)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Disable Fastlane checks
export FASTLANE_HIDE_CHANGELOG=1
export FASTLANE_SKIP_UPDATE_CHECK=1


# Alias to react-native link
alias rnl='npx react-native link'

# Lazy-load NVM (major speedup - NVM is very slow to load)
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME}/.nvm"

# Lazy-load nvm, node, npm, npx, yarn
_lazy_load_nvm() {
  unfunction nvm node npm npx yarn 2>/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

for cmd in nvm node npm npx yarn; do
  eval "$cmd() { _lazy_load_nvm; $cmd \"\$@\" }"
done

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Lazy-load RVM (only initialized when first called)
rvm() {
  unfunction rvm
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
  rvm "$@"
}

export PROVISIONING_PROFILES="$HOME/Library/MobileDevice/Provisioning Profiles"

alias ddxcode="killall Xcode; rm -rf ~/Library/Developer/Xcode/DerivedData/ && rm -rf ~/Library/Developer/Xcode/watchOS\ DeviceSupport/ && rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/"

# Proxyman Certs
alias proxyman='set -a && source "/Users/flaviocaetano/.proxyman/proxyman_env_automatic_setup.sh" && set +a'
alias proxyman_deactivate="set -a && source /Users/flaviocaetano/projects/dotfiles/bin/proxyman_deactivate.sh && set +a"
alias proxyman_prompt_info="/Users/flaviocaetano/projects/dotfiles/bin/prompt_info.sh"

# Custom Prompt
export PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) $(proxyman_prompt_info)%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# Lazy-load pyenv (only initialized when first called)
pyenv() {
  unfunction pyenv
  eval "$(command pyenv init --path)"
  pyenv "$@"
} 

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
