if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    alias add_loopback='pacmd load-module module-loopback latency_msec=5'

    alias eosm50_capture="sudo modprobe v4l2loopback && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0  -s 1980x1080 -f v4l2 /dev/video4"

    alias switch="mplayer tv:// -tv driver=v4l2:width=1920:height=1080:outfmt=mjpg:device=/dev/video0 -fps 60"
    alias xbox="sudo nice -n -20 mplayer tv:// -tv driver=v4l2:width=1920:height=1080:device=/dev/video0:alsa=1:adevice=hw.5 -fps 59.940 -vo gl -lavdopts lowres=1:fast:skiploopfilter=all -framedrop -nocache"
fi
