@echo off
::https://hub.docker.com/_/rabbitmq
set image="rabbitmq"
set tag="3.8-management"
set port_0="5672"
set port_1="15672"
set host_dir="D:\Home\Docker\Persistent\RabbitMQ"
set inside_dir="/var/lib/rabbitmq/mnesia"
set env_var_0="RABBITMQ_DEFAULT_USER=guest"
set env_var_1="RABBITMQ_DEFAULT_PASS=guest"
set name="%image%-%tag%"
IF NOT EXIST "%host_dir%" (
  echo "Create persistent folder %host_dir%"
  mkdir %host_dir%
)

@echo "-------------Run %image% with persistent [%host_dir%] -------------"
docker run -d --hostname rabbitmq --name %name% -v %host_dir%:%inside_dir% -e %env_var_0% -e %env_var_1% -p %port_0%:%port_0% -p %port_1%:%port_1% -d --restart always %image%:%tag%

if errorlevel = 1 goto found
if errorlevel = 0 goto end

:found
echo "CONTAINER EXISTED !"
echo "STARTING ....."
docker start %name%
goto end
:end
@echo "-------------                Done                    -------------"
start http:/localhost:%port_1%
pause