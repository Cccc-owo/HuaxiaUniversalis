::=====setting environment=====
@ECHO OFF
set mod_desc=ETCE.mod
set mod_dir=ETCE
::=====setting environment end=====
::=====checking=====
ECHO Time:%date%
ECHO Checking the required folder...
if not exist output\ ( mkdir output\ ) else ( del /F /S /Q output\ & rmdir /S /Q output\ & mkdir output\ )
if not exist output\%mod_dir% mkdir output\%mod_dir%\
if exist mod.zip del /F /S /Q mod.zip
::=====checking end=====
::=====processing=====
xcopy %mod_dir%\ output\%mod_dir% /E /Q /C /Y
xcopy mod_descriptor\ output\ /E /Q /C /Y
ECHO path="mod/%mod_dir%" >> output\%mod_desc%
xcopy mod_descriptor\%mod_desc% output\%mod_dir%\ /Q /C /Y
ren output\%mod_dir%\%mod_desc% descriptor.mod
xcopy CHANGELOG.md output\%mod_dir%\ /Q /C /Y
xcopy thumbnail.png output\%mod_dir%\ /Q /C /Y
ECHO.
ECHO Compressing the mod files...
7z.exe a mod.zip .\output\*
::=====processing end=====
ECHO.
ECHO End of script running.