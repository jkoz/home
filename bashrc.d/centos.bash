if [ ! -f /etc/redhat-release ]; then
    return
fi
export LD_LIBRARY_PATH=/usr/local/lib
