@echo Enter your pairing ip:port 
@echo off
set /P id=ip:port : 
adb pair %id%

@echo Enter your connecting ip:port 
@echo off
set /P idd=ip:port : 
adb connect %idd%
@echo connecting.......

@echo Starting.......
@echo off
adb shell pm list packages > pkgslist.txt
set k=%CD%
@echo all package names saved in pkgslist.txt
@echo Executing stringStrip........
cd py
python %k%\StringStrip.py
cd ..
@echo Creating ADB filesystem paths.....
FOR /F "tokens=* delims=" %%x in (appPaths.txt) DO adb shell pm path %%x >> adbpath.txt
@echo APK PATHS PULLED SUCCESSFULLY....
@echo initializing....
@echo Pulling APK files from device.....
cd py
python %k%\pathStrip.py
cd ..
FOR /F "tokens=* delims=" %%x in (finalPaths.txt) DO adb pull %%x %k%\apks
@echo apks pulled successfully...
del pkgslist.txt
del adbpath.txt
adb disconnect %idd%
pause