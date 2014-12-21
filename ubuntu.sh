upgrade_apt() {
   sudo apt-get update -f &>> $LOGDIR/apt.log || error "The errors have overwhelmed us, bro." && exit;
}

apt_get_install() {
    sudo apt-get install -y $1 &>> $LOGDIR/apt.log;
    if [ $? != 0 ]; then
        info "apt-get did not succeed, attempting apt-get update\n"
        upgrade_apt;

        sudo apt-get install -y $1 >> $LOGDIR/apt.log;
    fi
    success "\t $1 installed successfully"
}

install() {
    if hash $1 2>/dev/null; then
        info "$1 is already installed\n";
    else
        if [[ $platform == 'linux' ]]; then
 	    # TODO(mvv): I sometimes use non-debian os's.
            info "\tinstalling $1\n"
            apt_get_install "$1"
        else
            fail "\tinstallation platform not supported, expecting linux\n"
        fi
    fi
    success "git installed successfully"
}
