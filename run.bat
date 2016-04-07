echo %PLATFORM%
if %PLATFORM% == "x86" (
    set MINICONDA_DIR=C:\Miniconda\Scripts
)
if %PLATFORM% == "x64" (
    set MINICONDA_DIR=C:\Miniconda-x64\Scripts
)

%MINICONDA_DIR%\conda.exe update
%MINICONDA_DIR%\conda.exe install pip -y
%MINICONDA_DIR%\conda.exe install conda-build -y

%MINICONDA_DIR%\pip.exe install https://github.com/patricksnape/conda-build/zipball/vs_logic --upgrade
 
%MINICONDA_DIR%\conda.exe build recipe --py=%PYTHON_VERSION%
