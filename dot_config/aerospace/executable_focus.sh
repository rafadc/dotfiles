#!/usr/bin/env bash

APP_NAME=$1

app_window_id=$(aerospace list-windows --all --format "%{window-id}%{right-padding} | %{app-name}" | grep $APP_NAME | cut -d' ' -f1 | sed '1p;d')
aerospace focus --window-id $app_window_id
aerospace move-mouse window-lazy-center
