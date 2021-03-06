@echo off

set folder=%1
if [%1]==[] (
    echo nuking node_modules in %cd%
) else (
    cd %folder%
    echo nuking node_modules in %cd%
)

call :treeProcess
goto :eof

:treeProcess
rem for each node_module folder found in the current folder, rimraf it
for /D %%d in (*node_modules*) do rimraf %%d

rem for each sub-folder, go into it and recurse
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)
exit /b
