@echo off

if "%1"=="" goto noarg

del _BACKUP.SAV
if exist "EOBDATA.SAV" ren EOBDATA.SAV _BACKUP.SAV
copy "%1" EOBDATA.SAV > nul
echo Using: %1

goto end

:noarg
echo missing filename

:end

