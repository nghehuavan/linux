@echo off
::https://hub.docker.com/r/gvenzl/oracle-xe
set image="gvenzl/oracle-xe"
set tag="18.4.0"
set port_0="1521"
set host_dir="D:\Home\Docker\Persistent\Oracle"
set inside_dir="/opt/oracle/oradata"
set env_var_0="ORACLE_PASSWORD=SYS"
set env_var_1="ORACLE_DATABASE=ORACLE"
set env_var_2="APP_USER=ORACLE"
set env_var_3="APP_USER_PASSWORD=Pwd123!@#"
set name="oracle-xe-%tag%"
IF NOT EXIST "%host_dir%" (
  echo "Create persistent folder %host_dir%"
  mkdir %host_dir%
)

@echo "-------------Run %image% with persistent [%host_dir%] -------------"
docker run --name %name% -v %host_dir%:%inside_dir% -e %env_var_0% -e %env_var_1% -e %env_var_2% -e %env_var_3% -p %port_0%:%port_0% -d --restart always %image%:%tag%

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