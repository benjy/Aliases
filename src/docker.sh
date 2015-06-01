alias dconnect='docker exec -it $(docker ps -q -n=1) /bin/bash'
alias dc='docker-compose'

function down() {
  containers=$(docker ps -q)

  if [ $containers ]
  then
    docker stop $(docker ps -q)
  fi
}

function up() {
  down;
  docker-compose up -d
}
