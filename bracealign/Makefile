##################################################
# Makefile for the latex bracealign package
##################################################

name=bracealign

cmd=latexmk
engine=lualatex
rcoptions=-norc -r $(shell git rev-parse --show-toplevel)/.latexmkrc
runoptions=-$(engine) -gg
pvcoptions=-pvc

.PHONY: sty doc clean all

all: sty doc clean

sty: $(name).sty
doc: $(name).pdf

$(name).sty $(name)-doc.sty&: $(name).ins $(name).dtx
	$(engine) $(name).ins

$(name).pdf: $(name).dtx $(name)-doc.sty
	$(cmd) $(rcoptions) $(runoptions) $(name).dtx


.PHONY: doc+ $(name).pdf+
doc+: $(name).pdf+
$(name).pdf+: $(name).dtx $(name)-doc.sty
	$(cmd) $(rcoptions) $(runoptions) $(pvcoptions) $(name).dtx < /dev/null | texlogfilter

.PHONY: doc++ $(name).pdf++
doc++: $(name).pdf++
$(name).pdf++: $(name).dtx $(name)-doc.sty
	$(cmd) $(rcoptions) $(runoptions) $(pvcoptions) $(name).dtx < /dev/null | texlogfilter --full-log

clean:
	$(cmd) $(rcoptions) -c $(name).dtx

cleanall:clean
	rm -f $(name).sty $(name)-doc.sty $(name).pdf
