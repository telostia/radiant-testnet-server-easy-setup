
# radiant node
up:
	docker-compose up
stop:
	docker-compose stop
build:
	docker-compose up --build
rm:
	docker-compose rm -f
bash:
	docker exec -it radiant-set bash
getinfo:
	docker exec -it radiant-set sh -c "radiant-cli -datadir=/root/.radiant -getinfo"
	

# radiant electrumx server
eup:
	docker-compose -f docker-compose-electrumx.yml up
estop:
	docker-compose -f docker-compose-electrumx.yml stop
ebuild:
	docker-compose -f docker-compose-electrumx.yml up --build
erm:
	docker-compose -f docker-compose-electrumx.yml rm -f

ebash:
	docker exec -it radiant-electrumx bash

# nginx web server
nup:
	docker-compose -f docker-compose-dual.yml up 
nstop:
	docker-compose -f docker-compose-dual.yml up stop
nbuild:
	docker-compose -f docker-compose-dual.yml up --build
nrm:
	docker-compose -f docker-compose-dual.yml rm -f

#****************************************************/
# GIT SECTION
# sample:
# make git b=master m="[]:"
git:
        git add .
        git commit -m "[$t]: $m"
        git push -u github $b
