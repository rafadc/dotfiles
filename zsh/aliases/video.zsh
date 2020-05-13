alias capture_desktop=$'ffmpeg -video_size $(xdpyinfo |awk \'/dimensions:/{printf $2}\') -framerate 60 -f x11grab -i :0.0 output.mp4'
