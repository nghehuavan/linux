##https://hub.docker.com/_/redis
image="redis"
tag="4.0"
port_0="6379"
host_dir="/docker/persistent/redis"
inside_dir="/data"
env_var_0=
name="$image-$tag"
echo -------------Run $image with persistent [$host_dir] -------------
docker run --name $name -v $host_dir:$inside_dir -p $port_0:$port_0 -d --restart always $image:$tag
