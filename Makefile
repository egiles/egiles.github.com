JEKYLL=/usr/bin/jekyll
REMOTE=pi.giles.net.nz
DIR=blog

all:
	${JEKYLL} build

clean:
	rm -r _site/*

server: all
	${JEKYLL} --server

deploy: all
	ssh ${REMOTE} rm -rf ${DIR}/
	ssh ${REMOTE} mkdir -p ${DIR}
	scp -r _site/* ${REMOTE}:${DIR}/
