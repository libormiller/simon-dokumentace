%% This is the fee-thesis document class. It is used to produce theses
%% for submission to the Faculty of Electrical Engineering, University of West Bohemia
%%
%% Get the newest version from
%% https://gitlab.ket.zcu.cz/templates/feethesis-latex
%%
%% Copyright 2022, Jan Belohoubek
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public Licenese, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%  https://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The current maintainer of this work is Jan Belohoubek (belohoub@fel.zcu.cz).
%% Please, submit bug reports into the tracker at
%% https://gitlab.ket.zcu.cz/templates/feethesis-latex/-/issues
%%
%% This work was derived from the FIT CTU Theses template
%% by Eliska Sestakova and Ondrej Guth (ce1138a0474df18ba5add79f3373a216afba0098)
%%
%% The FIT CTU template can be obtained from:
%% https://gitlab.fit.cvut.cz/theses-templates/FITthesis-LaTeX

% identification

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fee-thesis}[2022/08/15 FEE UWB thesis template]

% preliminary declarations

% options
\DeclareOption{bachelor}{\def\@feethesistype{B}}
\DeclareOption{master}{\def\@feethesistype{M}}
\DeclareOption{dissertation}{\def\@feethesistype{D}}
\DeclareOption{czech}{
	\AtBeginDocument{\selectlanguage{czech}}
	\PassOptionsToPackage{english,main=czech}{babel}
	\def\@feelang{C}
}
\DeclareOption{english}{
	\AtBeginDocument{\selectlanguage{english}}
	\PassOptionsToPackage{czech,main=english}{babel}
	\def\@feelang{E}
}
\DeclareOption{slovak}{
	\AtBeginDocument{\selectlanguage{slovak}}
	\PassOptionsToPackage{english,main=slovak}{babel}
	\def\@feelang{S}
}
\ExecuteOptions{unicode,twoside}
\ProcessOptions

% main declarations, loading files

\LoadClass[a4paper, oneside]{book}[2020/04/10]
\RequirePackage{babel}[2021/03/03]
\RequirePackage[left=3cm,right=2.5cm, top=2.5cm, bottom=2.5cm, includeheadfoot]{geometry}[2020/01/02] %page layout
\RequirePackage{setspace}[2011/12/19] %line spacing in title page
\RequirePackage{xcolor}[2016/05/11]
\RequirePackage[labelsep=space,singlelinecheck=false,font={up,small},labelfont={sf,bf}]{caption}[2020/05/30]
\RequirePackage{fancyhdr}[2019/01/31]
\RequirePackage{multicol}[2019/12/09] % summary page
\RequirePackage{titlesec}[2019/10/16]
\RequirePackage{anyfontsize}[2019/10/16]
\RequirePackage{xpatch}[2019/10/16]
\RequirePackage{colortbl} % coloured tables
\RequirePackage{setspace} % 1.5 spacing
\RequirePackage{newtxtext} % Times New Roman

% colors
 \definecolor{decoration}{RGB}{91, 155, 213} % FEE blue
 \definecolor{heading}{RGB}{0, 0, 0}
 \definecolor{headbackgroundgray}{RGB}{91, 155, 213} % header blue
 \definecolor{backgroundgray}{RGB}{222, 234, 246} % light blue
 \definecolor{headcolor}{rgb}{0,0,0}
 \definecolor{enumgray}{RGB}{91, 155, 213} % FEE blue
% colors end

