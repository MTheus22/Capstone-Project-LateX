\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idp-model}[2025/04/28 Classe para trabalhos Tech IDP]
\LoadClass[12pt, a4paper]{article}
\RequirePackage[a4paper, left=3cm, right=2cm, top=3cm, bottom=2cm]{geometry}

\RequirePackage{eso-pic}
\RequirePackage{graphicx}
\RequirePackage{wallpaper}
\RequirePackage{anyfontsize}
\RequirePackage{fontspec}
\setmainfont{Arial}
\RequirePackage{configs/idp-style}
\RequirePackage{etoolbox}
\RequirePackage{titlesec}
\RequirePackage{tikz}




\newcommand{\curso}[1]{\def\cursonome{#1}}
\newcommand{\titulo}[1]{\def\titulonome{#1}}
\newcommand{\aluno}[1]{\def\alunonome{#1}}
\newcommand{\ano}[1]{\def\anonome{#1}}



\newcommand{\capaprincipal}{
    \color{white}
    \begin{titlepage}


    \vspace*{8.5 cm}
    \begin{flushleft}
    {\Large\expandafter\MakeUppercase\expandafter{Bacharelado em}}\\
    {\huge\bf\expandafter\MakeUppercase\expandafter{\cursonome}}

    \vspace*{2.0 cm}
        \AddToShipoutPicture*{
    \put(0,0){
    \includegraphics[width=\paperwidth,height=\paperheight]{figuras/fundo_azul.png}
    }}
{\Large\bf\expandafter\MakeUppercase\expandafter{\titulonome}}

    
    \end{flushleft}
    \vspace*{6 cm}
    \begin{center}
    {\Large\bf\expandafter\MakeUppercase\expandafter{\alunonome}}
    \vfill
    {Brasília - DF, \anonome}
    
    \end{center}
    \end{titlepage}
    \color{black}
}


% Comando para a "página de abertura de seção"
\newcommand{\chapterbreak}[1]{%
    \clearpage
    \thispagestyle{empty}
        \AddToShipoutPicture*{
    \put(0,0){
    \includegraphics[width=\paperwidth,height=\paperheight]{figuras/fundo_azul.png}
    }}

    \color{white}

    \BgThispage
    \vspace*{\fill}
    \begin{center}
        {\fontsize{140}{}\bfseries #1}
    \end{center}
    \vspace*{\fill}
    \clearpage

    \color{black}
}

% Redefine \section para inserir a página anterior com o número
\pretocmd{\section}{%
  \stepcounter{section}%

  \chapterbreak{\thesection}%
   \addtocounter{section}{-1}
}{}{}