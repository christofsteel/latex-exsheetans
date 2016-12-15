\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exsheetans}[2015/04/14 Exercise sheet answer]
\LoadClass[11pt,oneside,a4paper]{scrartcl}

\newif\ifexsheetans@ngerman

\DeclareOption{ngerman}{
	\exsheetans@ngermantrue
}

\ProcessOptions\relax

\ifexsheetans@ngerman
	\RequirePackage[ngerman]{babel}
\fi
% font encoding
\RequirePackage[T1]{fontenc}
\RequirePackage{titling}
\RequirePackage[utf8]{inputenc}
\RequirePackage[headsepline, footsepline]{scrpage2}
\raggedbottom
\RequirePackage{geometry}
\RequirePackage[table]{xcolor}
\RequirePackage{lmodern}
\RequirePackage{enumitem}
\RequirePackage{pgffor}
\RequirePackage{stmaryrd}
\RequirePackage{everypage}
\RequirePackage{nccmath}
\RequirePackage{tikz}
\RequirePackage{moreenum}
\RequirePackage{pifont}
\newcommand{\cmark}{\ding{51}}
\newcommand{\xmark}{\ding{55}}
\usetikzlibrary{positioning}

% AMS packages
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{scrextend}
\RequirePackage[bold]{complexity}

% page formatting
\geometry{a4paper, top=30mm, left=20mm, right=10mm, bottom=30mm, headsep=10mm, footskip=10mm}
\KOMAoption{parskip}{half-}
\pagestyle{scrheadings}

% language selection

\newcommand\blocktext{%
\ifdefined\block%
Block \block%Q
\else\fi}

% page header and footer
\clearscrheadfoot
\ihead{\textsc{\stringsheet{} \arabic{sheet}}\\\textsc{\thegroup}}
\chead{\textsc{\thecourse\\\theauthor}}
\ohead{\textsc{\stringpage{} \pagemark}\\\textsc{\stringtotal{}:} $\underline{\qquad}\,$\textbf{/\arabic{totalscore} \stringpoints}}
\ifoot{\textsc{\blocktext}}
\cfoot{\textsc{\thesemester}}
\ofoot{\textsc{}}
\KOMAoption{cleardoublepage}{scrheadings}


% Counter der den Namen des Blatt festlegt
\newcounter{sheet}
\newcounter{totalscore}
\newcounter{canswer}[sheet]
\newcounter{csubanswer}[canswer]

\newenvironment{quiz}[1][]{\begin{addmargin}[0.5cm]{0.5cm}\noindent\textbf{\stringquizanswer{} #1}\begin{enumerate}[label=\textbf{\arabic*.}]}{\end{enumerate}\vspace{5mm}\end{addmargin}}
\newenvironment{answer}[2][]{\stepcounter{canswer}\begin{addmargin}[0.5cm]{0.5cm}\noindent\textbf{\stringanswer{} \arabic{sheet}.\arabic{canswer} \ifx&#2&%
	\else{[#2]}\fi}\hfill $\underline{\quad}\,$\textbf{/#1 \stringpoints}\\}{\end{addmargin}\vspace{5mm}

}
\newenvironment{answer*}[2][]{\begin{addmargin}[0.5cm]{0.5cm}\noindent\textbf{\stringanswer{} [#2]}\hfill $\underline{\quad}\,$\textbf{/#1 \stringpoints}\\}{\end{addmargin}}
\newenvironment{supplement}[2][]{\begin{addmargin}[0.5cm]{0.5cm}\noindent\textbf{\stringsupplementanswer{} [#2]}\hfill $\underline{\quad}\,$\textbf{/#1 \stringpoints}\\}{\end{addmargin}}
\newenvironment{subanswer}{~\\ \indent\hspace{2em}\stepcounter{csubanswer}\begin{list}{\textbf{\alph{csubanswer})}}{}\item}{\end{list}}

\newcommand\stringsheet{Sheet}
\newcommand\stringpage{Page}
\newcommand\stringquizanswer{Quiz questions}
\newcommand\stringanswer{Answer}
\newcommand\stringpoints{Points}
\newcommand\stringtotal{Total}
\newcommand\stringsupplementanswer{Supplement answer}
\newcommand\thegroup{}
\newcommand\thecourse{}
\newcommand\thesemester{}
\newcommand\theauthor{}
\newcommand\group[1]{\renewcommand\thegroup{#1}}
\newcommand\course[1]{\renewcommand\thecourse{#1}}
\newcommand\semester[1]{\renewcommand\thesemester{#1}}
\newcommand\sheet[1]{\setcounter{sheet}{#1}}
\newcommand\totalscore[1]{\setcounter{totalscore}{#1}}

\newcommand\setstringsheet[1]{\renewcommand\stringsheet{#1}}
\newcommand\setstringtotal[1]{\renewcommand\stringtotal{#1}}
\newcommand\setstringpage[1]{\renewcommand\stringpage{#1}}
\newcommand\setstringquizanswer[1]{\renewcommand\stringquizanswer{#1}}
\newcommand\setstringanswer[1]{\renewcommand\stringanswer{#1}}
\newcommand\setstringpoints[1]{\renewcommand\stringpoints{#1}}
\newcommand\setstringsupplementanswer[1]{\renewcommand\stringsupplementanswer{#1}}

\AtBeginDocument{
  \@ifpackagewith{babel}{ngerman}{%
	\usepackage{exsheetans-ngerman}
  }{}
}

\AddEverypageHook{
  \ifnum\value{page}=1\relax
  \else
  \ohead{\textsc{\stringpage{} \pagemark}\\}
  \fi
}
