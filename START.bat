@echo off
setlocal

:: Prompt the user for a YouTube link
echo Please enter the YouTube link:
set /p youtube_link=

:: Validate if a link was entered
if "%youtube_link%"=="" (
    echo No link entered. Exiting.
    exit /b 1
)

:: Run yt-dlp to download and convert the video to MP3
yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-metadata -o "%USERPROFILE%\Desktop\%%(artist)s - %%(title)s.%%(ext)s" "%youtube_link%"

:: Check if yt-dlp completed successfully
if %ERRORLEVEL%==0 (
    echo Download and conversion completed successfully.
) else (
    echo An error occurred during the process.
)

pause
