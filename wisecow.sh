#!/bin/bash

SRVPORT=4499
RSPFILE=response

rm -f "$RSPFILE"
mkfifo "$RSPFILE"

get_api() {
    read -r line
    echo "$line"
}

handleRequest() {
    # 1) Process the request
    get_api
    mod=$(fortune)

    cat <<EOF > "$RSPFILE"
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8

<pre>$(cowsay "$mod")</pre>
EOF
}

prerequisites() {
    command -v cowsay >/dev/null 2>&1 &&
    command -v fortune >/dev/null 2>&1 || {
        echo "Install prerequisites: cowsay and fortune"
        exit 1
    }
}

main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."

    while true; do
        cat "$RSPFILE" | nc -lN "$SRVPORT" | handleRequest
        sleep 0.01
    done
}

main

