JEKYLL=/var/lib/gems/1.8/bin/jekyll
REMOTE=tui.home.giles.net.nz

all: 
	${JEKYLL} 

clean:
	rm -r _site/*

server: all
	${JEKYLL} --server

deploy: all
	ssh ${REMOTE} rm -rf blog/
	ssh ${REMOTE} mkdir -p blog
	scp -r _site/* ${REMOTE}:blog/
