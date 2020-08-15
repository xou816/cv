all: install build

build: cv_en.tex cv_fr.tex
	latexmk
	latexmk -c

watchfr: cv_fr.tex
	latexmk -pvc cv_fr.tex

watchen: cv_en.tex
	latexmk -pvc cv_en.tex

install:
	tlmgr update --self
	tlmgr install lm xcolor xcolor-solarized pagecolor fontawesome xifthen ifmtarg pgf pgf-blur ec babel-french tcolorbox comment environ trimspaces etoolbox

clean: 
	latexmk -C