# Makefile
# generated on 2014-04-05 16:27:27 -0700
# by Matthew Kirk
# With the Condom lib (version 2.0.1)
# See http://github.com/v0n/condom

FINAL_FILENAME=cv
FILENAME=main
VIEWER=open
RUBBER=$(shell which rubber)

all: $(FILENAME).tex
ifeq ($(RUBBER),)
	@pdflatex $(FILENAME).tex
	@pdflatex $(FILENAME).tex
	@echo -e "\nYou should install the rubber package ;)"
else
	@$(RUBBER) -d $(FILENAME).tex
endif
ifneq ($(FILENAME),$(FINAL_FILENAME))
	@mv $(FILENAME).pdf $(FINAL_FILENAME).pdf
endif

view: all
	@$(VIEWER) $(FINAL_FILENAME).pdf

clean:
	@echo "cleaning..."
	@rm -f *.aux *.log *.out *.toc *.lol
	@rm -f inc/*.aux
	@rm -f $(FINAL_FILENAME).tar

archive: all clean
	@tar -cf $(FINAL_FILENAME).tar *
	@echo "archived in $(FINAL_FILENAME).tar"
