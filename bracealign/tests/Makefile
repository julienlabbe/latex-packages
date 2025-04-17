##################################################
# Tests of the latex bracealign package
##################################################

name=bracealign

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

unicode-math-luatex.pdf: 		engine=lualatex
unicode-math-luatex.pdf+: 		engine=lualatex
unicode-math-xelatex.pdf+: 	engine=xelatex
unicode-math-xelatex.pdf: 		engine=xelatex
libertinust1math.pdf+: 		engine=pdflatex
libertinust1math.pdf: 			engine=pdflatex
stix2-type1.pdf:				engine=pdflatex
stix2-type1.pdf+:				engine=pdflatex

%.pdf: %.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $<

.PHONY: %.pdf+

%.pdf+: %.tex $(dep)
	$(envconfig) $(cmd) $(rcoptions) $(runoptions) $(pvcoptions) $< < /dev/null | texlogfilter --full-log

clean:
	$(envconfig) $(cmd) $(rcoptions) -c

cleanall:clean
	rm *.pdf

$(stydir)/$(name).sty:$(stydir)/$(name).dtx $(stydir)/$(name).ins
	$(MAKE) -C $(stydir) sty
