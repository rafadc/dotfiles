Xephyr -br -ac -noreset -screen 1920x1080 :1 &
DISPLAY=:1 xmonad &
obs &
code &

exec /usr/bin/startxfce4
