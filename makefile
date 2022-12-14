CURRENT_TIME = $(shell date +'%y.%m.%d %H:%M:%S')
CURRENT_TAG = "v0.1"

build: 
	docker build -t emhavis/pkc_mariadb:${CURRENT_TAG} --build-arg BUILD_SMW=true .

buildAndPush:
	docker build -t emhavis/pkc_mariadb:${CURRENT_TAG} --build-arg BUILD_SMW=false .
	docker push emhavis/pkc_mariadb:${CURRENT_TAG}

buildAndPushSMW: 
	docker build -t emhavis/pkc_mariadb:${CURRENT_TAG} --build-arg BUILD_SMW=true .
	docker push emhavis/pkc_mariadb:${CURRENT_TAG}

push:
	docker push emhavis/pkc_mariadb:${CURRENT_TAG}

build_no_cache: 
	docker build --no-cache -t emhavis/pkc_mariadb:${CURRENT_TAG} .

push_no_cache: 
	docker push emhavis/pkc_mariadb:v0.6

commitToGitHub:
	git add .
	git commit -m 'Created Makefile for the first time, and committed at ${CURRENT_TIME}'
	git push

buildMulti:
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm64/v8 -t emhavis/pkc_mariadb:${CURRENT_TAG} --push . 

buildMultiLocal:
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 -t localhost:5000/pkc_mariadb:${CURRENT_TAG} --push .


# docker build -t emhavis/pkc_semanticwiki:v1.37.1.build.2 --build-arg BUILD_SMW=true .
# 



# docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t emhavis/pkc_matomo:v.02 . 
# docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t emhavis/pkc_moodle:v.01 . 
# docker buildx inspect --bootstrap
#   206  docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
#   207  docker buildx create --name multiarch --driver docker-container --use
#   208  docker buildx inspect --bootstrap