GIT_REPO="https://github.com/mvanveen/bootstrap.sh.git";
BOOTSTRAP_ZIP="https://github.com/mvanveen/bootstrap.sh/archive/master.zip";
BOOTSTRAP_DIR="$HOME/.bootstrap.sh";

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

warning () {
  printf "\r\033[2K  [\033[0;31mWARN\033[0m] $1\n"
  echo ''
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

install_with_curl() {
     if hash curl 2>/dev/null; then
         info "attempting to curl"
         curl $BOOTSTRAP_ZIP > "$BOOTSTRAP_DIR.Z"
         uncompress -r -f "$BOOTSTRAP_DIR.Z"

     else
         fail "curl not installed. out of options \n"
     fi
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
    install_with_curl;
fi

BOOTSTRAP_SCRIPT="$BOOTSTRAP_DIR/bootstrap.sh";

if [ ! -f $BOOTSTRAP_SCRIPT ]; then
    fail "could not find bootstrap.sh"
fi

cd $BOOTSTRAP_DIR;
./bootstrap.sh;
#git remote add origin $GIT_REPO
