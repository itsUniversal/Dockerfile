**Docker file**:\
 1. Docker alpine  - minimal\
 2. Nginx installation\
 3. Copy nginx base conf file\
 4. Creating configuration folder (will be updated by script)\
 5. Run the nginx and expose port 80

**update_nginx_configuration.sh**\

The script can find and update the nginx docker.
 1. find the docker id and save to variable: \
 `running_nginx_containers=$(docker ps | grep nginx | awk '{print $1}')` 
 2. copy the file into docker: \
 `docker cp nginx/default.conf $i:/etc/nginx/conf.d/default.conf;`
 3. reload nginx without restart: \
 `docker exec -it $i nginx -s reload`

**Step to reproduce**
1. Docker build: \
    `docker build -t nginx .`
2. Docker run: \
    `docker run -p 8080:8080 -p 80:80 -itd nginx`
3. Update nginx config: \
    `sh update_nginx_configuration.sh`

The json response can find in nginx/default.conf

