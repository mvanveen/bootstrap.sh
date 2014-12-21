install_ack() {
    if [ $platform == 'linux' ]; then
        install "ack-grep"
    else
        fail "platform not supported"
    fi
}

install_ack
