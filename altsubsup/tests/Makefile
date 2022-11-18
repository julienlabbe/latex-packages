##################################################
# Tests of the latex altsubsup package
##################################################

name=altsubsup
engine=pdflatex
src=$(wildcard test-*.tex)
stydir=..

.PHONY: clean all

all: $(src:.tex=.pdf)

%.pdf: %.tex
	TEXINPUTS=$(stydir):${TEXINPUTS} $(engine) $<

clean:
	rm -f *.aux *.glo *.idx *.log *.toc *.gls *.ilg *.ind *.out
