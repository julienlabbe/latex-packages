##################################################
# Makefile for the latex altsubsup package
##################################################

name=altsubsup
engine=pdflatex

.PHONY: sty doc test clean all

all: sty doc test clean

sty: $(name).sty
doc: $(name).pdf
test: $(name)-test.pdf

$(name).sty: $(name).ins $(name).dtx
	$(engine) $(name).ins

$(name).pdf: $(name).dtx
	$(engine) $(name).dtx
	makeindex -s gglo.ist -o $(name).gls $(name).glo
	makeindex -s gind.ist -o $(name).ind $(name).idx
	$(engine) $(name).dtx

$(name)-test.pdf: $(name)-test.tex
	$(engine) $<

clean:
	rm -f *.aux *.glo *.idx *.log *.toc *.gls *.ilg *.ind *.out
