GIT_REPO="https://github.com/mvanveen/bootstrap.sh.git";
BOOTSTRAP_ZIP="https://github.com/mvanveen/bootstrap.sh/archive/master.zip";
BOOTSTRAP_DIR="$HOME/.bootstrap.sh";

bootstrap () {
    curl "https://raw.githubusercontent.com/mvanveen/bootstrap.sh/master/logging" > /tmp/logging.sh
    source logging.sh

    curl "https://raw.githubusercontent.com/mvanveen/bootstrap.sh/master/platform.sh" > /tmp/platform.sh
    source /tmp/platform.sh
}

bootstrap

warning () {
  printf "\r\033[2K  [\033[0;31mWARN\033[0m] $1\n"
  echo ''
}

if [ -d $BOOTSTRAP_DIR ]; then
    warning "removing old .bootstrap.sh dir\n";
    rm -rf $BOOTSTRAP_DIR ;
fi

if hash git 2>/dev/null; then
    info "cloning bootstrap into $BOOTSTRAP_DIR\n";
    git clone $GIT_REPO $BOOTSTRAP_DIR
else
    warning "git is not installed\n";
    curl "https://raw.githubusercontent.com/mvanveen/bootstrap.sh/master/git/git.sh" > /tmp/git.sh
    source /tmp/platform.sh
    install_git
fi

BOOTSTRAP_SCRIPT="$BOOTSTRAP_DIR/bootstrap.sh";

if [ ! -f $BOOTSTRAP_SCRIPT ]; then
    fail "could not find bootstrap.sh"
fi

echo $BOOTSTRAP_SCRIPT
source $BOOTSTRAP_SCRIPT
