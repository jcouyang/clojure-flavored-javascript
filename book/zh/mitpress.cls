\def\currversion{August 15, 2011}

  %****************************************************************%
  %*                                                              *%
  %*     Prepared by Amy Hendrickson                              *% 
  %*     TeXnology Inc.                                           *%
  %*     www.texnology.com                                        *%
  %*     amyh@texnology.com                                       *%
  %*                                                              *%
  %*     001 617 738-8029                                         *%
  %*     Brookline, MA, USA                                       *%
  %*                                                              *%
  %****************************************************************%

\typeout{^^J^^J
MIT Press Draft Manuscript Style
^^J
Written by Amy Hendrickson, TeXnology, Inc., August 2011^^J
^^J
This version is dated \currversion^^J^^J}


\floatsep 12pt plus 2pt minus 2pt
\textfloatsep 20pt plus 2pt minus 4pt
\intextsep 12pt plus 2pt minus 2pt

\dblfloatsep 12pt plus 2pt minus 2pt
\dbltextfloatsep 20pt plus 2pt minus 4pt


\@fptop 0pt plus 1fil
\@fpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil
\@dblfptop 0pt plus 1fil
\@dblfpsep 8pt plus 2fil
\@dblfpbot 0pt plus 1fil

\maxdepth=4pt %% 

\oddsidemargin-18pt
\evensidemargin-6pt
\marginparwidth .75in

\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{7\p@}
\fi
\setlength\marginparpush{5\p@}

\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

%%%
\setcounter{topnumber}{10}
\def\topfraction{.9}
\setcounter{bottomnumber}{10}
\def\bottomfraction{.9}
\setcounter{totalnumber}{20}
\def\textfraction{.1}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}
%%%

\setlength\arraycolsep{5\p@}
\tabcolsep 6pt

\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ plus .01pt} 

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}



%%%%%%%%%%%%%%% <<== end dimensions

%%% Global parameters ==>>



%% to make left and right page position differently.
\@twosidetrue  \@mparswitchtrue
\@twocolumnfalse

%% 2e ==>>>
\newif\if@openbib
%\@openbibtrue
\@openbibfalse
\newif\if@openright
\newif\if@mainmatter 
\newif\if@restonecol
\newif\if@titlepage
\newif\ifdraft

%% Start new chapter on right side
\newif\if@openright
\@openrightfalse

\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}

%%% <== end global parameters

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bk12.clo, with variations

\ProvidesFile{bk12.clo}
              [2000/05/19 v1.4b
      Standard LaTeX file (size option)]
\renewcommand\normalsize{%
\ifdraft
   \@setfontsize\normalsize\@xiipt{24}
\else
\@setfontsize\normalsize\@xiipt{14.5}%
\fi
      \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
\ifdraft
   \@setfontsize\small\@xipt{24}
\else
   \@setfontsize\small\@xipt{13.6}%
\fi
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 9\p@ \@plus3\p@ \@minus5\p@
               \parsep 4.5\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
\ifdraft
   \@setfontsize\footnotesize\@xpt{24}
\else
   \@setfontsize\footnotesize\@xpt\@xiipt
\fi
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\newcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\newcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\newcommand\large{\@setfontsize\large\@xivpt{18}}
\newcommand\Large{\@setfontsize\Large\@xviipt{22}}
\newcommand\LARGE{\@setfontsize\LARGE\@xxpt{25}}
\newcommand\huge{\@setfontsize\huge\@xxvpt{30}}
\let\Huge=\huge
\if@twocolumn
  \setlength\parindent{1em}
\else
  \setlength\parindent{1.5em}
\fi
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}
\setlength\headsep   {.275in}
\setlength\topskip   {12\p@}
\setlength\footskip{30\p@}
\if@compatibility \setlength\maxdepth{4\p@} \else
\setlength\maxdepth{.5\topskip} \fi
\if@compatibility
  \if@twocolumn
    \setlength\textwidth{410\p@}
  \else
    \setlength\textwidth{5in}
  \fi
