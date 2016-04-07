robocopy %RECIPE_DIR%\project . /E /NFL /NDL

mkdir build
cd build

REM write a temporary batch file to map cl.exe version to visual studio version
echo @echo 15=9 2008> msvc_versions.bat
echo @echo 16=10 2010>> msvc_versions.bat
echo @echo 19=14 2015>> msvc_versions.bat

REM Run cl.exe to find which version our compiler is
for /f "delims=" %%A in ('cl /? 2^>^&1 ^| findstr /C:"Version"') do set "CL_TEXT=%%A"
FOR /F "tokens=1,2 delims==" %%i IN ('msvc_versions.bat') DO echo %CL_TEXT% | findstr /C:"Version %%i" > nul && set VSTRING=%%j && goto FOUND
EXIT 1
:FOUND

if "%ARCH%" == "64" (
   set "VSTRING=%VSTRING%Win64"
)

REM Trim trailing whitespace that may prevent CMake from finding which generator to use
call :TRIM VSTRING %VSTRING%

cmake -G "Visual Studio %VSTRING%" -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --target INSTALL --config Release

copy ..\bin\Release\conda_test.exe %LIBRARY_BIN%\conda_test.exe
if errorlevel 1 exit 1

:TRIM
  SetLocal EnableDelayedExpansion
  set Params=%*
  for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
  exit /B
