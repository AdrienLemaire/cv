CVNAME?=CV_2026-10
LATEX=xelatex

all: $(CVNAME).pdf

force: clean all

# What ATS parsers read: content-stream order (poppler raw, pypdf) and
# geometric order (pdfminer).
ats: $(CVNAME).pdf
	@printf "\n===== pdftotext -raw\n"; pdftotext -raw $< -
	@printf "\n===== pypdf\n"; python3 -c 'import sys, pypdf; [print(p.extract_text()) for p in pypdf.PdfReader(sys.argv[1]).pages]' $<
	@printf "\n===== pdfminer\n"; python3 -c 'import sys; from pdfminer.high_level import extract_text; print(extract_text(sys.argv[1]))' $<

clean:
	rm -f $(CVNAME).pdf $(CVNAME).log $(CVNAME).out $(CVNAME).aux

$(CVNAME).pdf: $(CVNAME).tex
	@$(LATEX) $<
	#run it twice, to fix page numbers
	@$(LATEX) $<
