#!/usr/bin/make -f
#
# This program converts tab-indented text files into an XML format suitable for
# reading by Freemind.
#
# Copyright  2006--2007  Wouter Bolsterlee <uws@xs4all.nl>
#
# This program is distributed under the GPL v2 (or later) license.
#


#
# Programs
#

CHMOD = chmod
TEXT_TO_FREEMIND = text-to-freemind


#
# Files
#

INPUT_TEXT = $(wildcard *.mm.txt)
OUTPUT_MM =  $(INPUT_TEXT:%.mm.txt=%.mm)


#
# Targets
#

.PHONY: all mm clean-mm

# implicit conversion rule
%.mm: %.mm.txt
	$(TEXT_TO_FREEMIND) $< |xmllint --format - > $@
	@-$(CHMOD) --reference=$< $@ 2>/dev/null

# default target
all: mm

# convert text to freemind
mm: $(OUTPUT_MM)

# clean freemind files
clean-mm: $(INPUT_TEXT)
	$(RM) $(OUTPUT_MM)
