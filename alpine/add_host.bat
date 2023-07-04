@echo off
set /p docker_ip=Enter IP :
echo "Check Exist %docker_ip% docker.local"
type "%systemroot%\system32\drivers\etc\hosts" | find "%docker_ip% docker.local" > nul
   if not errorlevel = 1 goto found

echo. >> "%systemroot%\system32\drivers\etc\hosts"
echo %docker_ip% docker.local >> "%systemroot%\system32\drivers\etc\hosts"

:done
echo "Add %docker_ip% docker.local OK"
:found
echo docker.local Exist"

pause