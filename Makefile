pandoc:
		pandoc -H margins.sty index.md -o index.pdf --highlight-style=tango;\
    open index.pdf
