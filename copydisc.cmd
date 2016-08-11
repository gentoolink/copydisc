@echo off

REM This file is for copying bus CCTV without using the windows explorer window. Windows explorer takes too long to load
REM the files. This will work for any cdrom/dvd containing files to copy to a PC. 


set /p filenumber="Enter Case file number: "

REM create directory with file number as name




set /p discs="How many discs would you like to copy?  "

REM create two folders in destination folder for second disc.

IF %discs% == 2 (
	mkdir c:\Users\%username%\Desktop\%filenumber%
	mkdir c:\Users\%username%\Desktop\%filenumber%\%filenumber%_disc1
	mkdir c:\Users\%username%\Desktop\%filenumber%\%filenumber%_disc2
	goto :2cdcopy
	) ELSE (
	goto :continue

)



:continue

mkdir %filenumber%

cd %filenumber%


REM copy all files into user directory


ECHO Copying files to desktop...

robocopy f:\ c:\Users\%username%\Desktop\%filenumber% /e /mir /np /log:%filenumber%_copy_log.txt

echo
echo ****All files have been copied. Log file included. Have a good day %username% !***
echo
goto :end


REM copy second disc into disc2 folder in destination folder

:2cdcopy

ECHO Copying files to desktop...

cd c:\Users\%username%\Desktop\%filenumber%\%filenumber%_disc1

robocopy f:\ c:\Users\%username%\Desktop\%filenumber%\%filenumber%_disc1 /e /mir /np /log:%filenumber%Disc1_copy_log.txt

echo Take out disc one and place disc two in drive
pause

echo Copying second disc...

cd c:\Users\%username%\Desktop\%filenumber%\%filenumber%_disc2

robocopy f:\ c:\Users\%username%\Desktop\%filenumber%\%filenumber%_disc2 /e /mir /np /log:%filenumber%Disc2_copy_log.txt


echo
echo ****All files have been copied. Log file included. Have a good day %username% !***
echo
echo ***To view the video just browse to the new folder on desktop with your case file number you entered.***

pause

:end
pause
