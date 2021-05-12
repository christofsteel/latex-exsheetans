\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exsheetans}[2015/04/14 Exercise sheet answer]
\LoadClass[11pt,oneside,a4paper]{scrartcl}

\newif\ifexsheetans@ngerman
\DeclareOption{ngerman}{
	\exsheetans@ngermantrue
}
\ProcessOptions\relax

\RequirePackage[headsepline, footsepline]{scrlayer-scrpage}
\raggedbottom
\RequirePackage{geometry}
\RequirePackage{enumitem}

% page formatting
\geometry{a4paper, top=30mm, left=20mm, right=10mm, bottom=30mm, headsep=10mm, footskip=10mm, head=30pt}
\KOMAoption{parskip}{half-}
\pagestyle{scrheadings}

% page header and footer
\clearpairofpagestyles
\ihead{\textsc{\stringsheet{} \arabic{sheet}}\\\textsc{\thegroup}}
\chead{\textsc{\thecourse\\\thesemester}}
\ohead{\textsc{\stringpage{} \pagemark}\\%
\ifnum\value{totalscore}>0%
    \textsc{\stringtotal{}} $\underline{\qquad}\,$\textbf{/\arabic{totalscore} \stringpoints}%
\else
    \ifnum\value{totalscorecalc}>0%
    \textsc{\stringtotal{}} $\underline{\qquad}\,$\textbf{/\arabic{totalscorecalc} \stringpoints}%
    \fi
\fi
}
\cfoot{\textsc{\@author}}
\ofoot{\textsc{}}
\KOMAoption{cleardoublepage}{scrheadings}


% Counter der den Namen des Blatt festlegt
\newcounter{sheet}
\newcounter{totalscore}
\newcounter{totalscorecalc}
\newcounter{canswer}[sheet]
\newcounter{csubanswer}[canswer]

\newenvironment{quiz}[1][]{\begin{addmargin}[0.5cm]{0.5cm}\noindent\textbf{\stringquizanswer{} #1}\begin{enumerate}[label=\textbf{\arabic*.}]}{\end{enumerate}\vspace{5mm}\end{addmargin}}

\newenvironment{answer}[2][]{\stepcounter{canswer}\begin{addmargin}[0.5cm]{0.5cm}\noindent\textbf{\stringanswer{} \arabic{sheet}.\arabic{canswer} \ifx&#2&%
	\else{[#2]}\fi}\ifx&#1&%
    \else{\addtocounter{totalscorecalc}{#1}\hfill $\underline{\quad}\,$\textbf{/#1 \stringpoints}}\fi\\}{\end{addmargin}\vspace{5mm}

}
\newenvironment{supplement}[2][]{\begin{addmargin}[0.5cm]{0.5cm}\noindent\textbf{\stringsupplementanswer{} [#2]}%
\ifx&#1&%
\else{\addtocounter{totalscorecalc}{#1}\hfill $\underline{\quad}\,$\textbf{/#1 \stringpoints}}\fi\\}{\end{addmargin}}

\newenvironment{subanswers}[2][]{\stepcounter{canswer}\begin{addmargin}[0.5cm]{0.5cm}\noindent\textbf{\stringanswer{} \arabic{sheet}.\arabic{canswer} \ifx&#2&%
	\else{[#2]}\fi}\ifx&#1&%
    \else{\addtocounter{totalscorecalc}{#1}\hfill $\underline{\quad}\,$\textbf{/#1 \stringpoints}}\fi
\begin{enumerate}[label=\textbf{\alph*)}]}{\end{enumerate}\vspace{5mm}\end{addmargin}}


\newcommand\stringsheet{Sheet}
\newcommand\stringpage{Page}
\newcommand\stringquizanswer{Quiz answers}
\newcommand\stringanswer{Answer}
\newcommand\stringpoints{Points}
\newcommand\stringtotal{$\sum$}
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

\ifexsheetans@ngerman
\protect\RequirePackage{exsheetans-ngerman}
\fi
