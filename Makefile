JEKYLL=/var/lib/gems/1.8/bin/jekyll

all: 
	${JEKYLL} 

clean:
	rm -r _site/*

server: all
	${JEKYLL} --server

deploy: all
	scp -r _site/* tui.home.giles.net.nz:public_html/
