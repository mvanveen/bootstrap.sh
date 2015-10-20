install_ack() {
    if [ $platform == 'linux' ]; then
        install "ack-grep" "ack-grep"
    else
        fail "platform not supported"
    fi
}

# check for existence of ack first
hash ack 2>/dev/null || install_ack
