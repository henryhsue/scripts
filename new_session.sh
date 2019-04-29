#!/bin/bash

tmux ls | grep henry
if [ $(echo $?) ]
then
    tmux new-session
else
    name="henry"
    tmux new-session -d -s henry
    tmux select-pane -t 0
    tmux send-keys 'cd /Users/henryhsue/Personal/notes' 'Enter' 'vim TasksDaily' 'Enter' ':' 'set nu!' 'Enter' 'G'
    tmux send-keys ':set nonumber' 'Enter'
    tmux rename-window 'notes'
    tmux split-window -h -t henry
    tmux select-pane -t 1
    tmux send-keys 'cd /Users/henryhsue/Personal/notes' 'Enter' 'vim NotesDaily' 'Enter' ':' 'set nu!' 'Enter' 'G'
    tmux send-keys ':set nonumber' 'Enter' 
    tmux a -t henry
fi
