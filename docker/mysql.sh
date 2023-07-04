##https://hub.docker.com/_/mysql
image="mysql"
tag="8.0"
port_0="3306"
host_dir="/docker/persistent/mySql"
inside_dir="/var/lib/mysql"
env_var_0="MYSQL_ROOT_PASSWORD=Pwd123!@#"
env_var_1=
name="$image-$tag"

echo -------------Run $image with persistent [$host_dir] -------------
docker run --name $name -v $host_dir:$inside_dir -e $env_var_0 -p $port_0:$port_0 -d --restart always $image:$tag
