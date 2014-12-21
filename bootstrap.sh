cwd=`pwd`;

make_dir() {
    if [ ! -d "$1" ]; then
        info "making directory $1 \n"
        mkdir $1;
        success "made directory successfully"
    fi
}

source logging.sh

keyboard_interrupt () {
    fail "Keyboard interrupt detected.  Pulling out!\n"
}

trap keyboard_interrupt SIGINT;

DOTFILE_INSTALL_PATH="$cwd/.install";

## check to make sure the .install path exists
info "checking dotfile install path\n"
make_dir $DOTFILE_INSTALL_PATH

info "setting up plaftorm...\n"
source platform.sh
success "platform configuration successful"

info "checking git configuration\n"
source git/bootstrap.sh
success "git configuration successful"

info "checking vim configuration\n"
source vim/bootstrap.sh
success "vim configuration successful"

info "checking ack configuration\n"
source ack/bootstrap.sh
success "ack configuration successful"

info "checking alias configuration\n"
source aliases/bootstrap.sh
success "alias configuration successful"
