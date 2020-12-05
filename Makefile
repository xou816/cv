all: install build

build-fr: cv_fr.template.tex
	envsubst '$${INFO_EMAIL} $${INFO_PHONE}' < cv_fr.template.tex > cv_fr.tex
	latexmk cv_fr.tex

build-en: cv_en.template.tex
	envsubst '$${INFO_EMAIL} $${INFO_PHONE}' < cv_en.template.tex > cv_en.tex
	latexmk cv_en.tex

build: build-en build-fr
	latexmk -c

watch-fr: cv_fr.template.tex
	latexmk -pvc cv_fr.template.tex

watch-en: cv_en.template.tex
	latexmk -pvc cv_en.template.tex

install:
	tlmgr update --self
	tlmgr install lm xcolor xcolor-solarized pagecolor fontawesome xifthen ifmtarg pgf pgf-blur ec babel-french tcolorbox comment environ trimspaces etoolbox everyshi

clean: 
	latexmk -C