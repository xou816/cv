all: install build

build: cv_en.tex
	latexmk
	latexmk -c

watch: cv_en.tex
	latexmk -pvc

install:
	tlmgr install lm xcolor xcolor-solarized pagecolor fontawesome xifthen ifmtarg pgf pgf-blur ec

clean: 
	latexmk -C