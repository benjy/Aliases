# Commit in format for work. Redmine commit.
function rc() {
  branch=`git rev-parse --symbolic-full-name --abbrev-ref HEAD | sed 's/\-.*//'`
  git commit -m "[#$branch] - $1"
}
