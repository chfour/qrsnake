# qrsnake

this is a version of the classic snake game, written in HTML and JS, made to fit inside a QR code as a data URI.

it's not the best snake ever, but, well, it works I guess. and even the %-escaped datauri fits **well under 2kB**(!)

it's based on a version I wrote a long time ago, to which I've lost the unminified source code (kept here as `old_qrsnake.html`)

## requirements & building

you will need:

* [html-minifier](https://www.npmjs.com/package/html-minifier)
* qrencode
* make (duh)

you should be able to run `make` in the root and get `build/qrsnake.png`
