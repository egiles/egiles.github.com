.PHONEY: build test clean server deploy

JEKYLL=/usr/bin/jekyll
REMOTE=tui.giles.net.nz
REMOTEDIR=blog

build: test
	${JEKYLL} build --config _config.yml,_config_local.yml

test: clean
	${JEKYLL} doctor --config _config.yml,_config_local.yml

clean:
	rm -rf _site/*

server: build
	${JEKYLL} --server

deploy: build
	ssh ${REMOTE} mkdir -p ${REMOTEDIR}
	rsync -ra --delete _site/* ${REMOTE}:${REMOTEDIR}/
