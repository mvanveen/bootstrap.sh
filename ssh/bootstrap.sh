SSH_PUB_KEY_FILE="$HOME/.ssh/id_rsa.pub"

set_ssh_keys() {
   if [ ! -f $SSH_PUB_KEY_FILE ]; then
       info "ssh keys not detected. setting some up\n"
       ssh-keygen -q -N "" -t rsa -C "michael@mvanveen.net"
   fi
}

set_ssh_keys;
