# Drush
alias cc="drush cc all"
alias ccc="drush cc all; clear;"

# Download and enable a module
function dm(){
  drush dl $1; 
  drush en -y $1;
}
