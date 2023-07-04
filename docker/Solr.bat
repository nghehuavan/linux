@echo off
::https://hub.docker.com/_/solr
set image="solr"
set tag="8.0"
set port_0="8983"
set host_dir="D:\Home\Docker\Persistent\Solr"
set inside_dir="/var/solr"
set env_var_0=
set name="%image%-%tag%"
IF NOT EXIST "%host_dir%" (
  echo "Create persistent folder %host_dir%"
  mkdir %host_dir%
)

@echo "-------------Run %image% with persistent [%host_dir%] -------------"
docker run --name %name% -v %host_dir%:%inside_dir% -p %port_0%:%port_0% -d --restart always %image%:%tag%

if errorlevel = 1 goto found
if errorlevel = 0 goto end

:found
echo "CONTAINER EXISTED !"
echo "STARTING ....."
docker start %name%
goto end
:end
@echo "-------------                Done                    -------------"
start http:/localhost:%port_0%
pause