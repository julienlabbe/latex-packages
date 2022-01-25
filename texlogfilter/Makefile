##################################################
# Makefile for the perl texlogfilter script
# Generate documentation
##################################################

name=texlogfilter

.PHONY: default html pdf

default: README html
all: README html pdf

html: 	$(name).html
pdf: 	$(name).pdf

README: $(name)
	perldoc $(name) > $@

$(name).html: $(name)
	pod2html --noindex $(name) --outfile $@
	rm -f pod2htmd.tmp

$(name).pdf: $(name)
	pod2pdf $(name) --output-file $@
