##################################################
# Build packages archive for CTAN
##################################################

.PHONY: altsubsup overarrows bracealign texlogfilter
altsubsup:		altsubsup.tar.gz
overarrows:		overarrows.tar.gz
bracealign:		bracealign.tar.gz
texlogfilter: 	texlogfilter.tar.gz

altsubsup.tar.gz: altsubsup/altsubsup.dtx altsubsup/altsubsup.pdf altsubsup/altsubsup.el altsubsup/altsubsup.ins altsubsup/LICENSE altsubsup/README.md
	tar cvzf $@ $^

overarrows.tar.gz: overarrows/overarrows.dtx overarrows/overarrows.pdf overarrows/overarrows.ins overarrows/LICENSE overarrows/README.md
	tar cvzf $@ $^

bracealign.tar.gz: bracealign/bracealign.dtx bracealign/bracealign.pdf bracealign/bracealign.ins bracealign/LICENSE bracealign/README.md
	tar cvzf $@ $^

texlogfilter.tar.gz: texlogfilter/texlogfilter texlogfilter/texlogfilter.html texlogfilter/LICENSE texlogfilter/README
	tar cvzf $@ $^
