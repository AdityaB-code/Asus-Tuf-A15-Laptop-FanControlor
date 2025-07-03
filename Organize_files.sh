#!/bin/bash
# 📂 Organize Downloads: Videos, Audio, Pictures

# Set target directory
DOWNLOADS="$HOME/Downloads"

# Go to Downloads
cd "$DOWNLOADS" || exit

# Create folders if they don't exist
mkdir -p Videos
mkdir -p Audio
mkdir -p Pictures

# Move video files (.mp4, .mkv)
mv *.mp4 *.mkv Videos/ 2>/dev/null

# Move audio files (.mp3)
mv *.mp3 *.wav Audio/ 2>/dev/null

# Move image files (.png, .jpg, .jpeg)
mv *.png *.jpg *.jpeg Pictures/ 2>/dev/null

echo "✅ Downloads organized!"
