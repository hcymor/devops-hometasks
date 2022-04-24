docker run -d --rm -p 8081:80 --name static hometask-image
docker exec -it static rm index.php
docker cp ./index.html static:/var/www/html

