##################################################
# Tests of the latex overarrows package
##################################################

name=overarrows

stydir=..
dep=$(stydir)/$(name).sty
src=$(filter-out $(dep),$(wildcard *.tex))

cmd=latexmk
engine=lualatex
rcoptions=-norc -r $(shell git rev-parse --show-toplevel)/.latexmkrc
runoptions=-$(engine) -time -gg
pvcoptions=-pvc

texmfcnf=error_line=79 half_error_line=50 max_print_line=79
envconfig=TEXINPUTS=$(stydir):${TEXINPUTS} $(texmfcnf)

.PHONY: clean all

all: $(filter unicode-math.pdf,$(src:.tex=.pdf)) unicode-math

%.pdf: %.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<

.PHONY: unicode-math, unicode-math-luatex, unicode-math-xetex
unicode-math: unicode-math-luatex unicode-math-xetex
unicode-math-luatex: engine=lualatex
unicode-math-luatex: unicode-math.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<
	mv unicode-math.pdf unicode-math-luatex.pdf
unicode-math-xetex: engine=xelatex
unicode-math-xetex: unicode-math.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<
	mv unicode-math.pdf unicode-math-xetex.pdf

.PHONY: %.pdf+

%.pdf+: %.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $(pvcoptions) $<

.PHONY: speed
speed: speed-test.tex
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<

clean:
	$(envconfig) $(cmd) $(rcoptions) -c

cleanall:clean
	rm *.pdf

$(stydir)/$(name).sty:$(stydir)/$(name).dtx $(stydir)/$(name).ins
	$(MAKE) -C $(stydir) sty
