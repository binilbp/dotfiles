!/us/bin/bash
for f in *.mp4; do
	ffmpeg -i "$f" "${f%.mp4}.mp3"
done