\DeclareRobustCommand{\feetitle}[1]{
	\def\thefeetitle{#1}
	\title{#1}
}
\DeclareRobustCommand{\feeauthorfull}[1]{
	\def\thefeeauthorfull{#1}
	\author{#1}
}
\DeclareRobustCommand{\feeauthorsurnames}[1]{
	\def\thefeeauthorsurnames{#1}
	\author{#1}
}
\DeclareRobustCommand{\feeauthorgivennames}[1]{
	\def\thefeeauthorgivennames{#1}
	\author{#1}
}
\DeclareRobustCommand{\feesupervisor}[1]{
	\def\thefeesupervisor{#1}
}
\DeclareRobustCommand{\feedepartment}[1]{
	\def\thefeedepartment{#1}
}
\DeclareRobustCommand{\feeyear}[1]{
	\def\thefeeyear{#1}
	\date{#1}
}
\DeclareRobustCommand{\feedeclarationplace}[1]{
	\def\thefeedeclarationplace{#1}
}
\DeclareRobustCommand{\feedeclarationdate}[1]{
	\def\thefeedeclarationdate{#1}
}
\DeclareRobustCommand{\feeabstractCZE}[1]{
	\def\thefeeabstrakt{#1}
}
\DeclareRobustCommand{\feeabstractENG}[1]{
	\def\thefeeabstract{#1}
}
\DeclareRobustCommand{\feekeywordsCZE}[1]{
	\def\thefeeklicovaslova{#1}
}
\DeclareRobustCommand{\feekeywordsENG}[1]{
	\def\thefeekeywords{#1}
}
\DeclareRobustCommand{\thefeethesistype}{
	\if\@feethesistype B{%
		\if\@feelang C{Bakal{\' a}{\v r}sk{\' a} pr{\' a}ce}\else\if\@feelang S{Bakal{\' a}rska pr{\' a}ca}\else{Bachelor's thesis}\fi\fi
	}\else\if\@feethesistype M{%
		\if\@feelang C{Diplomov{\' a} pr{\' a}ce}\else\if\@feelang S{Diplomov{\' a} pr{\' a}ca}\else{Master's thesis}\fi\fi
	}\else\if\@feethesistype D{Dissertation thesis}\else{\ClassError{fee-thesis}{Thesis type not specified}{Add either `bachelor', `master', or `dissertation' option to this document class}}\fi\fi\fi
}

\DeclareRobustCommand{\thefeethesistypes}{
	\if\@feethesistype B{%
		\if\@feelang C{bakal{\' a}{\v r}skou pr{\' a}ci}\else\if\@feelang S{bakal{\' a}rskou pr{\' a}cu}\else{bachelor's thesis}\fi\fi
	}\else\if\@feethesistype M{%
		\if\@feelang C{diplomov{\' a} pr{\' a}ci}\else\if\@feelang S{diplomov{\' a} pr{\' a}cu}\else{master's thesis}\fi\fi
	}\else\if\@feethesistype D{dissertation thesis}\else{\ClassError{fee-thesis}{Thesis type not specified}{Add either `bachelor', `master', or `dissertation' option to this document class}}\fi\fi\fi
}

\DeclareRobustCommand{\thefeethesistypeuppercase}{
	\if\@feethesistype B{%
		\if\@feelang C{BAKAL{\' A}{\v R}SK{\' A} PR{\' A}CE}\else\if\@feelang S{BAKAL{\' A}RSKA PR{\' A}CA}\else{BACHELOR'S THESIS}\fi\fi
	}\else\if\@feethesistype M{%
		\if\@feelang C{DIPLOMOV{\' A} PR{\' A}CE}\else\if\@feelang S{DIPLOMOV{\' A} PR{\' A}CA}\else{MASTER'S THESIS}\fi\fi
	}\else\if\@feethesistype D{DISSERTATION THESIS}\else{\ClassError{fee-thesis}{Thesis type not specified}{Add either `bachelor', `master', or `dissertation' option to this document class}}\fi\fi\fi
}

\DeclareRobustCommand{\thefeeuniversity}{\if\@feelang C{Z{\' a}pado{\v c}esk{\' a} univerzita}\else\if\@feelang S{Z{\' a}pado{\v c}esk{\' a} univerzita}\else{University of West Bohemia}\fi\fi}

\DeclareRobustCommand{\thefeeuniversityuppercase}{\if\@feelang C{Z{\' A}PADO{\v C}ESK{\' A} UNIVERZITA V PLZNI}\else\if\@feelang S{Z{\' A}PADO{\v C}ESK{\' A} UNIVERZITA V PLZNI}\else{UNIVERSITY OF WEST BOHEMIA IN PILSEN}\fi\fi}

\DeclareRobustCommand{\thefeefaculty}{\if\@feelang C{Fakulta elektrotechnick{\' a}}\else\if\@feelang S{Fakulta elektrotechnick{\' a}}\else{Faculty of Electrical Engineering}\fi\fi}

\DeclareRobustCommand{\thefeesupervisorlabelcapital}{\if\@feelang C{Vedouc{\' i} pr{\' a}ce}\else\if\@feelang S{Ved\'uci pr{\' a}ce}\else{Supervisor}\fi\fi}

\DeclareRobustCommand{\thefeeauthorlabelcapital}{\if\@feelang C{Autor pr{\' a}ce}\else\if\@feelang S{Autor pr{\' a}ce}\else{Author}\fi\fi}

\DeclareRobustCommand{\thefeecitationlabel}{\if\@feelang C{Odkaz na tuto pr{\' a}ci}\else\if\@feelang S{Odkaz na t\'uto pr{\' a}cu}\else{Citation of this thesis}\fi\fi}

\DeclareRobustCommand{\thefeeallrightsreservedlabel}{\if\@feelang C{V{\v s}echna pr{\' a}va vyhrazena.}\else\if\@feelang S{V{\v s}etky pr{\' a}va vyhraden\'e.}\else{All rights reserved.}\fi\fi}

\DeclareRobustCommand{\thefeelistinglabel}{\if\@feelang C{V{\'y}pis k{\'o}du}\else\if\@feelang S{V{\'y}pis k{\'o}du}\else{Code listing}\fi\fi}

\DeclareRobustCommand{\thefeelollabel}{\if\@feelang C{Seznam v{\'y}pis{\r u} k{\'o}du}\else\if\@feelang S{Zoznam v{\'y}pisov k{\'o}du}\else{List of code listings}\fi\fi}

\DeclareRobustCommand{\thefeedeclarationlabel}{\frontsectionfont\if\@feelang C{Prohlášení}\else\if\@feelang E{Declaration}\else{Vyhlásenie}\fi\fi}

\DeclareRobustCommand{\thefeecopyrighttext}{\if\@feelang C{Tato pr{\' a}ce vznikla jako {\v s}koln{\' i} d{\' i}lo na Z{\' a}pado{\v e}esk{\' e} univerzit{\v e}, Fakult{\v e} elektrotechnick{\' e}. Pr{\' a}ce je chr{\' a}n{\v e}na pr{\' a}vn{\' i}mi p{\v r}edpisy a mezin{\' a}rodn{\' i}mi {\' u}mluvami o~pr{\' a}vu autorsk{\' e}m a pr{\' a}vech souvisej{\' i}c{\' i}ch s~pr{\' a}vem autorsk{\' y}m. K~jej\'\i{}mu u\v zit\'\i{}, s~v\'yjimkou bez\'uplatn\'ych z\'akonn\'ych licenc\'\i{} a nad r\'amec opr\'avn\v en\'\i{} uveden\'ych v~Prohl\'a\v sen\'\i{}, je nezbytn\'y souhlas autora.}\else\if\@feelang S{T\'ato pr\'aca vznikla ako \v skolsk\'e dielo na  FEL \v Z{\v C}U. Pr\'aca je chr\'anen\'a medzin\'arodn\'ymi predpismi a zmluvami o autorskom pr\'ave a pr\'avach s\'uvisiacich s autorsk\'ym pr\'avom. Na jej vyu\v zitie, s~v\'ynimkou bezplatn\'ych z\'akonn\'ych licenci\'\i, je nutn\'y s\'uhlas autora.}\else{This thesis is school work as defined by Copyright Act of the Czech Republic. It has been submitted at University of West Bohemia, Faculty of Electrical Engineering. The thesis is protected by the Copyright Act and its usage without author's permission is prohibited (with exceptions defined by the Copyright Act).}\fi\fi}

\addto\captionsczech{\renewcommand{\figurename}{Obr.}}
\addto\captionsslovak{\renewcommand{\figurename}{Obr.}}
\addto\captionsenglish{\renewcommand{\figurename}{Fig.}}

\DeclareRobustCommand{\thebibheading}{\if\@feelang C{\feefontLarge \bfseries Literatura\addcontentsline{toc}{chapter}{Literatura}}\else\if\@feelang S{\feefontLarge \bfseries Literatúra\addcontentsline{toc}{chapter}{Literatúra}}\else{\feefontLarge \bfseries Bibliography\addcontentsline{toc}{chapter}{Bibliography}}\fi\fi}

\addto\captionsczech{\defbibheading{bibheading}{\thebibheading{}}}
\addto\captionsslovak{\defbibheading{bibheading}{\thebibheading{}}}
\addto\captionsenglish{\defbibheading{bibheading}{\thebibheading{}}}

\captionsetup[figure]{width=0.5\textwidth}

\addto\captionsczech{\renewcommand{\tablename}{Tab.}}
\addto\captionsslovak{\renewcommand{\tablename}{Tab.}}
\addto\captionsenglish{\renewcommand{\tablename}{Tab.}}

\newcommand{\feefontsmall}{\normalfont \normalsize \fontsize{10pt}{12pt}\selectfont}
\newcommand{\feefontnormal}{\normalfont \normalsize \fontsize{12pt}{14.4pt}\selectfont}
\newcommand{\feefontlarge}{\normalfont \normalsize \fontsize{14pt}{16.8pt}\selectfont}
\newcommand{\feefontLarge}{\normalfont \normalsize \fontsize{16pt}{19.2pt}\selectfont}

% title page
\renewcommand{\maketitle}{\begin{titlepage}%

\centering
\newgeometry{left=3cm,top=2.5cm,right=3cm,bottom=3cm}%\thispagestyle{empty}%
\noindent{\fontsize{18pt}{21.6pt}\selectfont \thefeeuniversityuppercase}\\[3mm]

\textcolor{decoration}{\rule[10pt]{\textwidth}{0.5mm}}\\

\vspace{4mm}

\noindent{\feefontLarge \thefeefaculty}\\

\noindent{\normalsize \thefeedepartment}\\[5mm]

\vspace{7.2cm}

\noindent{\fontsize{26pt}{21.6pt}\selectfont \bfseries \thefeethesistypeuppercase}\\[3mm]

\noindent{\feefontLarge \thefeetitle}\\[3mm]

\vspace{8.0cm}

% define a fixed position
\vfill

\begin{tabular}{l p{0.2cm} l}
{\feefontlarge \thefeeauthorlabelcapital: } & ~ & {\feefontlarge {\bfseries \thefeeauthorfull}} \\
{\feefontlarge \thefeesupervisorlabelcapital: } & ~ & {\feefontlarge {\bfseries \thefeesupervisor}} \\
\end{tabular}

\vspace{8mm}

\textcolor{decoration}{\rule[5mm]{\textwidth}{0.5mm}}

\vspace{-2mm}

\noindent{\feefontlarge \thefeeyear}

\end{titlepage}
\restoregeometry
}
%title page end

% IMPRINT
\DeclareRobustCommand{\imprintpage}{
	\clearpage
	\thispagestyle{empty}
	

		~
	\vfill
	
	{\small
			\noindent \thefeeuniversity \\
		\noindent \thefeefaculty \\
	\noindent \textcopyright{} \thefeeyear{} \thefeeauthorfull. \thefeeallrightsreservedlabel\\
		\noindent \textit{\thefeecopyrighttext}
	
	\vspace{1em}
	
	\noindent \thefeecitationlabel: \thefeeauthorsurnames{} \thefeeauthorgivennames. \textit{\thefeetitle}. \thefeethesistype. \thefeeuniversity, \thefeefaculty, \thefeeyear.
   }
}
% IMPRINT END

% captions settings
\@ifpackagelater{hyperref}{2009/12/09}
  {\captionsetup{compatibility=false}}%cf. http://groups.google.de/group/comp.text.tex/browse_thread/thread/db9310eb540fbbd8/42e30f3b7b3aa17a?lnk=raot
  {}
\DeclareCaptionLabelFormat{boxed}{%0.61,0.61,0.61
  \kern0.05em{\color{decoration}\rule{0.73em}{0.73em}}%
  \hspace*{0.67em}\bothIfFirst{#1}{~}#2}

\DeclareCaptionLabelFormat{plain}{\feefontsmall \bothIfFirst{#1}{~}#2}
  
\captionsetup{labelformat=plain}

\captionsetup[table]{position=top}
% captions settings end

% lists settings - use defaults
\setlength\leftmargini {3em}
\setlength\leftmarginii {3em}
\setlength\leftmarginiii{3em}
\setlength\leftmarginiv {3em}
\setlength\leftmarginv  {3em}
\setlength\leftmarginvi {3em}
\renewcommand\labelenumi{(\theenumi)}
\renewcommand\labelenumii{(\theenumii)}
\renewcommand\labelenumiii{(\theenumiii)}
\renewcommand\labelenumiv{(\theenumiv)}
% \makeatletter
\renewcommand\labelitemi{--}
% \makeatother
\renewcommand\labelitemii{--}
\renewcommand\labelitemiii{--}
\renewcommand\labelitemiv{--}

%%%%%%%%%%%%%%
% FRONTMATTER SETTINGS
% no need to modify this part
%%%%%%%%%%%%%%
\DeclareRobustCommand{\frontmatterinit}{
\titleformat
{\chapter} % command
[block] % shape
{} % format
{} % label
{} % sep
{\color{heading} \feefontLarge \bfseries} % before-code
[\vskip -2em] % after-code

\titleformat{\section}
  {\normalsize \color{heading}}{{\color{black}\thesection}}{1em}{}%[\vskip -1em]
  
\titleformat{\subsection}
  {\normalsize\bfseries\color{heading}}{{{\color{black}\hspace{0.73cm}\thesubsection}}}{1em}{}%[\vskip -1em]
  
\titleformat{\subsubsection}
  {\normalsize\bfseries\color{heading}}{{{\color{black}\hspace{0.73cm}\thesubsubsection}}}{1em}{}%[\vskip -1em]

  
% \titleformat{\subsection}
%   {\frontsubsectionfont\color{heading}}{{{\color{black}\thesubsection}}}{1em}{}[\vskip -1em]
  
% \titleformat{\subsubsection}
%   {\frontsubsubsectionfont\color{heading}}{{{\color{black}\thesubsubsection}}}{1em}{}[\vskip -1em]

% \makeatletter
\@openrightfalse
% \makeatother

% switch page numbering OFF
\pagenumbering{gobble}

% set speciffic spacing
\setstretch{1.5}

}
%%%%%%%%%%%%%%
% FRONTMATTER SETTINGS END
%%%%%%%%%%%%%%

%%%%%%%%%%%%%%
% BACKMATTER SETTINGS
% no need to modify this part
%%%%%%%%%%%%%%
\DeclareRobustCommand{\backmatterinit}{

\titleformat
{\chapter} % command
[block] % shape
{} % format
{} % label
{} % sep
{\color{heading} \feefontLarge \bfseries} % before-code
[\vskip -2em] % after-code

\titleformat{\section}
  {\normalsize \color{heading}}{{\color{black}\thesection}}{1em}{}%[\vskip -1em]
  
\titleformat{\subsection}
  {\normalsize\bfseries\color{heading}}{{{\color{black}\hspace{0.73cm}\thesubsection}}}{1em}{}%[\vskip -1em]
  
\titleformat{\subsubsection}
  {\normalsize\bfseries\color{heading}}{{{\color{black}\hspace{0.73cm}\thesubsubsection}}}{1em}{}%[\vskip -1em]

  
% \makeatletter
\@openrightfalse
% \makeatother

% set speciffic spacing
\setstretch{1.5}

}
%%%%%%%%%%%%%%
% BACKMATTER SETTINGS END
%%%%%%%%%%%%%%


% frontmatter headings
\def\frontchapterfont{\feefontLarge \bfseries}
\def\frontsectionfont{\normalsize\bfseries}
\def\frontsubsectionfont{\large\bfseries}
\def\frontsubsubsectionfont{\large}
% frontmatter headings end

% frontmatter pseudochapters: named part without printing actual chapter heading
% \makeatletter
\newcommand{\frontchapternotprinted}[1]{%
  \begingroup
  \let\@makechapterhead\@gobble % make \@makechapterhead do nothing
  \let\cleardoublepage\clearpage
  %\chapter{#1}
  \clearpage
  \endgroup
}
% \makeatother
% frontmatter pseudochapters end

% table of contents colored chapters
% \makeatletter
\let\stdl@chapter\l@chapter
\renewcommand*{\l@chapter}[2]{%
  \stdl@chapter{\textcolor{heading}{#1}}{\textcolor{heading}{#2}}}
% \makeatother
% table of contents colored chapters end

% headers and footers
% \makeatletter
\def\ps@plain{%chapter beginning
    \let\@evenhead\@empty%
    \let\@oddhead\@empty%
    \def\@evenfoot{\bfseries\color{headcolor}\hfill\thepage\hfill}%
    \def\@oddfoot{\bfseries\color{headcolor}\hfill\thepage\hfill}}
% \makeatother
\renewcommand{\chaptermark}[1]{\markboth{\ifnum\value{chapter}>0 \thechapter~\hspace{0.1cm}\fi #1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\fancyhf{}
\fancyhead[LE]{}
\fancyhead[RE]{\color{headcolor} \MakeUppercase \leftmark}
\fancyhead[RO]{\color{headcolor} \MakeUppercase \leftmark}
\fancyhead[LO]{}
\fancyfoot[CE,CO]{\thepage}
\renewcommand{\headrulewidth}{0.05cm}
\xpretocmd\headrule{\color{decoration}}{}{\PatchFailed}
% headers and footers end


\newenvironment{abstrakt}{%
  \vspace*{12pt}
  \noindent
  {{\frontsectionfont\begin{flushleft}{\color{heading}Abstrakt}\end{flushleft}}}%
  \bigskip
  \noindent\ignorespaces}

\newenvironment{abstract}{%
  \vspace*{12pt}
  \noindent
  {{\frontsectionfont\begin{flushleft}{\color{heading}Abstract}\end{flushleft}}}%
  \bigskip
  \noindent\ignorespaces}
  
\newenvironment{keywords}{%
  \vspace*{12pt}
  \noindent
  {{\frontsectionfont\begin{flushleft}{\color{heading}Keywords}\end{flushleft}}}%
  \bigskip
  \noindent\ignorespaces}

\newenvironment{keywordscze}{%
  \vspace*{12pt}
  \noindent
  {{\frontsectionfont\begin{flushleft}{\color{heading}Kl{\' i}{\v c}ov{\' a} slova}\end{flushleft}}}%
  \bigskip
  \noindent\ignorespaces}
  
\newenvironment{declaration}{}

% acknowledgment page
\newenvironment{acknowledgmentpage}{\frontchapternotprinted{\if\@feelang C{Poděkování}\else\if\@feelang E{Acknowledgments}\else{Poďakovanie}\fi\fi}
~
{{\frontsectionfont\begin{flushleft}{\vfill\color{heading}\if\@feelang C{Poděkování}\else\if\@feelang E{Acknowledgments}\else{Poďakovanie}\fi\fi}\end{flushleft}}}%
\bigskip
% set speciffic spacing
\setstretch{1.5}
}
% acknowledgment page END

% declaration page
\newenvironment{declarationpage}{\frontchapternotprinted{\thefeedeclarationlabel}
~
\vfill

  {{\frontchapterfont\begin{flushleft}{\color{heading}\thefeedeclarationlabel}\end{flushleft}}}%
  \bigskip
  \noindent\ignorespaces
}{\vskip 1cm
\noindent
\if\@feelang E{In}\else{V}\fi~\thefeedeclarationplace{} \if\@feelang C{dne}\else\if\@feelang S{dne}\else{on}\fi\fi~\thefeedeclarationdate{} \hspace{.3\textwidth} \dotfill}
% declaration page END

% abstract page
\newenvironment{abstractpage}{\frontchapternotprinted{\if\@feelang E{Abstract}\else{Abstrakt}\fi}
}{}
% abstract page END

\newenvironment{summarypage}{\chapter{\if\@feelang C{Shrnutí}\else\if\@feelang E{Summary}\else{Zhrnutie}\fi\fi}
\setlength{\columnsep}{1cm}
\begin{multicols}{2}\small
}{\end{multicols}}

%%%%%%%%%%%%%%%%%%%%
% MAINMATTER SETTINGS
% no need to modify this part
%%%%%%%%%%%%%%%%%%%%
\DeclareRobustCommand{\mainmatterinit}{
% \makeatletter
\@openrighttrue
% \makeatother

\titleformat
{\chapter} % command
[block] % shape
%{ \feefontLarge \bfseries} % format
{\thispagestyle{fancy}\vspace{-2cm}}
%{ \textcolor{headbackgroundgray}{{\titlerule*[1pc]{\rule{0.25em}{0.25em}}}} \hspace{0.5ex} \color{black} \chaptername~\thechapter } % label
{\color{heading} \feefontLarge \bfseries \thechapter~\hspace{0.3cm}}
{0.0cm} % sep
{\color{heading} \feefontLarge \bfseries} % before-code
[\vskip -1cm] % after-code

%vzhled nadpisů sekcí
\titleformat{\section}
  {\normalsize \bfseries\color{heading}}{{\color{black}\thesection}}{1em}{}%[\vskip -1em]
  
\titleformat{\subsection}
  {\normalsize\bfseries\color{heading}}{{{\color{black}\hspace{0.73cm}\thesubsection}}}{1em}{}%[\vskip -1em]
  
\titleformat{\subsubsection}
  {\normalsize\color{heading}}{{{\color{black}\hspace{0.73cm}\thesubsubsection}}}{1em}{}%[\vskip -1em]


% set speciffic spacing
\setstretch{1.5}
  
\pagestyle{fancy}

}
%%%%%%%%%%%%%%%%%%%%
% MAINMATTER SETTINGS END
%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
% APPENDIX SETTINGS 
% no need to modify this part
%%%%%%%%%%%%%%%%%%%%
\DeclareRobustCommand{\appendixinit}{

\titleformat
{\chapter} % command
[block] % shape
%{ \LARGE \bfseries \raggedleft} % format
{\thispagestyle{fancy}\vspace{-2cm}}
%{ \textcolor{headbackgroundgray}{{\titlerule*[1pc]{\rule{0.25em}{0.25em}}}} \hspace{0.5ex} \color{black} \appendixname~\thechapter } % label
{\color{heading} \feefontLarge \bfseries \appendixname~\thechapter~ \feefontnormal}
{-0.0cm} % sep
{\color{heading} \feefontnormal} % before-code
[\label{appendix_\thechapter}\addcontentsline{app}{chapter}{\appendixname~\thechapter~ \nameref{appendix_\thechapter}} \vskip -1cm] % after-code

% set speciffic spacing
\setstretch{1.5}
  
\pagestyle{fancy}

\pagenumbering{Roman}

}

\newcommand{\appendixtocname}{\if\@feelang C{Seznam příloh}\else\if\@feelang S{Zoznam príloh}\else{List of Appendices}\fi\fi}
\newcommand{\listofappendices}{%
  \begingroup
  \renewcommand{\contentsname}{\appendixtocname}
  \let\@oldstarttoc\@starttoc
  \def\@starttoc##1{\@oldstarttoc{app}}
  \tableofcontents% Reusing the code for \tableofcontents with different \contentsname and different file handle app
  \endgroup
}

%%%%%%%%%%%%%%%%%%%%
% APPENDIX SETTINGS END
%%%%%%%%%%%%%%%%%%%%

% theorems, proofs, definitions, etc.
\RequirePackage{amsthm}[2020/05/29]
\RequirePackage{mathtools}[2020/03/24]
\RequirePackage{amssymb}[2013/01/14]

\thm@headfont{%
  \textcolor{decoration}{$\blacktriangleright$}\nobreakspace\bfseries}
\def\th@remark{%
  \thm@headfont{%
    \textcolor{decoration}{$\blacktriangleright$}\nobreakspace}%
  \normalfont % body font
  \thm@preskip\topsep \divide\thm@preskip\tw@
  \thm@postskip\thm@preskip
}
\def\@endtheorem{\endtrivlist}%\@endpefalse
\renewcommand\qedsymbol{\textcolor{decoration}{\ensuremath{\blacktriangleleft}}}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \color{black}\bfseries
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist%\@endpefalse
}
% theorems, proofs, definitions, etc. end

\DeclareRobustCommand{\printabstractpage}{%

\begin{abstractpage}
\if\@feelang E{%
\begin{abstract}%
\thefeeabstract
\end{abstract}

\vskip 0.5cm

\begin{keywords}%
\thefeekeywords
\end{keywords}}\else{%
\begin{abstrakt}%
\thefeeabstrakt
\end{abstrakt}

\vskip 0.5cm

\begin{keywordscze}%
\thefeeklicovaslova
\end{keywordscze}}\fi

\vskip 1cm

\if\@feelang E{%
\clearpage
\begin{abstrakt}%
\thefeeabstrakt
\end{abstrakt}

\vskip 0.5cm

\begin{keywordscze}%
\thefeeklicovaslova
\end{keywordscze}}\else{
\clearpage
\begin{abstract}%
\thefeeabstract
\end{abstract}

\vskip 0.5cm

\begin{keywords}%
\thefeekeywords
\end{keywords}}\fi
\end{abstractpage}
}

\newenvironment{chapterabstract}{\hfill\begin{minipage}{\dimexpr\textwidth-0.5cm}\itshape}{\end{minipage}\vskip 0.5cm\par\@afterindentfalse\@afterheading}

\AtBeginDocument{%
	\@ifpackageloaded{listings}{%
		\DeclareRobustCommand{\lstlistingname}{\thefeelistinglabel}%
		\DeclareRobustCommand{\lstlistlistingname}{\thefeelollabel}%
		\lstset{basicstyle=\small\ttfamily,keywordstyle=\bfseries,%
				backgroundcolor=\color{backgroundgray},%
				frame=single,framerule=0pt,xleftmargin=\fboxsep,xrightmargin=\fboxsep,
				literate={á}{{\'a}}1 {é}{{\'e}}1 {ě}{{\v e}}1 {í}{{\'i}}1 {ý}{{\' y}}1 {ó}{{\'o}}1 {ú}{{\'u}}1 {ů}{{\r u}}1 {ž}{{\v z}}1 {š}{{\v s}}1 {č}{{\v c}}1 {ř}{{\v r}}1 {ť}{{\v t}}1 {ň}{{\v n}}1 {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1 {Ž}{{\v Z}}1 {Š}{{\v S}}1 {Č}{{\v C}}1 {Ř}{{\v R}}1 {Ť}{{\v T}}1 {Ň}{{\v N}}1 {°}{\dg}1}%
	}{}%
	\@ifpackageloaded{minted}{%
		\DeclareRobustCommand{\listingscaption}{\thefeelistinglabel}%
		\DeclareRobustCommand{\listoflistingscaption}{\thefeelollabel}%
		\usemintedstyle{bw}%
		\setminted{bgcolor=backgroundgray}%
		\setmintedinline{bgcolor={}}
	}{}%
}
