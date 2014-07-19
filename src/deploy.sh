deploy(){

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

ALL_BRANCES=$(git branch)

STAGED_CHANGES=$(git diff --exit-code)
UNTRACKED_FILES=$(git ls-files --other --exclude-standard --directory)

# Ensure we have a branch name as an argument.
if [ -z "$1" ]
  then
    echo "Please provide a branch name to deploy."
    return
fi

if [ ! -z "$STAGED_CHANGES" ]
then
  echo 'Commit changes in working state before deployment.'
  return
fi

if [ ! -z "$UNTRACKED_FILES" ]
then
  echo 'You have untracked files. Please resolve before deployment.'
  echo "$UNTRACKED_FILES"
  return
fi

SITE_ALIAS=$(drush site-alias @$1)


if [ -z "$SITE_ALIAS" ]
then
  echo "No site alias was found for '$1'"
  return
fi

REMOTE_HASH=$(git ls-remote origin -h refs/heads/$1 | cut -f1)
LOCAL_HASH=$(git rev-parse $1)

if [ ! "$REMOTE_HASH" = "$LOCAL_HASH" ]
then
  echo -e "Your local branch is not up to date with the remote.\nPlease merge the remote changes into your local branch to deploy."
  return
fi


# We have a branch to switch to and everything is great.
echo ""
git checkout $1
echo ""

# Send our local working state to the live site
drush rsync --progress default @"$1"

echo -e "\nDeployment from 'local' to '$1' complete.\n"

$(git checkout -q $CURRENT_BRANCH)

read -p "Do you want to clear the cache on $1? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    drush @"$1" cc all
fi
}
