#!/usr/bin/make -f
#
# A simple text to freemind conversion program
#
# See README for copyright and licensing information.
#


#
# Programs
#

CHMOD = chmod
TEXT_TO_FREEMIND = text-to-freemind
FREEMIND = freemind


#
# Files
#

INPUT_TEXT = $(wildcard *.mm.txt)
OUTPUT_MM =  $(INPUT_TEXT:%.mm.txt=%.mm)


#
# Targets
#

.PHONY: all mm clean-mm test

# implicit conversion rule
%.mm: %.mm.txt
	$(TEXT_TO_FREEMIND) $< > $@
	@-$(CHMOD) --reference=$< $@ 2>/dev/null

# default target
all: mm

# convert text to freemind
mm: $(OUTPUT_MM)

# clean freemind files
clean-mm: $(INPUT_TEXT)
	$(RM) $(OUTPUT_MM)

# preview files in Freemind
test: $(OUTPUT_MM)
	$(FREEMIND) $(OUTPUT_MM) > /dev/null 2>&1 &
