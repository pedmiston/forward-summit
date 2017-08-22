all: slides.pdf talk.md

# Create slides.pdf from intro.md
slides.pdf: intro.md
	pandoc -t beamer -V theme=metropolis -o $@ $<

# intro.md references img/pandoc-formats.png
intro.md: img/pandoc-formats.png img/data-science-workflow.png

# Create img/pandoc-formats.png by running pandoc-formats.R
img/pandoc-formats.png: pandoc-formats.R
	./pandoc-formats.R

img/data-science-workflow.png:
	curl -o img/data-science-workflow.png http://r4ds.had.co.nz/diagrams/data-science.png

# Create printable notes.pdf from talk.md
notes.pdf: talk.md
	pandoc -f markdown -o $@ $<

# Create talk.md by changing HTML comments to paragraphs
talk.md: intro.md
	sed -e 's/<!--/* * */g' -e 's/-->//g' intro.md > $@
