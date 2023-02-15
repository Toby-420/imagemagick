@echo on
cls
title Image Convert
set cycles=1

:start
echo Current image is %cycles% 

set /p x=Enter horizontal pixel: 
set /a xa=x/10
echo Horizontal text level is now %xa%
set /p y=Enter vertical pixel: 
set /a ya=y/30
set /a y=ya+y
set /a ytf=ya/2
set /a yt=y-ytf
echo Vertical is now %y%
REM ren *%cycles%*.png %cycles%.png
REM echo %cycles%
set /p string=Enter image text: 
set /p size=Enter text size (pts): 
convert %cycles%.png -gravity north -extent %x%x%y% %cycles%-.png
timeout /T 5 /NOBREAK
convert  -pointsize %size% -fill black -draw "text %xa%,%yt% '%string%'" %cycles%-.png %cycles%-t.png

del %cycles%.png && del %cycles%-.png
ren %cycles%-t.png %cycles%.png
set /a cycles=cycles+1

goto start