::https://hub.docker.com/_/microsoft-mssql-server
set image="mcr.microsoft.com/mssql/server"
set tag="2017-latest"
set port_0="1433"
set host_dir="/docker/persistent/sqlserver"
set inside_dir="/var/opt/mssql/data"
set env_var_0="ACCEPT_EULA=Y"
set env_var_1="SA_PASSWORD=Pwd123!@#"
set name="sqlserver-%tag%"
echo "-------------Run %image% with persistent [%host_dir%] -------------"
docker run --name %name% -v %host_dir%:%inside_dir% -e %env_var_0% -e %env_var_1% -p %port_0%:%port_0% -d --restart always %image%:%tag%
