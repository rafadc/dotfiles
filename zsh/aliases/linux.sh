if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    alias xbox="sudo nice -n -20 mplayer tv:// -tv driver=v4l2:width=1920:height=1080:device=/dev/video0:alsa=1:adevice=hw.5 -fps 59.940 -vo gl -lavdopts lowres=1:fast:skiploopfilter=all -framedrop -nocache"

    alias startx-xmonad="cp $HOME/.dotfiles/wm/xmonad/xinitrc $HOME/.xinitrc && startx"
    alias startx-xfce="cp $HOME/.dotfiles/wm/xfce/xinitrc $HOME/.xinitrc && startx"
    alias startx-qtile="cp $HOME/.dotfiles/wm/qtile/xinitrc $HOME/.xinitrc && startx"
    alias startx-gnome="cp $HOME/.dotfiles/wm/gnome/xinitrc $HOME/.xinitrc && startx"

    alias airserver="gst-launch-1.0 airplaysrc ! queue ! h264parse ! avdec_h264 max-threads=1 ! xvimagesink"

    streamset() {
        obs &
        streamdeck &
        Xephyr :1 -screen 1920x1080 -noreset -br &
        setxkbmap -display :0 -print | xkbcomp - :1
        DISPLAY=:1 xmonad &
        airserver &
    }
fi
