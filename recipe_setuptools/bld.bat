xcopy /s %RECIPE_DIR%\src .

"%PYTHON%" setup.py install

if errorlevel 1 exit 1
