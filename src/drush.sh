# Drush
alias cc="drush cc all"
alias ccc="drush cc all; clear;"

# Download and enable a module
function dm(){
  drush dl $1; 
  drush en -y $1;
}

# Drupal
alias drupal-htaccess="wget -q --no-check-certificate -t 3 https://raw.github.com/drupal/drupal/7.x/.htaccess"
alias drupal-updates="drush up -n | grep -ir 'available'"

# Run simpletest with run-tests. (D8)
function run-tests() {
  php core/scripts/run-tests.sh --verbose --url "http://localhost/${PWD##*/}" --class "$1"
}

# Rebuild PHPStorm hooks.
function drupal-hooks() {
  find . -name \*.php | xargs grep -l '^function hook_' | xargs ~/parse_drupal_api.pl > ~/Library/Preferences/WebIde60/templates/user.xml
}

# Apply a remote patch.
function dpatch() {
  curl $1 | git apply
}
