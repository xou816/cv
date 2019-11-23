\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}

% Class+geometry
\LoadClass[11pt]{article}
\RequirePackage[top=1cm, left=1.8cm, right=1.8cm]{geometry}

% Font
\RequirePackage{lmodern}
\renewcommand{\familydefault}{\sfdefault}

% Dependencies
\RequirePackage[prefix=sol]{xcolor-solarized}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{pagecolor}
\RequirePackage{fontawesome}
\RequirePackage{xifthen}

% Tikz
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{shadows.blur}

% Git like tree
\newcommand\event[2]{\node[event] (#1) {}; \node[evtext] at (#1) {#2};}
\newcommand\eventalt[2]{\node[event, fill=solbase1] (#1) {}; \node[evtext] at (#1) {#2};}
\newcommand\evdate[1]{\node[evdate] {\footnotesize #1};}
\newcommand\ghost[1]{\coordinate (#1);}
\newcommand\connect[2]{\path[connector] (#1) to[out=90,in=-90] (#2);}

% Colors
\definecolor{bg}{HTML}{fafafa}
\definecolor{gray}{gray}{0.6}
\definecolor{lightgray}{gray}{0.9}

% Logos
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