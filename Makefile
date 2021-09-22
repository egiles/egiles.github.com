.PHONEY: build clean server deploy

JEKYLL=/usr/bin/jekyll
REMOTE=tui.giles.net.nz
REMOTEDIR=blog

build:
	${JEKYLL} build

clean:
	rm -rf _site/*

server: build
	${JEKYLL} --server

deploy: clean build
	ssh ${REMOTE} mkdir -p ${REMOTEDIR}
	rsync -ra --delete _site/* ${REMOTE}:${REMOTEDIR}/
