.PHONY all: clean build/qrsnake.png

clean:
	rm -rf build/

build:
	mkdir build

build/qrsnake.min.html: build qrsnake.html
	html-minifier qrsnake.html --minify-js true --minify-css true --remove-attribute-quotes --collapse-whitespace --preserve-line-breaks | tr -d '\n' > build/qrsnake.min.html

build/qrsnake.datauri.txt: escape.py build/qrsnake.min.html
	echo -n 'data:text/html,' > build/qrsnake.datauri.txt
	./escape.py < build/qrsnake.min.html >> build/qrsnake.datauri.txt

build/qrsnake.png: build/qrsnake.datauri.txt
	# try the highest error correction level we can fit
	for l in H M Q L; do echo "trying $$l"; qrencode -8 -l $$l -r build/qrsnake.datauri.txt -o build/qrsnake.png; [ "$$?" = 0 ] && echo 'done' && break; done
