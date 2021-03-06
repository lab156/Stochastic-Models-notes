TEX = pdflatex -shell-escape
LatexFile = stochatic_time_series_notes
#FIND ALL FILES IN SUBDIRECTORIES WITH NUMERIC NAMES
DEPS = $(shell find . -regex "\./[0-9]+/class.tex") general.sty

#.PHONY : all 
	
all: $(LatexFile).pdf 

$(LatexFile).pdf: $(LatexFile).tex $(DEPS)
	while ($(TEX) $(LatexFile).tex ; \
	grep -q "Rerun to get cross" $(LatexFile).log ) do true; \
	done

$(LatexFile).tex:
	if [ ! -f $(LatexFile).tex ] ; then \
		cp templates/simple_layout.tex $(LatexFile).tex ; \
		fi;
