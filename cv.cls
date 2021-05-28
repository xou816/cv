\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}

% Class+geometry
\LoadClass[a4paper,11pt]{article}
\RequirePackage[top=20mm, left=20mm, right=20mm, bottom=20mm]{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}

% Font
\RequirePackage{lmodern}
\renewcommand{\familydefault}{\sfdefault}

% Lists
\RequirePackage{enumitem}
\setlist[itemize]{label=--,left=0.5em,noitemsep,topsep=1ex,parsep=1pt,partopsep=1pt}
\setlist[description]{left=0.5em,noitemsep,topsep=1ex,parsep=1pt,partopsep=1pt}

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
\definecolor{bg2}{HTML}{f0f0f0}
\definecolor{gray}{gray}{0.6}
\definecolor{lightgray}{gray}{0.9}

% Logos
\newcommand\roundedpic[2]{%
	\strut\vspace*{-1.25\baselineskip}\newline%
	\begin{tikzpicture}%
	\clip[rounded corners=4, postaction={draw=gray}]
	(0, 0) rectangle (#2, #2)
	node[midway] {
		\includegraphics[height=#2]{#1}
	};
	\end{tikzpicture}%
}

\newcommand\evtech{\raisebox{-.3\baselineskip}{\includegraphics[height=0.9\baselineskip]{resources/evtech.pdf}}}
\newcommand\ouisncf{\includegraphics[height=0.9\baselineskip]{resources/ouisncf.pdf}}
\newcommand\adfab{\raisebox{-.2\baselineskip}{\includegraphics[height=0.8\baselineskip]{resources/adfabn.pdf}}}
\newcommand\ecn{\raisebox{-.3\baselineskip}{\includegraphics[height=1.2\baselineskip]{resources/ecn.pdf}}}

% Links
\newcommand\link[1]{\underline{\smash{#1}}}

% Tags
\newcommand\thetagcolor{solviolet}
\newcommand\tagcollection[1]{\renewcommand{\thetagcolor}{#1}}

\newcounter{starcount}
\newcommand\starrate[1]{
	\makeatletter
	\setcounter{starcount}{0}
	\@whilenum\value{starcount}<5\do{%
		\ifthenelse{\value{starcount}<#1}
			{\faicon{star}}
			{\faicon{star-o}}%
		\stepcounter{starcount}\,%
	}
	\makeatother
}

\newcommand\otag[1]{%
\raisebox{-1ex}{%
	\noindent\begin{tikzpicture}%
	\node[fill=\thetagcolor, text height=1.5ex, minimum height=1.5ex, text=white, rounded corners] at (0, 0) {\vphantom{Ag}#1};
	\end{tikzpicture}%
}}


\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\titlespacing*{\section}{0pt}{2\baselineskip}{1ex}
\titleformat{\section}{\Large\bfseries\color{solred}}{}{0em}{}
\titlespacing*{\subsection}{0pt}{0pt}{1ex}
\titleformat{\subsection}{\bfseries}{}{0em}{}

\fancypagestyle{withheader}{%
	\lhead{} % affichage du fond de page
	\chead{\itshape\color{gray} CV Alexandre Trendel}
	\rhead{}
	\lfoot{}
	\cfoot{}
	\rfoot{}
}

% Boxes
\RequirePackage{tcolorbox}

\newlength{\logoboxwidth}
\setlength{\logoboxwidth}{16mm}

\newcommand\experience[6][default]{
	\ifthenelse{\equal{main}{#1}}
		{\def\boxkind{mainexpbox}}
		{\def\boxkind{expbox}}

	\begin{\boxkind}[title=#2]
		\begin{minipage}[c]{\logoboxwidth}%
		\roundedpic{#3}{12mm}
		\end{minipage}
		\begin{minipage}[c]{0.8\textwidth}
		\large\textbf{#4}\\#5
		\end{minipage}
		\medskip
		#6
	\end{\boxkind}
}

\newcommand{\commonbox}{
	enhanced,
	left=1em,
	right=1em,
	interior hidden,
	before skip=5mm,
	after skip=5mm,
	attach boxed title to top right={
		xshift=-4mm,
		yshift=-2mm,
	},
	boxed title style={
		skin=standard,
		size=small,
		colback=lightgray,
		colframe=lightgray
	},
	fonttitle=\small\color{gray}
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
			shadow opacity=12
		}
	}, 
	extrude left by=2mm,
	extrude right by=2mm,
	#1,
}