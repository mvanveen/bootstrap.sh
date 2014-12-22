BASHRC_PATH="$DOTFILE_INSTALL_PATH/bashrc.symlink";

info "copying bashrc over to $BASHRC_PATH\n"
copy_file $cwd/bash/bashrc $BASHRC_PATH
cat $cwd/bash/history.sh >> $BASHRC_PATH
