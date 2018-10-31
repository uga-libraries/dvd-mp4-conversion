# Convert DVD Video to MP4 and Create XML Metadata File

# Purpose:
Convert DVD video to MPEG-4 (using ffmpeg) and create an XML file containing technical metadata about the MP4 file (using MediaInfo).

# Dependencies:

  - ffmpeg (https://www.ffmpeg.org/download.html)
  - MediaInfo (https://mediaarea.net/en/MediaInfo/Download)

# Installation:

  1. Install the dependencies (listed above).
  2. Download the "dvd-mp4-conversion.sh" script from GitHub and save to your computer.
  3. Change permissions on the script so it is executable.

# Description:

This script performs the following tasks:

   1. Check that required arguments (target directory and media identifier) have been provided.
   2. Check that specified target directory is a valid directory path.
   3. Read and concatenate the VOB video files from DVD.
   4. Use ffmpeg to convert the concatenated VOB file to an MP4 access file.
   5. Name the MP4 file using the media identifier provided.
   6. Delete concatenated VOB file.
   7. Use MediaInfo to extract technical metadata from MP4 file and save output as XML file.

# Usage:

Load DVD into the optical drive on your machine.

Run the script with the command dvd-mp4-conversion.sh target-directory media-identifier
	Where target-directory is the full file path to the directory where the MP4 and XML metadata files will be created, and media-identifier is the unique identifier assigned to the DVD.

Verify the quality of the audio and video in the output file against that of the DVD.

Verify that XML metadata file are complete.

# Initial Author

Brandon Pieczko, Processing and Digital Archivist, 2018
