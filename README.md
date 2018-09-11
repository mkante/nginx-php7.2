### NGINX PHP 7.2
This is a Dockerfile/image to build a container for nginx 1.14 and php-fpm 7.2.8

Pull the image
```bash
docker pull mkante/nginx-php7.2:latest
```

Build the image
```bash
git clone git@github.com:mkante/nginx-php7.2.git master
cd nginx-php7.2 
docker build .
```
