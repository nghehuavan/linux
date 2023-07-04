@echo off
::https://hub.docker.com/_/elasticsearch
set image="elasticsearch"
set tag="8.0.0"
set port_0="9200"
set port_1="9300"
set host_dir="D:\Home\Docker\Persistent\ElasticSearch"
set inside_dir="/usr/share/elasticsearch/data"
set env_var_0="discovery.type=single-node"
set name="%image%-%tag%"
IF NOT EXIST "%host_dir%" (
  echo "Create persistent folder %host_dir%"
  mkdir %host_dir%
)

@echo "-------------Run %image% with persistent [%host_dir%] -------------"
docker run --name %name% -v %host_dir%:%inside_dir% -p %port_0%:%port_0% -p %port_1%:%port_1% -e %env_var_0% -d --restart always %image%:%tag%


if errorlevel = 1 goto found
if errorlevel = 0 goto end

:found
echo "CONTAINER EXISTED !"
echo "STARTING ....."
docker start %name%
goto end
:end
@echo "-------------                Done                    -------------"
pause