@echo off

set folder=%1
if [%1]==[] (
    echo nuking .git in %cd%
) else (
    cd %folder%
    echo nuking .git in %cd%
)

call :treeProcess
goto :eof

:treeProcess
rem for each .git folder found in the current folder, rimraf it
for /D %%d in (.git) do call :folderProcess %%d

rem for each sub-folder, go into it and recurse
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)
exit /b

:folderProcess
@rem @echo processing %1 in %cd%
@echo %cd%
if exist %1 rimraf %1
@rem if not exist %1 echo %1 does not exist
exit /b

exit /B 0
