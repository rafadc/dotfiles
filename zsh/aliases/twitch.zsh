#!/usr/env zsh

alias twitch_overlay_serve="darkhttpd ~/code/twitch/overlay/ --port 22334"
twitch_set_todo() {
    ln -s $1 ~/code/twitch/overlay/todo.md
}
