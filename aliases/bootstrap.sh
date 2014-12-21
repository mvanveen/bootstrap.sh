ALIAS_INSTALL_PATH="$DOTFILE_INSTALL_PATH/aliases";

setup_aliases() {
   info "copying base alias to .install dir \n"

   ALIAS_SOURCE_ALIAS="$cwd/aliases/aliases";
   cp $ALIAS_SOURCE_ALIAS $ALIAS_INSTALL_PATH;

   if [ $platform == 'linux' ]; then
     info "adding linux-specific aliases\n"

     cat aliases/aliases.linux >> $ALIAS_INSTALL_PATH;
     if hash ack-grep 2>/dev/null; then
        info "adding ack-grep alias"
        echo "alias ack=\"ack-grep\"" >> $ALIAS_INSTALL_PATH
     fi
   else
     info "no aliases for platform $platform"
   fi
}

setup_aliases
