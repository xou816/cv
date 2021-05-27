all: install build

build-fr: cv_fr.template.tex
	sed 's/%\([A-Z][A-Z]*%\)/$$INPUT_\1/g' cv_fr.template.tex | envsubst '$${INPUT_EMAIL} $${INPUT_PHONE}' > cv_fr.tex
	latexmk cv_fr.tex

build-en: cv_en.template.tex
	sed 's/%\([A-Z][A-Z]*%\)/$$INPUT_\1/g' cv_en.template.tex | envsubst '$${INPUT_EMAIL} $${INPUT_PHONE}' > cv_en.tex
	latexmk cv_en.tex

build: build-fr build-en
	latexmk -c

watch-fr: cv_fr.template.tex
	latexmk -pvc cv_fr.template.tex

watch-en: cv_en.template.tex
	latexmk -pvc cv_en.template.tex

install:
	tlmgr update --self
	tlmgr install lm xcolor xcolor-solarized pagecolor fontawesome xifthen ifmtarg pgf pgf-blur ec babel-french tcolorbox comment environ trimspaces etoolbox everyshi enumitem titlesec fancyhdr

clean: 
	latexmk -C