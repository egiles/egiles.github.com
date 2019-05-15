.PHONEY: build clean server deploy

JEKYLL=/usr/bin/jekyll
REMOTE=pi.giles.net.nz
DIR=blog

build:
	${JEKYLL} build

clean:
	rm -r _site/*

server: build
	${JEKYLL} --server

deploy: clean build
	ssh ${REMOTE} mkdir -p ${DIR}
	rsync -ra --delete _site/* ${REMOTE}:${DIR}/
