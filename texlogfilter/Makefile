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
	$(call check_version,$<)
	perldoc $(name) > $@

$(name).html: $(name)
	$(call check_version,$<)
	pod2html --noindex $(name) --outfile $@
	rm -f pod2htmd.tmp

$(name).pdf: $(name)
	$(call check_version,$<)
	pod2pdf $(name) --output-file $@

define check_version
	@if [ \
		$$(grep -o -E 'my \$$version = ".*"'  $(1) | sed 's/.*"\(.*\)"/\1/') \
		!= $$(grep "=head2 VERSION" $(1) -A2 | tail -n 1) \
	]; then \
		echo "\033[1;31mERROR: version inconsistency between script and documentation.\033[0m"; \
		exit 1 ;\
	fi;
endef
