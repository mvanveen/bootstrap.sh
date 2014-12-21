install_git () {
    if hash git 2>/dev/null; then
        info "git is already installed\n";
        GITPATH=$(which git);
    else
        if [[ $platform == 'linux' ]]; then
 	    # TODO(mvv): I sometimes use non-debian os's.
            info "\tinstalling git\n"
            apt_get_install "git"
        fi
    fi
    success "git installed successfully"
}

configure_git_name() {
  info "trying to configure git name & email...\n"

  if hash git 2>/dev/null; then
      git config --global user.email "michael@mvanveen.net"
      git config --global user.name "Michael Van Veen"
  else
      fail "git is not installed!"
  fi
}

install_git
configure_git_name
