JEKYLL=/var/lib/gems/1.8/bin/jekyll

all: 
	${JEKYLL} 

clean:
	rm -r _site/*

server: all
	${JEKYLL} --server
