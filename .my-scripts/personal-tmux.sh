#!/bin/bash

session_name='personal'

tmux has-session -t $session_name
if [ $? != 0 ]
then

    # SESSION

    cd ~
    tmux new-session               -ds $session_name
    tmux set-window-option          -t $session_name     allow-rename off
    tmux rename-window              -t $session_name:0   dotfiles

    # GENERAL OPTIONS / DESIGN

    # tmux set                        -g status-style bg=red
    # tmux set                        -g status-style bg=red
    # tmux set                        -g pane-border-style "fg=white"
    # tmux set                        -g pane-active-border-style "bg=default fg=red"
    # tmux set                        -g window-style "fg=#E4E2E1 bg=#332E33"
    # tmux set                        -g window-active-style "fg=white bg=black"

    # FIRST WINDOW

    tmux send-keys                  -t $session_name:0.0 'cd ~/Documents/work/personal/dotfiiles' C-m
    tmux send-keys                  -t $session_name:0.0 'clear' C-m

    # SECOND WINDOW

    tmux new-window                 -t $session_name:1
    tmux set-window-option          -t $session_name:1   allow-rename off
    tmux rename-window              -t $session_name:1   kickstart

    tmux send-keys                  -t $session_name:1.0 'cd ~/Documents/work/personal/kickstart.nvim/' C-m
    tmux send-keys                  -t $session_name:1.0 'clear' C-m
    tmux split-window      -v -p 25 -t $session_name:1.0
    tmux split-window      -h -p 50 -t $session_name:1.1
    tmux send-keys                  -t $session_name:1.1 'cd ~/Documents/work/personal/kickstart.nvim/' C-m
    tmux send-keys                  -t $session_name:1.1 'clear' C-m
    tmux send-keys                  -t $session_name:1.2 'cd ~/Documents/work/personal/kickstart.nvim/' C-m
    tmux send-keys                  -t $session_name:1.2 'clear' C-m

    tmux select-pane                -t 0

    # Third WINDOW

    tmux new-window                 -t $session_name:2
    tmux set-window-option          -t $session_name:2   allow-rename off
    tmux rename-window              -t $session_name:2   books

    tmux send-keys                  -t $session_name:2.0 'cd ~/Documents/work/personal' C-m
    tmux send-keys                  -t $session_name:2.0 'clear' C-m
    tmux split-window      -v -p 50 -t $session_name:2.0
    tmux send-keys                  -t $session_name:2.1 'cd ~/Documents/work/personal/books/' C-m
    tmux send-keys                  -t $session_name:2.1 'clear' C-m
    tmux split-window      -h -p 20 -t $session_name:2.0
    tmux send-keys                  -t $session_name:2.2 'cd ~/Documents/work/personal/books/books_summary' C-m
    tmux send-keys                  -t $session_name:2.2 'clear' C-m
    tmux send-keys                  -t $session_name:2.2 'kvim' C-m

    # Forth Window
    tmux new-window                 -t $session_name:3
    tmux set-window-option          -t $session_name:3   allow-rename off
    tmux rename-window              -t $session_name:3   wiki

    tmux send-keys                  -t $session_name:3.0 'cd ~/Documents/work/personal/wiki' C-m
    tmux send-keys                  -t $session_name:3.0 'clear' C-m

    tmux select-pane                -t 0
    # SELECT DEFAULT PANE AFTER OPENING

    # tmux select-window              -t $session_name:0
    # tmux select-pane                -t 0
fi

tmux attach -t $session_name
