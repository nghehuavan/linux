::https://hub.docker.com/_/redis
set image="redis"
set tag="4.0"
set port_0="6379"
set host_dir="/docker/persistent/redis"
set inside_dir="/data"
set env_var_0=
set name="%image%-%tag%"
echo "-------------Run %image% with persistent [%host_dir%] -------------"
docker run --name %name% -v %host_dir%:%inside_dir% -p %port_0%:%port_0% -d --restart always %image%:%tag%