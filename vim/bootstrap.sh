install_vim () {
    install "vim";
    VIM_PATH=$(which vim);
    info "vim path: $VIM_PATH\n"
}

install_vim_pathogen_package() {
   VIM_CURRENT_PATHOGEN_INSTALL_PATH="$VIM_BUNDLE_PATH/$1.vim";

   if [ -d "$VIM_BUNDLE_PATH" ]; then
       if [ ! -d "$VIM_CURRENT_PATHOGEN_INSTALL_PATH" ]; then
           git_clone $2 $VIM_CURRENT_PATHOGEN_INSTALL_PATH;
       else
           info "pathogen package $1 is already installed"
       fi
       success "$1 installed sucessfully"
   else
       fail "$VIM_BUNDLE_PATH was not found\n"
   fi
}

setup_vim_dotfiles_dirs() {
     VIM_DOTFILE_PATH="$DOTFILE_INSTALL_PATH/.vim.symlink";
     VIM_BUNDLE_PATH="$VIM_DOTFILE_PATH/bundle";
     VIM_AUTOLOAD_PATH="$VIM_DOTFILE_PATH/autoload";
     VIM_VIMRC_PATH="$DOTFILE_INSTALL_PATH/.vimrc.symlink"

     make_dir $VIM_DOTFILE_PATH;
     make_dir $VIM_BUNDLE_PATH;
     make_dir $VIM_AUTOLOAD_PATH;

     cp vim/.vimrc $VIM_VIMRC_PATH; 
     if [ $? != 0 ]; then
         fail "cp did not succeed\n"
     fi

}

setup_vim_pathogen() {
    VIM_PATHOGEN_PATH="$VIM_AUTOLOAD_PATH/pathogen.vim"; 
    VIM_PATHOGEN_URL="https://tpo.pe/pathogen.vim"
    

   if [ ! -d "$VIM_AUTOLOAD_PATH" ]; then
       fail "$VIM_AUTOLOAD_PATH not found\n"
   fi
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
       curl -LSso $VIM_PATHOGEN_PATH $VIM_PATHOGEN_URL &>> $LOGDIR/curl.log;
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
