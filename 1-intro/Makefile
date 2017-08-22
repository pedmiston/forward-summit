all: slides.pdf notes.pdf

# Create slides.pdf from intro.md
slides.pdf: intro.md
	pandoc -t beamer -V theme=metropolis -o $@ $<

# intro.md references img/pandoc-formats.png
intro.md: img/pandoc-formats.png img/data-science-workflow.png img/pandoc-scholar.png

# Create img/pandoc-formats.png by running pandoc-formats.R
img/pandoc-formats.png: pandoc-formats.R
	./pandoc-formats.R

img/data-science-workflow.png:
	curl -o $@ http://r4ds.had.co.nz/diagrams/data-science.png

img/pandoc-scholar.png:
	curl -o $@ https://pandoc-scholar.github.io/Fig3.png

# Create talk.md by changing HTML comments to paragraphs
notes.md: intro.md
	sed -e 's/<!--/* * */g' -e 's/-->//g' intro.md > $@

# Create printable notes.pdf from talk.md
notes.pdf: notes.md
	pandoc -f markdown -o $@ $<
