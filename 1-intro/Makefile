slides.pdf: intro.md img/pandoc-formats.png
	pandoc -t beamer -V theme=metropolis -o $@ $<
img/pandoc-formats.png: pandoc-formats.R
	./pandoc-formats.R
