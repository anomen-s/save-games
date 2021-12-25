@echo off

if "%1"=="" goto noarg
if not exist "%1.sav" goto copy

:backup
del _backup.sav
ren "%1.SAV" _BACKUP.SAV

:copy
copy EOBDATA.SAV "%1.SAV" > nul
echo Saving as: %1

goto end

:noarg
echo missing savegame name !
pause

:end
