\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}

% Class+geometry
\LoadClass[a4paper,11pt]{article}
\RequirePackage[top=1cm, left=1.8cm, right=1.8cm]{geometry}

% Font
\RequirePackage{lmodern}
\renewcommand{\familydefault}{\sfdefault}

% Dependencies
\RequirePackage[prefix=sol]{xcolor-solarized}
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{pagecolor}
\RequirePackage{fontawesome}
\RequirePackage{xifthen}

% Tikz
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{shadows.blur}

% Colors
\definecolor{bg}{HTML}{fafafa}
\definecolor{gray}{gray}{0.6}
\definecolor{lightgray}{gray}{0.9}

% Logos
\newcommand\roundedpic[2]{
	\begin{tikzpicture}
	\clip[rounded corners=4,draw=none] 
	(0, 0) rectangle (#2, #2)
	node[midway] {
		\includegraphics[height=#2]{#1}
	};
	\end{tikzpicture}
}

\newcommand\evtech{\raisebox{-.3\baselineskip}{\includegraphics[height=\baselineskip]{resources/evtech.pdf}}}
\newcommand\ouisncf{\includegraphics[height=0.9\baselineskip]{resources/ouisncf.pdf}}
\newcommand\adfab{\raisebox{-.3\baselineskip}{\includegraphics[height=0.9\baselineskip]{resources/adfabn.pdf}}}
\newcommand\ecn{\raisebox{-.3\baselineskip}{\includegraphics[height=1.2\baselineskip]{resources/ecn.pdf}}}

% Links
\newcommand\link[1]{\underline{\smash{#1}}}

% Tags
\newcommand\thetagcolor{solred}
\newcommand\tagcollection[1]{\renewcommand{\thetagcolor}{#1}}
\newcommand\theicon{star-full}
\newcommand\tag[2]{%
\renewcommand\theicon{\ifthenelse{\equal{#2}{1}}{\faicon{star}}{\faicon{star-half-o}}}%
\raisebox{-.3\baselineskip}{%
	\noindent\begin{tikzpicture}%
	\node[fill=\thetagcolor, text height=1.5ex, minimum height=1.5ex, text=white, rounded corners] at (0, 0) {\footnotesize #1 \theicon};
	\end{tikzpicture}
}}
\newcommand\colsec[1]{\section*{\color{solred} #1}}

% Boxes
\RequirePackage{tcolorbox}

\newcommand{\commonbox}{
	enhanced,
	interior hidden,
	before skip=0mm,
	after skip=3mm,
	attach boxed title to top center={
		%xshift=-2mm,
		yshift=-2mm,
	},
	boxed title style={
		skin=standard,
		size=small,
		colback=lightgray,
		colframe=lightgray
	},
	fonttitle=\footnotesize\color{gray}
}

\tcbuselibrary{skins}
\newtcolorbox{expbox}[1][]
{
	code={\pgfkeysalsofrom{\commonbox}},
	frame style={
		draw=none,
		fill=white,
		blur shadow={
			shadow xshift=0, 
			shadow yshift=0, 
			shadow blur radius=4pt, 
			shadow opacity=5
		}
	},
	extrude left by=-2mm,
	extrude right by=-2mm,
	#1,
}

\newtcolorbox{mainexpbox}[1][]
{
	code={\pgfkeysalsofrom{\commonbox}},
	frame style={
		draw=none,
		fill=white,
		blur shadow={
			shadow xshift=0, 
			shadow yshift=0, 
			shadow blur radius=6pt, 
			shadow opacity=15
		}
	}, 
	#1,
}