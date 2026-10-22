CVNAME?=CV_2026-10
LATEX=xelatex

all: $(CVNAME).pdf

force: clean all

clean:
	rm -f $(CVNAME).pdf $(CVNAME).log $(CVNAME).out $(CVNAME).aux

$(CVNAME).pdf: $(CVNAME).tex
	@$(LATEX) $<
	#run it twice, to fix page numbers
	@$(LATEX) $<
