JEKYLL=/var/lib/gems/1.8/bin/jekyll
REMOTE=tui.home.giles.net.nz
DIR=blog

all: 
	${JEKYLL} 

clean:
	rm -r _site/*

server: all
	${JEKYLL} --server

deploy: all
	ssh ${REMOTE} rm -rf ${DIR}/
	ssh ${REMOTE} mkdir -p ${DIR}
	scp -r _site/* ${REMOTE}:${DIR}/
