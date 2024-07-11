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

all: $(filter-out engine.pdf,$(src:.tex=.pdf)) engine

%.pdf: %.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<

.PHONY: engine, engine.pdf, engine-luatex, engine-xetex, engine-pdflatex
engine: engine-luatex engine-xetex engine-pdflatex
engine-luatex: engine=lualatex
engine-luatex:  engine.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<
	mv engine.log engine-luatex.log
	mv engine.pdf engine-luatex.pdf
engine-xetex: engine=xelatex
engine-xetex: engine.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<
	mv engine.log engine-xetex.log
	mv engine.pdf engine-xetex.pdf
engine-pdflatex: engine=pdflatex
engine-pdflatex: engine.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<
	mv engine.log engine-loglatex.log
	mv engine.pdf engine-pdflatex.pdf

.PHONY: engine-luatex+, engine-xetex+, engine-pdflatex+
engine-luatex+: engine=lualatex
engine-luatex+: engine.pdf+
engine-xetex+: engine=xelatex
engine-xetex+: engine.pdf+
engine-pdflatex+: engine=pdflatex
engine-pdflatex+: engine.pdf+

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
