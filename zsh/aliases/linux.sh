if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    alias eosm50_capture="sudo modprobe v4l2loopback && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video4"

    alias switch="mplayer tv:// -tv driver=v4l2:width=1920:height=1080:outfmt=mjpg:device=/dev/video0 -fps 60"
fi
