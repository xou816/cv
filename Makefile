all: install build

build: cv_en.tex cv_fr.tex
	latexmk
	latexmk -c

watch: cv_en.tex cv_fr.tex
	latexmk -pvc

install:
	tlmgr update --self
	tlmgr install lm xcolor xcolor-solarized pagecolor fontawesome xifthen ifmtarg pgf pgf-blur ec babel-french

clean: 
	latexmk -C