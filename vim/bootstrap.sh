

install_vim () {
    if hash vim 2>/dev/null; then
        info "vim is already installed\n";
        VIMPATH=$(which vim);
    else
        if [[ $platform == 'linux' ]]; then
 	    # TODO(mvv): I sometimes use non-debian os's.
            info "\tinstalling vim\n"
            apt_get_install "vim"
        fi
    fi
    success "vim installed successfully"
}

install_vim_pathogen_package() {
   VIM_CURRENT_PATHOGEN_INSTALL_PATH="$VIM_DOTFILE_PATH/$1.vim";

   if [ -d "$VIM_BUNDLE_PATH" ]; then
       if [ ! -d "$VIM_CURRENT_PATHOGEN_INSTALL_PATH" ]; then
           cd $VIM_BUNDLE_PATH;
               git clone $2 $VIM_CURRENT_PATHOGEN_INSTALL_PATH &>> $LOGDIR/git.log;
           cd $cwd;
       else
           info "pathogen package $1 is already installed"
       fi
       success "$1 installed sucessfully"

   else
       fail "$VIM_BUNDLE_PATH was not found"
   fi
}

setup_vim_dotfiles_dirs() {
     VIM_DOTFILE_PATH="$DOTFILE_INSTALL_PATH/vim";
     VIM_BUNDLE_PATH="$VIM_DOTFILE_PATH/bundle";
     VIM_AUTOLOAD_PATH="$VIM_DOTFILE_PATH/autoload";

     make_dir $VIM_DOTFILE_PATH;
     make_dir $VIM_BUNDLE_PATH;
     make_dir $VIM_AUTOLOAD_PATH;
}

setup_vim_pathogen() {
    VIM_PATHOGEN_PATH="$VIM_AUTOLOAD_PATH/pathogen.vim"; 
    VIM_PATHOGEN_URL="https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"

    if [ ! -f $VIM_PATHOGEN_PATH ]; then
        info "downloading vim pathogen....\n"

        if hash curl 2>/dev/null; then
            CURL_PATH=`which curl`;
            info "curl is already installed at $CURL_PATH\n";
        else
            info "\tinstalling curl\n"
            apt_get_install "curl";
        fi
        info "curling file ($VIM_PATHOGEN_URL)... \n"
        curl -so $VIM_PATHOGEN_PATH $VIM_PATHOGEN_URL >> $LOGDIR/curl.log;
    else
        info "vim pathogen already installed.\n"
    fi

    success "vim pathogen installed successfully"
}

setup_vim_pathogen_packages() {
     VIM_CTRLP_REPO="https://github.com/kien/ctrlp.vim.git";

     install_vim_pathogen_package "ctrlp" $VIM_CTRLP_REPO;
}

install_vim;
setup_vim_dotfiles_dirs;
setup_vim_pathogen;
setup_vim_pathogen_packages;
