install_ack() {
    if [ $platform == 'linux' ]; then
        install "ack-grep" "ack-grep"
    else
        fail "platform not supported"
    fi
}

install_ack
