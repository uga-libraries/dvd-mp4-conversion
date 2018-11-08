#!/bin/bash
# dvd-mp4-conversion.sh (Version 1.1)

# Purpose:
  # Reads VOB files on DVD, concatenates VOB files into a single file, and converts that file to an MP4 access file using ffmpeg.
  # Uses MediaInfo to extract technical metadata and saves the information as an XML file.

# Script is written for Unix environments
  # Windows Users:
    # Run script using Cygwin Terminal, Git Bash, or other bash terminal emulator
    # Make sure ffmpeg and MediaInfo have been added to the Windows Environmental Variables Path

# Required arguments:
  # (1) the path of the directory where the output files will be created
  # (2) the media identifier (e.g. rbrl432dvd0001) that will be used in the filename of the MP4 video and metadata file.

# Dependencies: ffmpeg, MediaInfo

# Check that required arguments have been entered in the terminal.
if [ "$#" -ne "2" ]
  then echo "Error: Include the target directory and media identifier to run script"
  exit 1
fi

# Check that provided target directory is a valid directory.
if [ ! -d "$1" ]
  then echo "Error: Target directory is not a valid directory path"
  exit 1
fi

# Read and concatenate VOB video files from DVD
cd "D:/VIDEO_TS"
echo ""
echo "Concatenating VOB video files from DVD"
echo ""
cat *.VOB > "$1/concatenated.VOB"
mkdir "$1/output-files"
mv "$1/concatenated.VOB" "$1/output-files"
cd "$1/output-files"

# Use ffmpeg to convert the concatenated VOB file to an MP4 file, assign name to MP4 file using the media identifer provided as the second argument, and delete concatenated VOB file.
  # ffmpeg settings: using libx264 (MPEG4-AVC) as video codec rather retaining MPEG-4 Part2 codec from DVD video because it is more efficient and results in a smaller output file with the same quality.
echo "Generating MP4 access file"
echo ""
  for d in *; do
    ffmpeg -loglevel panic -i "$d" -codec:a copy -codec:v libx264 "$2".mp4
  done
rm concatenated.VOB

# Use MediaInfo to extract technical metadata from MP4 file and save as XML metadata file.
echo "Extracting technical metadata from MP4 and saving to XML file"
echo ""
  for d in *; do
    mediainfo -f --Output=XML "$2".mp4   > "$2"_mediainfo.xml
  done

echo "Script has finished. Verify the quality of the audio and video in the output file against the DVD."
