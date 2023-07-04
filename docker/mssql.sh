##https://hub.docker.com/_/microsoft-mssql-server
image="mcr.microsoft.com/mssql/server"
tag="2017-latest"
port_0="1433"
host_dir="/docker/persistent/sqlserver"
inside_dir="/var/opt/mssql/data"
env_var_0="ACCEPT_EULA=Y"
env_var_1="SA_PASSWORD=Pwd123!@#"
name="$image-$tag"

echo -------------Run $image with persistent [$host_dir] -------------
docker run --name $name -v $host_dir:$inside_dir -e $env_var_0 -e $env_var_1 -p $port_0:$port_0 -d --restart always $image:$tag
