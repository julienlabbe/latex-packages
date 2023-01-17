##################################################
# Tests of the latex overarrows package
##################################################

name=overarrows

stydir=..
dep=$(stydir)/$(name).sty\
	$(wildcard texconfig.tex)
src=$(filter-out $(dep),$(wildcard *.tex))

cmd=latexmk
engine=lualatex
rcoptions=-norc -r $(shell git rev-parse --show-toplevel)/.latexmkrc
runoptions=-$(engine) -time -gg
pvcoptions=-pvc

texmfcnf=error_line=79 half_error_line=50 max_print_line=79
envconfig=TEXINPUTS=$(stydir):${TEXINPUTS} $(texmfcnf)

.PHONY: clean all

all: $(src:.tex=.pdf)

%.pdf: %.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<

.PHONY: %.pdf+

%.pdf+: %.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $(pvcoptions) $<

clean:
	$(envconfig) $(cmd) $(rcoptions) -c

cleanall:clean
	rm *.pdf

$(stydir)/$(name).sty:$(stydir)/$(name).dtx $(stydir)/$(name).ins
	$(MAKE) -C $(stydir) sty
