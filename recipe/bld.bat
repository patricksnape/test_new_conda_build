robocopy %RECIPE_DIR%\project . /E /NFL /NDL

mkdir build
cd build

cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ..
cmake --build . --target INSTALL --config Release

if errorlevel 1 exit 1