\else
  \setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-2in}
  \setlength\@tempdimb{390\p@}
  \if@twocolumn
    \ifdim\@tempdima>2\@tempdimb\relax
      \setlength\textwidth{2\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \else
    \ifdim\@tempdima>\@tempdimb\relax
      \setlength\textwidth{\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \fi
\fi
\if@compatibility\else
  \@settopoint\textwidth
\fi
\if@compatibility
  \setlength\textheight{36\baselineskip}
\else
  \setlength\@tempdima{\paperheight}
  \addtolength\@tempdima{-2in}
  \addtolength\@tempdima{-1.5in}
  \divide\@tempdima\baselineskip
  \@tempcnta=\@tempdima
  \setlength\textheight{\@tempcnta\baselineskip}
\fi
\addtolength\textheight{\topskip}
\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{7\p@}
\fi
\setlength\marginparpush{7\p@}
\if@compatibility
   \setlength\oddsidemargin   {.25in}
   \setlength\evensidemargin  {1.25in}
   \setlength\marginparwidth {1in}
  \if@twocolumn
     \setlength\oddsidemargin  {30\p@}
     \setlength\evensidemargin {30\p@}
     \setlength\marginparwidth {48\p@}
  \fi
\else
  \if@twoside
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.4\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.6\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
  \else
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.5\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.5\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
    \addtolength\marginparwidth {-.4in}
  \fi
  \ifdim \marginparwidth >2in
     \setlength\marginparwidth{2in}
  \fi
  \@settopoint\oddsidemargin
  \@settopoint\marginparwidth
  \setlength\evensidemargin  {\paperwidth}
  \addtolength\evensidemargin{-2in}
  \addtolength\evensidemargin{-\textwidth}
  \addtolength\evensidemargin{-\oddsidemargin}
  \@settopoint\evensidemargin
\fi
\if@compatibility
  \setlength\topmargin{.73in}
\else
  \setlength\topmargin{\paperheight}
  \addtolength\topmargin{-2in}
  \addtolength\topmargin{-\headheight}
  \addtolength\topmargin{-\headsep}
  \addtolength\topmargin{-\textheight}
  \addtolength\topmargin{-\footskip}     % this might be wrong!
  \addtolength\topmargin{-.5\topmargin}
  \@settopoint\topmargin
\fi
\setlength\footnotesep{8.4\p@}
\setlength{\skip\footins}{10.8\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {14\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\dblfloatsep    {14\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{10\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{10\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{3\p@ \@plus 2\p@ \@minus 2\p@}

\def\@listi{\leftmargin\leftmargini
            \parsep 5\p@  \@plus2.5\p@ \@minus\p@
            \topsep 10\p@ \@plus4\p@   \@minus6\p@
            \itemsep5\p@  \@plus2.5\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    5\p@   \@plus2.5\p@ \@minus\p@
              \parsep    2.5\p@ \@plus\p@    \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2.5\p@\@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

%%%%%% end of bk12.clo

\def\@listI{\leftmargin\leftmargini
            \parsep 4\p@ \@plus2\p@ \@minus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

\leftmargini 25pt
\leftmarginii 22pt
\leftmarginiii 18.7pt
\leftmarginiv 17pt
\leftmarginv 10pt
\leftmarginvi 10pt

\leftmargin\leftmargini
\labelsep 5pt
\labelwidth\leftmargini\advance\labelwidth-\labelsep

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength\leftmargin    {\leftmargini}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\theenumiv}{\Alph{enumiv}}
\newcommand{\labelenumi}{\theenumi.}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}


%%%%%%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parts, Chapters, Sections

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
\ifnum\c@part=0 \global\@mainmattertrue
\pagenumbering{arabic}\setcounter{page}{1}\fi
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{Part \thepart:\hspace{1em}#1}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{plain}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
%                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Verse, Quotation

\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Appendix
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Math

%% set equations back to zero with each new chapter
\@addtoreset {equation}{chapter}

\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figure and Table Captions

\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{10\p@}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of Contents, List of Tables, List of Figures
%% Headings in TOC

\newcommand\tableofcontents{%
\startonoddpage
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
\normalsize
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{.5em \@plus\p@}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
         #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}

\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{0}{1.5em}{2.3em}}

\let\l@figure\l@chapter
\let\l@table\l@figure

\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\setlength  \labelsep  {6pt}
\ifodd\c@page\else\null\thispagestyle{plain}\newpage\fi
\chapter*{Bibliography}%
\markboth{\bibname}{\bibname}
                \addcontentsline{toc}{schapter}{Bibliography}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Index

\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
\addcontentsline{toc}{schapter}{Index}
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Footnotes
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}



%%%%%%%%%%%%%%
% timestamp

\newif\iftimestamp
\def\timestamp{\global\timestamptrue}


\def\fix{\ifcase\oldtime 0\or0\or0\or%
0\or0\or0\or0\or0\or0\or0\fi}
\def\fixtiming{\ifcase\timing 0\or0\or0\or% 
0\or0\or0\or0\or0\or0\or0\fi}
\newcount\timing 
\newcount\hourcount
\newcount\oldtime 

\def\realtime{\timing=\time \oldtime=\time
\ifnum\timing>60 \divide\timing by 60
\hourcount=\the\timing
\multiply\timing by 60
\advance\oldtime by-\timing
\ifnum\hourcount<12 \number\hourcount:\fix\number\oldtime am\fi%
\ifnum\hourcount=12 \number\hourcount:\fix\number\oldtime pm\fi%
\ifnum\hourcount>12 \advance\hourcount by-12
\number\hourcount:\fix\number\oldtime pm\fi
\else12:\fixtiming\number\timing am\fi}


%%% Endnotes 
\let\footnoterule\relax

\@addtoreset{footnote}{chapter}

\long\def\@makefntext#1{%
    \parindent 1em%
    \noindent
    \@makefnmark#1}

\newcount\footnum
\newcount\savefootnum
\def\endnote#1{\global\advance\footnum by 1\relax$^{\the\footnum}$%
\long\expandafter\gdef\csname foot\the\footnum\endcsname{%
\vtop{\small\hsize=\textwidth\leftskip=12pt\relax\parindent=-12pt
\indent\hbox to12pt{\the\footnum.\hfill}{#1\strut\vskip1sp}}\vskip1pt}}

\let\footnote\endnote

\def\endnotetext#1{\global\advance\footnum by 1\relax
\long\expandafter\gdef\csname foot\the\footnum\endcsname{%
\vtop{\small\hsize=\textwidth\leftskip=12pt\relax\parindent=-12pt
\indent\hbox to12pt{\the\footnum.\hfill}{#1\strut\vskip1sp}}\vskip1pt}}

\def\endnotes{\section*{Notes}
\ifnum\footnum=0\else
\savefootnum=\footnum
\footnum=0
\noindent\loop\ifnum\savefootnum>\footnum%
\global\advance\footnum by1\relax%
\vskip12pt
\csname foot\the\footnum\endcsname\relax%
\expandafter\gdef\csname foot\the\footnum\endcsname{\relax}\relax%
\repeat\global\footnum=0\relax\fi}

\def\note{\section*{Note}}

%%% <<<=== End Footnotes

%%% Running heads ===>>>

%% unless we need these, leave these uncommented
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble

\def\ps@headings{\let\@mkboth\markboth
 \def\@oddfoot{\vtop to0pt{\vskip18pt
\iftimestamp
\hrule
\vskip6pt
\hbox to\textwidth{%
\footnotesize{\tt
Printed:\ \today, \realtime}\hfill\bf\itshape/\ \ \ \ Page \thepage\hss}
\else
\hbox to\textwidth{%
\hfill\footnotesize
\thepage\hfill}\fi
\vss}}
%
\let\@evenfoot\@oddfoot
%
\def\@oddhead{\vbox to0pt{\vss
\hrule
\vskip3pt
\footnotesize\it
\noindent\thebooktitle\\[-12pt]
\rm \thebookauthor
\vskip3pt
\hrule
\vskip24pt
}}%
\let\@evenhead\@oddhead
 \def\chaptermark##1{\markboth {\uppercase{##1}}{}}%
 \def\sectionmark##1{\markright {\uppercase{##1}}}}

\markboth{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Default settings for beginning of document:

  \raggedbottom
  \onecolumn

\ps@headings



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dimensions  ===>>>





\topmargin.75in
\headheight 12pt
\headsep 18pt
\topskip  10pt
\footskip 18pt

\columnsep 10pt
\columnseprule 0pt

\footnotesep 6.65pt
\skip\footins 18pt

\def\l@schapter#1#2{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 6pt \@plus\p@
     \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
#1\nobreak\hfil \nobreak\hbox 
to\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
\vskip1sp
  \fi}

\oddsidemargin=0pt
\evensidemargin=0pt

\advance\hoffset.5in
\advance\voffset-.5in
\advance\voffset12pt

\textheight = 8in
\textwidth= 5.5in

\drafttrue
\raggedright
%%

\pdfpageheight 11in

\usepackage{times}

%%% front matter
\newif\iftitle

\def\title#1{\def\thebooktitle{#1}}
\def\editedby#1{\def\theeditedby{#1}
\def\thebookauthor{#1}}


\def\bookauthor#1{\def\thebookauthor{#1}}
\def\bookauthors#1{\def\thebookauthors{#1}}


\long\def\dedication#1{\def\thededication{#1}}


\def\foreword{\chapter*{Foreword}
\addcontentsline{toc}{schapter}{Foreword}
\def\author##1{\vskip-.5in{\small\noindent by ##1}
\everypar={\hskip-\parindent\everypar={}}\vskip.4in
\addtocontents{toc}{\string\vskip-6pt\space{\string\it\space by ##1
\string\vskip6pt
}}}
\def\authoraddress##1{{\parindent=0pt
\vskip24pt\small\noindent\ignorespaces ##1}}
}

\def\endforeword{\newpage}


\def\seriesforeword{\chapter*{Series Foreword}
\addcontentsline{toc}{schapter}{Series Foreword}
\def\author##1{\vskip-.5in{\small\noindent by ##1}
\everypar={\hskip-\parindent\everypar={}}\vskip.4in
\addtocontents{toc}{\string\vskip-6pt\space{\string\it\space by ##1
\string\vskip6pt
}}}
\def\authoraddress##1{{\parindent=0pt
\vskip24pt\small\noindent\ignorespaces ##1}}
}

\def\endseriesforeword{\newpage}


\def\preface{\startonoddpage
\chapter*{Preface}
\addcontentsline{toc}{schapter}{Preface}

\def\authoraddress##1{{\parindent=0pt
\vskip24pt\small\noindent\ignorespaces ##1}}
}

\def\endpreface{\newpage}


\def\introduction{\chapter*{Introduction}
\addcontentsline{toc}{schapter}{Introduction}
\def\author##1{\vskip-36pt{\rm\noindent ##1}
\addtocontents{toc}{\string\vskip-6pt{\space\string\it\space by ##1
\string\vskip6pt
}}
\vskip.8in}
\let\authors\author
}

\def\endintroduction{\newpage}

\def\acknowledgment{\chapter*{Acknowledgment}
\def\authorinitials##1{\vskip6pt{\small\rm\noindent
-- ##1}}}
\let\endacknowledgment\relax
\def\acknowledgments{\section*{Acknowledgments}}

\def\endacknowledgment{\newpage}
\def\endacknowledgments{\newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Titlepages

\def\compositor#1{\def\thecompositor{#1}}
\let\thecompositor\relax

\def\titlepages{\thispagestyle{plain}
\noindent{\bf \thebooktitle}\newpage

\expandafter\ifx\csname theseriespage\endcsname\relax
\null
\else
\vglue1in
{\parskip=24pt \parindent=0pt
\def\title##1{{\vskip1sp\small\bf ##1}}
\def\author##1{{\vskip-24pt\rm##1}}
\theseriespage
}
\fi

\newpage
\thispagestyle{plain}
\vbox to.9\textheight{\parindent=0pt
\noindent{\bf \thebooktitle}

{\bf \thesubtitle}
\vskip24pt
{\rm \thebookauthor}
\vfill
The MIT Press\\
Cambridge, Massachusetts\\
London, England\vskip1.5in}

\newpage
{\footnotesize\parskip24pt \parindent=0pt
\copyright 2011 Massachusetts Institute of Technology


All rights reserved. No part of this book may be reproduced in any form by
any electronic or mechanical means (including photocopying, recording, or
information storage and retrieval) without permission in writing from the
publisher.


For information about special quantity discounts, please email 
special\_sales@mitpress.mit.edu

This book was set in the \LaTeX\ programming language by the author. 
Printed and bound in the United States of America.

\expandafter\ifx\csname thecompositor\endcsname\relax
\else
Compositor: \thecompositor
\fi


Library of Congress Cataloging-in-Publication Data\\
10\quad 9\quad 8\quad 7\quad 6\quad 5\quad 4\quad 3\quad 2\quad 1
}
\thispagestyle{plain}

\expandafter\ifx\csname thededication\endcsname\relax
\else
\newpage
\thispagestyle{plain}
\vbox to.9\textheight{\vglue1in
\small\it \raggedleft \parskip24pt
\thededication
}
\newpage
\fi
\tableofcontents
}


\def\subtitle#1{\def\thesubtitle{#1}}


\def\@makechapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
\bfseries     \boldmath  #1\par\nobreak
    \vskip 40\p@
  }}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\bfseries}}

\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\bfseries\itshape}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.5ex\@plus -1ex \@minus -.2ex}%
                                     {1ex \@plus .2ex}%
                                     {\normalfont\rm}}

\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}


\let\startonoddpage\relax

%% may change to \pagestyle{headings} with first chapter
\pagestyle{plain}
\pagenumbering{roman}

\def\fancyrunningheads{\pagestyle{headings}}

\def\@chapter[#1]#2{
\ifnum\c@part>0
\else
\ifnum\c@chapter<1 \global\@mainmattertrue
\pagenumbering{arabic}\setcounter{page}{1}\fi\fi
%
                         \refstepcounter{chapter}%
                      \addcontentsline{toc}{chapter}{\@chapapp\ \thechapter: #1}%
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                                          \@makechapterhead{#2}%
                      \@afterheading
                    }

\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{0}

\long\def\seriespage#1{\def\theseriespage{#1}}

\def\sqbullet{\raise2pt\hbox{\vrule width 3pt depth0pt height 3pt}}
\newcommand{\labelitemi}{\sqbullet%$\m@th\bullet$
}

\newcommand{\labelitemii}{\normalfont\bfseries --}
\newcommand{\labelitemiii}{$\m@th\ast$}
\newcommand{\labelitemiv}{$\m@th\cdot$}

\def\@listi{\leftmargin\leftmargini
            \parsep 4.5\p@ \@plus2\p@ \@minus\p@
            \topsep 9\p@   \@plus3\p@ \@minus5\p@
            \itemsep4.5\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4.5\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@   \@plus\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
\leftmargini 2.5pc
\leftmarginii 22pt
\leftmarginiii 18.7pt
\leftmarginiv 17pt
\leftmarginv 10pt
\leftmarginvi 10pt

\leftmargin\leftmargini
\labelsep 5pt
\labelwidth\leftmargini\advance\labelwidth-\labelsep

\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}

\newcommand*{\descriptionlabel}[1]{\hspace\labelsep
                                \normalfont\bfseries #1}


\def\epigram#1#2{\vskip12pt{\small\it
\noindent\ignorespaces#1\hfill\rm --\ignorespaces#2}\vskip12pt}

\def\ps@plain{\let\@mkboth\@gobbletwo
     \let\@oddhead\@empty
\def\@oddfoot{\vtop to 0pt{\vskip24pt \hsize=\textwidth
\centerline{\reset@font\hfil\thepage\hfil}\vss}}
\let\@evenhead\@empty\let\@evenfoot\@oddfoot}


\frenchspacing

\def\epilogue{\bgroup
\def\title##1{\chapter*{##1}
\addcontentsline{toc}{schapter}{##1}}}


\def\endepilogue{\egroup}

\def\author#1{\vskip-30pt{\rm\noindent #1}
\addtocontents{toc}{\string\vskip-1pt{\space\string\it\space by #1
\string\vskip2pt
}}\vskip36pt}

\let\authors\author

%\usepackage{natbib}
\def\refname{References}
\usepackage[english]{babel}

\parindent=1.5pc
\parskip=0pt
\raggedbottom

\def\@biblabel#1{#1}

\widowpenalty10000
\clubpenalty10000

\def\listofcontributors{\chapter*{List of Contributors}
\addcontentsline{toc}{schapter}{List of Contributors}
}


\def\name#1{\vskip12pt\noindent{\bf\ignorespaces#1\ \ }}

\def\callout#1{\vskip12pt\noindent\hskip\parindent{\rm [Insert #1 near here]}\vskip12pt}

\def\bibliography#1{%
  \if@filesw
    \immediate\write\@auxout{\string\bibdata{#1}}%
  \fi
\newpage
\addcontentsline{toc}{schapter}{References}
  \@input@{\jobname.bbl}}

\def\dotfill{%
  \leavevmode
  \cleaders \hb@xt@ .44em{\hss\hss}\hfill
  \kern\z@}

\def\xfigure{figure}
\long\def\@caption#1[#2]#3{%
  \par
\def\one{#1}\expandafter\ifx\one\xfigure
  \addcontentsline{lof}{#1}%
    {Figure\ 
\protect\numberline{\csname the#1\endcsname:}{\string\ \ignorespaces #2}}%
\else
  \addcontentsline{lot}{#1}%
    {Table\ 
\protect\numberline{\csname the#1\endcsname:}{\string\ \ignorespaces #2}}%
\fi
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}


\def\@cite#1#2{[{#1\if@tempswa , #2\fi}]}
\endinput

