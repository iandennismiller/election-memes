# election-memes
# 2016 Ian Dennis Miller

analysis:
	cd analysis && Rscript -e "library(bookdown); bookdown::render_book('election-memes.Rmd', 'bookdown::gitbook')"
	cp _assets/index.html docs
	# convert -resize '600' docs/_files/figure-html/trends-1.png docs/trends-thumb.png

pdf:
	cd analysis && Rscript -e "library(bookdown); bookdown::render_book('election-memes.Rmd', 'bookdown::pdf_book')"

open:
	open docs/index.html

clean:
	rm -rf docs && mkdir docs
	rm -f analysis/*.md
	rm -f analysis/*.pdf
	rm -f analysis/*.html
	rm -rf analysis/*_files/
	rm -rf analysis/_bookdown_files/
	rm -rf analysis/_book/

release: clean analysis pdf
	git commit -am "release"
	git push

.PHONY: analysis release open clean
