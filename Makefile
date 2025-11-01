HBURG ?= /usr/bin/hburg


	
make-all: 
	cd ./public/packages/; \
		for package in *.hb; do \
			$(HBURG) make $$package; \
		done

build:
	cd ./public/packages && $(HBURG) build 
	mv ./public/packages/index ./public/packages/index.b3 ./public/


clean: 
	cd ./public/packages && rm -f index *.clos *.b3 index.b3
	rm -f index index.b3
