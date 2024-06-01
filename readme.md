### Build image:

    docker build -t node-app:v3 .

## create network

    docker network create node-app-network

## Start MYSQL:
    
    docker run
    --rm
    -d
    --name mysql_server
    -e MYSQL_DATABASE='test_db'
    -e MYSQL_USER='ahmd'
    -e MYSQL_PASSWORD='secret'
    -e MYSQL_ROOT_PASSWORD='secret'
    --network node-app-network
    mysql:8.0 

    
## Start node-app

    docker run
    --rm
    --name node-app
    --network node-app-network
    -p 3000:3000
    -v $(pwd):/app
    node-app:v3 

## Stop running container using

    docker stop node-app
    docker stop mysql_server

## or start using

    docker-compose up

## and stop using

    docker-compose down

