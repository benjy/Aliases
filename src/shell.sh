# Shell
alias c='clear'
alias wget='wget --content-disposition'
alias ll='ls -lAhGp'
alias x='exit'

function newmac() {
    sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
}
