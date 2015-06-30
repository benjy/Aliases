# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

setopt NO_BEEP


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew dircycle)

source $ZSH/oh-my-zsh.sh
source ~/Sites/aliases/aliases

# Customize to your needs...
export PATH=bin:../bin:/local/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/local/git/bin:/usr/local/mysql/bin:$PATH
export PATH=$PATH:$HOME/.rbenv/bin:/usr/local/sbin:~/.composer/vendor/bin
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# Go
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:/usr/local/opt/go/libexec/bin

export XDEBUG_CONFIG="idekey=PHPSTORM"

export DOCKER_HOST=tcp://192.168.33.10:2376
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/Users/benjy/Sites/tls

export NODE_PATH="/usr/local/lib/node_modules"
eval "$(rbenv init -)"
