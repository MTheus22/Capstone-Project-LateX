\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idp-model}[2025/04/28 Classe para trabalhos Tech IDP]
\LoadClass[12pt, a4paper]{article}
\RequirePackage[a4paper, left=3cm, right=2cm, top=3cm, bottom=2cm,
headheight=1.8cm]{geometry}

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
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{setspace}

% \RequirePackage[backend=biber,style=abnt]{biblatex}
% \addbibresource{referencias.bib}

\RequirePackage[alf]{abntex2cite} % Usa o estilo ABNT
\bibliographystyle{abntex2-alf} % Estilo de bibliografia


\onehalfspacing


\RequirePackage{lipsum}

\definecolor{fundo_idp}{HTML}{005DAA}

\newcommand{\curso}[1]{\def\cursonome{#1}}
\newcommand{\titulo}[1]{\def\titulonome{#1}}
\newcommand{\aluno}[1]{\def\alunonome{#1}}
\newcommand{\ano}[1]{\def\anonome{#1}}


\fancypagestyle{paginas}{
    \fancyhf{}
   \fancyhead[L]{%
    \hspace*{-3cm} % Compensa a margem esquerda do geometry
    \includegraphics[width=\paperwidth]{configs/figuras/cabecalho.png}
  }%

  
\fancyfoot[C]{%
  \begin{tikzpicture}
    \filldraw[fill=fundo_idp, draw=fundo_idp] (0,0) circle (0.4cm);
    \node[text=white] at (0,0) {\thepage};
  \end{tikzpicture}%
}

   
    }

\pagestyle{paginas}




\newcommand{\capaprincipal}{
    \color{white}
    \begin{titlepage}


    \vspace*{8.5 cm}
    \begin{flushleft}
    {\Large\expandafter\MakeUppercase\expandafter{Bacharelado em}}\\
    {\huge\bf\expandafter\MakeUppercase\expandafter{\cursonome}}

    \vspace*{2.0 cm}
        \AddToShipoutPicture*{
    \put(-3,0){
    \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/capa_tcc.png}
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

\newcommand{\capafinal}{
\clearpage
\thispagestyle{empty}
 \vspace*{2.0 cm}
        \AddToShipoutPicture*{
    \put(-3,0){
    \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/capa_final.png}
    }}

\clearpage
}








% Comando para a "página de abertura de seção"
\newcommand{\chapterbreak}[1]{%
    \clearpage
    \thispagestyle{empty}
        \AddToShipoutPicture*{
    \put(-3,0){
    \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/secoes_internas2.png}
    }}

    \color{white}

    \BgThispage
    \vspace*{\fill}
    \begin{center}
        {\fontsize{400}{}\bfseries #1}
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


% % Comando interno para renderizar a seção estilizada
% \newcommand{\styledsection}[2]{%
%   \noindent
%   \hspace*{-3.5cm}
%   \begin{tikzpicture}
%     % Bloco azul claro com número grande
%     \fill[cyan!70!blue!60] (0,0) rectangle (4,4);
%     \node[white, font=\bfseries\fontsize{80}{80}\selectfont] at (2,2) {#1};
%   \end{tikzpicture}%
%   \hspace{1em}%
%   \begin{minipage}[t]{0.75\textwidth}
%     \vspace{-0.8cm}
%     {\color{cyan!70!blue!70}\Large\bfseries\MakeUppercase #2}\par\vspace{1ex}
%   \end{minipage}


%   %\vspace{2em}
% }

% % Redefine o comportamento de \section para usar o novo estilo
% \titleformat{\section}
%   [block]
%   {\normalfont}
%   {}
%   {0pt}
%   {
%     \styledsection{\thesection}
%   }

\newcounter{secnum}

\newcommand{\secao}[1]{%
  \refstepcounter{secnum}
  \chapterbreak{\arabic{secnum}}

  \noindent
  \hspace*{-3.5cm}
  \begin{tikzpicture}
    \fill[cyan!70!blue!60] (0,0) rectangle (4,4);
    \node[white, font=\bfseries\fontsize{80}{80}\selectfont] at (2,2) {\arabic{secnum}};
  \end{tikzpicture}%
  \hspace{1em}%
  \begin{minipage}[t]{0.75\textwidth}
    \vspace{-0.8cm}
    {\color{cyan!70!blue!70}\Large\bfseries\MakeUppercase #1}\par\vspace{1ex}
  \end{minipage}

  \vspace{2em}
}

