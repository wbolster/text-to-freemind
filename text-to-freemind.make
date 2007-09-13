#!/usr/bin/make -s
#
# Tranform tab indented text documents into Freemind XML
#
# Copyright (C) 2006  Wouter Bolsterlee <uws@xs4all.nl>
#

CHMOD = chmod
TXTMM = txt2mm

TXT     = $(wildcard *.txt)
MM      = $(TXT:%.txt=%.mm)

.PHONY: mm clean-mm

%.mm: %.txt
	$(TXTMM) $< |xmllint --format - > $@
	@$(CHMOD) --reference=$< $@

mm: $(MM)

clean-mm: $(TXT)
	$(RM) $(MM)
