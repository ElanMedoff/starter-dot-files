#!/bin/bash
uuid=$(uuidgen)
uuid=${uuid:0:8}
tmux new-session -d -s "n-${uuid}"
window=0
tmux rename-window -t "n-${uuid}":0 'nvim'
tmux send-keys 'nvim ' $1 C-m
window=1
tmux new-window -t "n-${uuid}":1
tmux select-window -t "n-${uuid}":0
tmux attach-session -t "n-${uuid}"
