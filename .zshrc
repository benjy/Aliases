# Path to your oh-my-zsh installation.
export ZSH=/Users/benjy/.oh-my-zsh
fpath+=~/.zfunc
ZSH_THEME="benjy"

# Disable annoying beeps.
setopt NO_BEEP

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew dircycle pass)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=bin:../bin:/local/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/sbin:/Users/benjy/terraform:/Users/benjy/Sites/stats/bin:/Users/benjy/.composer/vendor/bin:$PATH
export PATH=$PATH:$HOME/go/bin
export PATH=./node_modules/.bin:/Users/benjy/Library/Android/sdk/tools:/Users/benjy/Library/Android/sdk/platform-tools:$PATH
export PATH=/Users/benjy/Sites/pass/PassAndroid/node_modules/.bin:$PATH
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export XDEBUG_CONFIG="idekey=PHPSTORM"
export SIMPLETEST_DB=sqlite://localhost//tmp/test.sqlite
export SIMPLETEST_BASE_URL="http://d8.dev"
#export SIMPLETEST_DB=mysql://drupal:drupal@d8.dev/local

source ~/Sites/aliases/aliases
source <(tl _completion --generate-hook)
alias me="php /Users/benjy/Sites/tl/bin/tl.php assigned -u 458"

export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig
export GOPATH=$HOME/go
export ANDROID_HOME=~/Library/Android/sdk

eval "$(rbenv init -)"


alias composer='php -n /usr/local/bin/composer'

fpath=(/usr/local/share/zsh-completions $fpath)




# Automatically added by the Platform.sh CLI installer
export PATH="/Users/benjy/.platformsh/bin:$PATH"
. '/Users/benjy/.platformsh/shell-config.rc' 2>/dev/null || true
