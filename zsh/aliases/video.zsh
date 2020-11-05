alias screen-disable-second='xrandr --output DP-1 --off'
alias screen-enable-second='xrandr --output DP-1 --mode 1920x1080 --rate 60 --right-of DP-2'

alias capture_desktop=$'ffmpeg -video_size $(xdpyinfo |awk \'/dimensions:/{printf $2}\') -framerate 60 -f x11grab -i :0.0 output.mp4'

alias eos_webcam='gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0'

alias transcode_folder='mkdir transcoded; for i in *.MP4; do ffmpeg -i "$i" -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov "transcoded/${i%.*}.mov"; done'
