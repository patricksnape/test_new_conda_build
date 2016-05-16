if "%PLATFORM%" == "x86" (
    set MINICONDA_DIR=C:\Miniconda\Scripts
)
if "%PLATFORM%" == "x64" (
    set MINICONDA_DIR=C:\Miniconda-x64\Scripts
)

%MINICONDA_DIR%\conda.exe install conda -y
%MINICONDA_DIR%\conda.exe update --all -y
%MINICONDA_DIR%\conda.exe install pip -y
%MINICONDA_DIR%\conda.exe install conda-build -y

%MINICONDA_DIR%\conda.exe build --version
%MINICONDA_DIR%\pip.exe install https://github.com/patricksnape/conda-build/zipball/more_vs_fixes --upgrade
%MINICONDA_DIR%\conda.exe build --version

%MINICONDA_DIR%\conda.exe build recipe --py=%PYTHON_VERSION%
if errorlevel 1 exit 1

%MINICONDA_DIR%\conda.exe build recipe_setuptools --py=%PYTHON_VERSION%
if errorlevel 1 exit 1
