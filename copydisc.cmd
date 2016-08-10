@echo off

REM This file is for copying bus CCTV without using the windows explorer window. Windows explorer takes too long to load
REM the files. This will work for any cdrom/dvd containing files to copy to a PC. 

set /p filenumber="Enter Case file number: "

REM create directory with file number as name

mkdir %filenumber%

cd %filenumber%


REM copy all files into user directory


ECHO Copying files to desktop...

robocopy f:\ c:\Users\%username%\Desktop\%filenumber% /V /ETA /e /mir /np /log:%filenumber%_copy_log.txt

echo
echo ****All files have been copied. Log file included. Have a good day %username% !***
echo

pause
