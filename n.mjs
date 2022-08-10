#!/usr/bin/env zx

const uuid = (await $`uuidgen`).stdout.substring(0, 8);
await $`tmux new-session -d -s "n-${uuid}"`;
await $`window=0`;
await $`tmux rename-window -t 'n-${uuid}':0 'nvim'`;
await $`tmux send-keys 'nvim ' ${argv._[0]} C-m`;
await $`window=1`;
await $`tmux new-window -t 'n-${uuid}':1`;
await $`tmux select-window -t 'n-${uuid}':0`;
await $`tmux attach-session -t 'n-${uuid}'`;
