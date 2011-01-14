% MPLETTER.CLS as taken out of gtl-letters.tex 4th edition
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UBCletter}
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\ifpdf
    \usepackage[pdftex]{graphicx} 
    \usepackage{hyperref}
    \pdfcompresslevel=0
    \DeclareGraphicsExtensions{.pdf,.jpg,.mps,.png,.tif}
\else
    \usepackage{hyperref}
    \usepackage[dvips]{graphicx}
    \DeclareGraphicsRule{.eps.gz}{eps}{.eps.bb}{`gzip -d #1}
    \DeclareGraphicsExtensions{.ps,.eps,.eps.gz}
\fi
\usepackage{textcomp}
\newcommand{\euro}{\textsf{\texteuro}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[letterpaper]{letter}
\newcommand{\englishnames}{%
 \newcommand{\yrefname}{\textsl{Your Ref.}}
 \newcommand{\ymailname}{\textsl{Your letter from}}
 \newcommand{\myrefname}{\textsl{Our Ref.}}
 \newcommand{\subjectname}{\textsl{Subject}}
 \newcommand{\telephonename}{Telephone}
 \newcommand{\stationname}{Train Station}
 \newcommand{\telcode}{[49]-5556-401}
 \newcommand{\postcode}{D--37191}
}

\englishnames

\newcommand{\@yref}{}     \newcommand{\@ymail}{}
\newcommand{\@myref}{}    \newcommand{\@subject}{}
\newcommand{\@internet}{}

\newcommand{\yref}[1]{\renewcommand{\@yref}{\yrefname: #1}}
\newcommand{\ymail}[1]{\renewcommand{\@ymail}{\ymailname: #1}}
\newcommand{\myref}[1]{\renewcommand{\@myref}{\myrefname: #1}}
\newcommand{\subject}[1]{\renewcommand{\@subject}
                           {\subjectname: #1}}
\newcommand{\internet}[1]{\renewcommand{\@internet}{#1}}
\newcommand{\INTERNET}{@linmpi.mpg.de}
\setlength{\textheight}{8.5in}  \setlength{\textwidth}{6.5in}
\setlength{\oddsidemargin}{0pt} \setlength{\evensidemargin}{0pt}
\setlength{\topmargin}{-30pt}   \setlength{\headheight}{12pt}
\setlength{\headsep}{35pt}
\DeclareFixedFont{\xviisf}{OT1}{cmss}{m}{n}{17}
\DeclareFixedFont{\xsf}{OT1}{cmss}{m}{n}{10}
\DeclareFixedFont{\viiisf}{OT1}{cmss}{m}{n}{8}
\newlength{\leftfield}    \setlength{\leftfield}{112mm}
\newlength{\rightfield}   \setlength{\rightfield}{43mm}
\newsavebox{\FIRM}       \newsavebox{\firmaddress}
\newsavebox{\firm}       \newsavebox{\firmreturn}

\sbox{\FIRM}{%
  \begin{picture}(0,0)
    \put(-55,10){\includegraphics{EosLetter_head}}
    \put(2,-40){\includegraphics[width=0.6in]{ubclogo_873}}
%    \put(2,-40){\includegraphics[width=0.6in]{ubclogo_cmyk.eps}}
  \end{picture}
}

\sbox{\firm}
  {}

\sbox{\firmreturn}
  {}

\sbox{\firmaddress}
  {\parbox[t]{\rightfield}{%
    }}
\newsavebox{\firmhead}   \newsavebox{\firmfoot}

\sbox{\firmhead}
  {\parbox{\textwidth}{\usebox{\FIRM}\raisebox{6pt}
     {\usebox{\firmaddress}}\\ }}

\sbox{\firmfoot}{}

\renewcommand{\ps@firstpage}
  {\setlength{\headheight}{41pt}\setlength{\headsep}{25pt}%
   \setlength{\topmargin}{-30pt}%
   \renewcommand{\@oddhead}{\usebox{\firmhead}}%
   \renewcommand{\@oddfoot}{\raisebox{-30pt}[0pt]
                             {\usebox{\firmfoot}}}%
   \renewcommand{\@evenhead}{}\renewcommand{\@evenfoot}{}}
\renewcommand{\ps@headings}
   {\setlength{\headheight}{21pt}%
    \setlength{\topmargin}{-45pt}%
    \renewcommand{\@oddhead}
       {\parbox{\textwidth}{\usebox{\firm}\\
           \vspace{-40pt}\\
          \slshape \@subject\hfill\@date\hfill
                                     \pagename{} \thepage\\
          \rule[3pt]{\textwidth}{1pt}}}
    \renewcommand{\@oddfoot}{}
    \renewcommand{\@evenhead}{\@oddhead}
    \renewcommand{\@evenfoot}{\@oddfoot}}
\providecommand{\@evenhead}{}\providecommand{\@oddhead}{}
\providecommand{\@evenfoot}{}\providecommand{\@oddfoot}{}
\pagestyle{headings}
\renewcommand{\opening}[1]{\thispagestyle{firstpage}%
  \parbox[t]{\leftfield}
     {\usebox{\firmreturn}\\
      \vspace{5mm}\\
      \parbox[b][3.5cm][c]{\leftfield}{\toname\\\toaddress}}%
  \parbox[t]{\rightfield}
     {\vspace{5mm} \@date}
  \par
  \makebox[\leftfield][l]
     {\ifthenelse{\equal{\@yref}{}}
        {\@ymail}{\@yref\hfill\@ymail\hfill}}
  \@myref\par
  \ifthenelse{\equal{\@subject}{}}
     {}{\@subject\par}
  \vspace{2\parskip} #1 \par\nobreak}
