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

# Re-install Drupal 8
function drupal8-install() {
    # Remove existing database
    drush sql-drop -y --db-url=mysql://root:@127.0.0.1/$1;
    # Remove existing install
    sudo rm -rf sites/default;
    # Restore the sites/default/default.settings.php file
    sudo git checkout -- sites/default;
    # Temporarily make the sites/default writable by anyone
    sudo chmod -R 777 sites/default;
    # Ensure the owner is the current user, not root user
    sudo chown -R `whoami` sites/default;
    # Now that we own it and can write, change the permissions back to how drupal expects them
    sudo git checkout -- sites/default;
    # But still ensure that we own the folder
    sudo chown -R `whoami` sites/default;
 
    # Uncomment this to stop here so you can install the UI
    #exit;
 
    # If you run this command with an argument, it will be the name of the DB
    if [ $1 ] ; then
        drush si --db-url=mysql://root:@localhost/$1 -y
    else
        drush si --db-url=mysql://root:@localhost/d8 -y
    fi
    # Install and uninstall common modules
    drush en simpletest -y
    sudo chmod -R 777 sites/default/files;
}

# D7 install
function d7-install() {
  drush site-install -y $2 --db-url=mysql://root:@127.0.0.1/$1 --site-name="Default Install"
}

# Clean up old/new branch used for rebasing.
function clean-up() {
	git branch -D old_patch
	git branch -D new_patch
}

# Create a patch based on the branch name.
function cpatch() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    git diff 8.x > ~/patches/$branch"_"$1.patch
}

# alias for commit contrib modules.
function cgc() {
    git commit -m "[CONTRIB] - $1";
}