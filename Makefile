# election-memes
# 2016 Ian Dennis Miller

analysis:
	cd analysis && Rscript -e "library(bookdown); bookdown::render_book('election-memes.Rmd', 'bookdown::tufte_html2')"
	# cd analysis && Rscript -e "library(bookdown); bookdown::render_book('election-memes.Rmd', 'bookdown::gitbook')"
	cp analysis/election_memes.html docs/index.html

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

release: clean pdf analysis
	git commit -am "release"
	git push

.PHONY: analysis release open clean
