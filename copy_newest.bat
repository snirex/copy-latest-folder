rem By Snir Elgabsi
rem Kill all processes:
taskkill /F /im Simulator.exe
taskkill /F /im MyTask.exe
rem etc...

@echo off
rem Batch file Explanation
rem ----------------------
rem /b is for bare format
rem od-h only dir, not hidden
rem t:c use creation date for sort. Use t:w for write date
rem od sort oldest first
rem ends with "*Official-Skyline"

echo.
echo.

SET parent_folder=D:\MyFolder\
SET debug_folder=D:\MyFolder\Debug

rem find the most new folder with postfix 'Official-Skyline':
FOR /F "deilms=" %%i IN ('dir /b /ad-h /t:c /od "*Official-Skyline"') DO SET new_folder=%%i
(
  echo Copy contents of the newest folder that ends with 'Official-Skyline':
  echo %new_folder%
  echo to folder:
  echo %debug_folder%
echo.
  echo Press any key to continue, or close that window to stop
  pause > NUL
echo.

:delete_folder
  rem Delete the debug folder
  rd /S /Q %debug_folder%

rem check for errors:
if exist %debug_folder% (
  echo ERROR:
  echo folder &debug_folder% not deleted!
  echo Press any key to try again...
  pause > NUL

  goto delete_folder
)

  echo Folder deleted: %debug_folder%
echo.
  echo coping files:
echo.
  xcopy /s %new_folder% %parent_folder%
echo.
  echo folder: %new_folder was copied to %parent_folder% successfuly.
echo   $$$$
echo  $$    $$ $$     $$  $$$
echo   $$    $$  $$    $   $$$$$-
echo    $$   $$   $$  $$   $$  
echo $$$$   $$   $$   $$   $$
)

echo.
pasue > NUL
