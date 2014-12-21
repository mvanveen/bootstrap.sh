upgrade_apt() {
   sudo apt-get update -f >> $LOGDIR/apt.log || error "The errors have overwhelmed us, bro." && exit;
}

apt_get_install() {
    sudo apt-get install -y $1 >> $LOGDIR/apt.log;
    if [ $? != 0 ]; then
        info "apt-get did not succeed, attempting apt-get update\n"
        upgrade_apt;

        sudo apt-get install -y $1 >> $LOGDIR/apt.log;
    fi
    success "\t $1 installed successfully"
}
