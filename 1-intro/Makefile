all: slides.pdf talk.md

# Create slides.pdf from intro.md
slides.pdf: intro.md
	pandoc -t beamer -V theme=metropolis -o $@ $<

# intro.md references img/pandoc-formats.png
intro.md: img/pandoc-formats.png

# Create img/pandoc-formats.png by running pandoc-formats.R
img/pandoc-formats.png: pandoc-formats.R
	./pandoc-formats.R

# Create talk.md by changing HTML comments to paragraphs
talk.md: intro.md
	sed -e 's/<!--/---/g' -e 's/-->//g' intro.md > $@
