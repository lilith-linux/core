HBURG ?= /usr/bin/hburg


	
make-all: 
	cd ./packages/; \
		for package in *.hb; do \
			$(HBURG) make $$package; \
		done

build:
	cd ./packages && $(HBURG) build 
	mv ./packages/index.bin ./packages/index.bin.hash .


clean: 
	cd ./packages && rm -f *.bin *.hcl *.hash
	rm -f *.bin *.bin.hash
