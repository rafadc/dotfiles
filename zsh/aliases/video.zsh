alias capture_desktop=$'ffmpeg -video_size $(xdpyinfo |awk \'/dimensions:/{printf $2}\') -framerate 60 -f x11grab -i :0.0 output.mp4'

alias eos_webcam='gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0'
