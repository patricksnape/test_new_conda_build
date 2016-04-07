if "%PLATFORM%" == "x86" (
    set MINICONDA_DIR=C:\Miniconda\Scripts
)
if "%PLATFORM%" == "x64" (
    set MINICONDA_DIR=C:\Miniconda-x64\Scripts
)

%MINICONDA_DIR%\conda.exe update
%MINICONDA_DIR%\conda.exe install pip -y
%MINICONDA_DIR%\conda.exe install conda-build -y

%MINICONDA_DIR%\pip.exe install https://github.com/patricksnape/conda-build/zipball/vs_logic --upgrade

if "%PYTHON_VERSION%" == "2.7" (
    rem Test Python tools for VS
    %MINICONDA_DIR%\conda.exe build recipe --py=%PYTHON_VERSION%
    if errorlevel 1 exit 1
    rem Test VS 2008 - First remove vcvarsall for Python tools
    del %LOCALAPPDATA%\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat
    %MINICONDA_DIR%\conda.exe build recipe --py=%PYTHON_VERSION%
    if errorlevel 1 exit 1
) else (
    %MINICONDA_DIR%\conda.exe build recipe --py=%PYTHON_VERSION%
    if errorlevel 1 exit 1
)