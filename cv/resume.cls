% resume.cls

% \documentstyle{resume}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved.  This file is offered as-is,
% without any warranty.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article}
%\LoadClass[10pt,a4paper]{article}
\usepackage[parfill]{parskip}       % Do not indent aragraphs
\usepackage{array}                  % required for boldface tabular columns
\usepackage{ifthen}
\usepackage[dvipsnames]{xcolor}
\definecolor{HEAD}{RGB}{84, 141, 212}

\nofiles                            % .aux files are not needed for resumes
\pagestyle{empty}                   % resumes do not need page numbers

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADINGS: Commands for printing name and address

\def \name#1{\def\@name{#1}}        % \name command can be used to set name
\def \@name {}                      % Set \@name to empty by default

\def \addressSep {$\mid$}         % Set default address seperator

% One or two address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax

% \address command can be used to set first and second address (optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \def \@addressone {#1}
  }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{{\huge\bf \textcolor{HEAD}\@name}}\hfil
    \nameskip\break
  \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENT: Create the head of the document

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document                     % Begin document
  \printname                        % Print the name specified with \name
  \@ifundefined{@addressone}{}{     % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{     % Print the second address if specified
    \printaddress{\@addresstwo}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTIONS: Create section headings

% Used to create large resume section
\newenvironment{rSection}[1]{
  %\sectionskip
  {\bf \Large \color{HEAD}#1}
  \sectionlineskip
  \hrule
  \begin{list}{}{
    \setlength{\leftmargin}{0em}
  }
  \item[]
}{
  \end{list}
}

% Used to format job listing
\newenvironment{rSubsection}[5]{
  {\bf \large #1}                 \hfill           { #2}% Stop a space
  \ifthenelse{\equal{ #3}{}}{}{
  \\
  { \bf #3}                 \hfill                  { #4}\\% Stop a space
  { #5}
  }\smallskip
  % \cdot used for bullets, items non-indented
  \begin{list}{$\bullet$}{\leftmargin=1.5em}
  \itemsep -0.5em \vspace{-0.5em}
}{
  \end{list}
 % \vspace{0.5em}
}

\newenvironment{rSubsectionPromotion}[7]{
  {\bf \large #1}                 \hfill                  {    #2} \\% Stop a space
  { \bf #3}                 \hfill                  {    #4}% Stop a space
  \ifthenelse{\equal{#5}{}}{}{
  \\
  {#5}                 \hfill                  { #6} \\% Stop a space
  { #7}
  }\smallskip
  % \cdot used for bullets, items non-indented
  \begin{list}{$\bullet$}{\leftmargin=1.5em}
  \itemsep -0.5em \vspace{-0.5em}
}{
  \end{list}
 % \vspace{0.5em}
}

\def\namesize{\LARGE}
\def\nameskip{\medskip}
\def\addressskip{\smallskip}
\def\sectionskip{\bigskip}
\def\sectionlineskip{\smallskip}
