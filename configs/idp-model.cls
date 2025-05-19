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
\RequirePackage{etoolbox}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage{titletoc}
\RequirePackage{hyperref}
\RequirePackage[most]{tcolorbox}





% \RequirePackage[backend=biber,style=abnt]{biblatex}
% \addbibresource{referencias.bib}

\RequirePackage[alf]{abntex2cite} % Usa o estilo ABNT
\bibliographystyle{abntex2-alf} % Estilo de bibliografia

\RequirePackage[portuguese]{babel}

\onehalfspacing



\RequirePackage{lipsum}

\definecolor{fundo_idp}{HTML}{005DAA}
\definecolor{titulos}{HTML}{00B3FF}

\newcommand{\curso}[1]{\def\cursonome{#1}}
\newcommand{\titulo}[1]{\def\titulonome{#1}}
\newcommand{\aluno}[1]{\def\alunonome{#1}}
\newcommand{\ano}[1]{\def\anonome{#1}}

\newcommand{\@nomeorientador}{}
\newif\iforientadora
\newcommand{\orientador}[1]{
\orientadorafalse
\renewcommand{\@nomeorientador}{#1}}
\newcommand{\orientadora}[1]{
\renewcommand{\@nomeorientador}{#1}
\orientadoratrue}

\newcommand{\membrobancai}[2]{\def\@nomemembrobancai{#1}
\def\@funcaomembrobancai{#2}}
\newcommand{\membrobancaii}[2]{\def\@nomemembrobancaii{#1}
\def\@funcaomembrobancaii{#2}}

\newcommand{\dataaprovacao}[1]{\def\@dataaprovacao{#1}}

\newcommand{\palavraschave}[1]{\def\@palavraschave{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}

\fancyhf{} % Limpa os cabeçalhos e rodapés padrão
\renewcommand{\headrulewidth}{0pt} % Remove a linha do cabeçalho


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

\fancypagestyle{pretext}{
    \fancyhf{}
   \fancyhead[L]{%
    \hspace*{-3cm} % Compensa a margem esquerda do geometry
    \includegraphics[width=\paperwidth]{configs/figuras/cabecalho.png}
  }%
}

\tcbset{
  keywordsbox/.style={
    colback=blue!5,
    colframe=blue!5, % sem borda visível
    boxrule=0pt,
    arc=2pt,
    left=4pt,
    right=4pt,
    top=2pt,
    bottom=2pt,
    boxsep=4pt,
    before skip=10pt,
    after skip=10pt,
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
    \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/capa_tcc.pdf}
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

\newcommand{\folharosto}{
    \clearpage
    \thispagestyle{pretext}
    \begin{flushleft}
        {\Large\bfseries\color{fundo_idp}\MakeUppercase\alunonome}

        \vspace*{3cm}
        {\Large\color{fundo_idp}\MakeUppercase\titulonome}

        \vspace*{3cm}

        {Trabalho de Conclusão de Curso apresentado como requisito parcial para a obtenção de grau de Bacharel em \cursonome, pelo Instituto Brasileiro de Ensino, Desenvolvimento e Pesquisa (IDP).}

        \vspace*{3cm}

        {\bfseries\color{fundo_idp}
        \iforientadora Orientadora 
        \else Orientador
        \fi}\\
        {\@nomeorientador}

        \vspace*{3cm}
        {Brasília - DF, \anonome}
    \end{flushleft}
}

\newcommand{\folhaaprovacao}{
    \clearpage
    \thispagestyle{pretext}
    \begin{flushleft}
        {\Large\bfseries\color{fundo_idp}\MakeUppercase\alunonome}

        \vspace*{3cm}
        {\Large\color{fundo_idp}\MakeUppercase\titulonome}

        \vspace*{2cm}
 
        {Trabalho de Conclusão de Curso apresentado como requisito parcial para a obtenção de grau de Bacharel em \cursonome, pelo Instituto Brasileiro de Ensino, Desenvolvimento e Pesquisa (IDP).}

        \vspace*{2cm}
        {Aprovado em \@dataaprovacao}

        \vspace*{1cm}
        {\bfseries\color{fundo_idp}Banca Examinadora}
        
        
        {
        \vspace*{2cm}
        \rule{\linewidth}{0.4pt}
        \vspace{1em}
        {\@nomeorientador -  \iforientadora Orientadora 
        \else Orientador
        \fi}

        \vspace*{2cm}
        \rule{\linewidth}{0.4pt}
        \vspace{1em}
        {\@nomemembrobancai - \@funcaomembrobancai}
        
        \vspace*{2cm}
        \rule{\linewidth}{0.4pt}
        \vspace{1em}
        {\@nomemembrobancaii - \@funcaomembrobancaii}
        }
    \end{flushleft}
}
\newcommand{\agradecimentos}{
    \clearpage
     \begin{flushleft}
    {\Large\bfseries\color{fundo_idp}\MakeUppercase{Agradecimentos}}
    \end{flushleft}
    \vspace{1em}
    \input{partes/agradecimentos}
}

\newcommand{\dedicatoria}{
    \clearpage
     \begin{flushleft}
    {\Large\bfseries\color{fundo_idp}\MakeUppercase{Dedicatória}}
    \end{flushleft}
    \vspace{1em}
    \input{partes/dedicatoria}
}

\newcommand{\resumo}{
    \clearpage
     \begin{flushleft}
    {\Large\bfseries\color{fundo_idp}\MakeUppercase{Resumo}}
    \end{flushleft}
    \vspace{1em}
    \input{partes/resumo}
    \vspace{1em}
     \begin{tcolorbox}[keywordsbox]
     \begin{center}
        \color{fundo_idp}\textbf{Palavras-chave:} \color{fundo_idp}{\@palavraschave}.
    \end{center}
    \end{tcolorbox}
}

\renewcommand{\abstract}{
    \clearpage
     \begin{flushleft}
    {\Large\bfseries\color{fundo_idp}\MakeUppercase{Abstract}}
    \end{flushleft}
    \vspace{1em}
    \input{partes/abstract}
    \vspace{1em}
     \begin{tcolorbox}[keywordsbox]
        \begin{center}
        \color{fundo_idp}\textbf{Keywords:} \color{fundo_idp}{\@keywords}.
        \end{center}
    \end{tcolorbox}
    \clearpage
}


\newcommand{\capafinal}{
\clearpage
\thispagestyle{empty}
 \vspace*{2.0 cm}
        \AddToShipoutPicture*{
    \put(-3,0){
    \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/capa_final.pdf}
    }}

\clearpage
}


% Comando para a "página de abertura de seção" CORRIGIDO
\newcommand{\chapterbreak}[2]{%
    \clearpage
    \thispagestyle{empty}
    \AddToShipoutPicture*{
        \put(-3,0){
        \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/capa_secoes.pdf}
    }}
    \color{white}
    \vspace*{\fill}
    \begin{center}
        {\fontsize{400}{480}\bfseries #1}
    \end{center}
    \vspace*{\fill}
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{\protect\numberline{#1}#2} % CORREÇÃO PRINCIPAL
    \color{black}
}

\newcounter{secnum}

\newcommand{\secao}[2]{%
  \refstepcounter{secnum}%
  \chapterbreak{\arabic{secnum}}{#1}%
  
  \noindent
  \hspace*{-3.5cm}
  \begin{tikzpicture}
    \fill[cyan!70!blue!60] (0,0) rectangle (4,4);
    \node[white, font=\bfseries\fontsize{80}{80}\selectfont] at (2,2) {\arabic{secnum}};
  \end{tikzpicture}%
  \hspace{1em}%
  \begin{minipage}[t]{0.75\textwidth}
    \vspace{-0.8cm}
    {\color{titulos}\huge\bfseries\MakeUppercase{#1}}\par\vspace{1ex} % Adicionei {} aqui
  \end{minipage}
  \vspace{2em}


  \input{#2}
}

%%-------SUBSECOES--------------%%
\newcounter{subsecnum}[secnum]
\renewcommand{\thesubsecnum}{\arabic{secnum}.\arabic{subsecnum}}

\newcommand{\subsecao}[1]{%
  \refstepcounter{subsecnum}
  \par\vspace{1.5ex}

      \phantomsection
      \addcontentsline{toc}{subsection}{\arabic{secnum}.\arabic{subsecnum} #1} % <-- Adiciona ao sumário

  {\large\noindent\color{fundo_idp}\bfseries\MakeUppercase{\thesubsecnum\quad #1}}\par
  \vspace{1ex}
}


% Define o contador de subsubseções
\newcounter{subsubsecnum}[subsecnum]
\renewcommand{\thesubsubsecnum}{\arabic{secnum}.\arabic{subsecnum}.\arabic{subsubsecnum}}

% Define o comando para subsubseções
\newcommand{\subsubsecao}[1]{%
  \refstepcounter{subsubsecnum}
  \par\vspace{1.2ex}
  \phantomsection
  \addcontentsline{toc}{subsubsection}{\thesubsubsecnum #1} % <-- Adiciona ao sumário

  {\normalsize\noindent\color{fundo_idp}\bfseries\thesubsubsecnum\quad #1}\par
  \vspace{0.5ex}
}


% REFERENCIAS
\newcommand{\capareferencias}{
    \clearpage
    \thispagestyle{empty}
    \AddToShipoutPicture*{
        \put(-3,0){
            \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/capa_secoes.pdf}
        }
    }
     \color{white}

    \vspace*{\fill}
    \begin{center}

    {\fontsize{60}{0}\bfseries\MakeUppercase{Referências}}
    \end{center}
    \vspace*{\fill}

    \refstepcounter{secnum}
    \phantomsection
    \addcontentsline{toc}{section}{Referências}

    \color{black}
    
    \null
    \clearpage
}

\newcommand{\referencias}{
    \capareferencias
    \bibliography{referencias} % Nome do arquivo .bib
}

\addto\captionsportuguese{
  \renewcommand{\refname}{%
    \color{titulos}\bfseries\MakeUppercase{Referências}
  }
}

% SUMÁRIO
% Altera o título do sumário
\addto\captionsportuguese{%
  \renewcommand{\contentsname}{\color{white}\fontsize{40}{0}\bfseries\MakeUppercase{Sumário}}
}

\addto\captionsportuguese{%
  \renewcommand{\listfigurename}{\color{white}\fontsize{40}{0}\bfseries\MakeUppercase{Lista de Figuras}}
  \renewcommand{\listtablename}{\color{white}\fontsize{40}{0}\bfseries\MakeUppercase{Lista de Tabelas}}
}



% Estilo dos itens da lista de figuras
\titlecontents{figure}[0pt]
{\vspace{0.5ex}\bfseries\large\color{white}}
{\contentslabel{2em}}
{}
{\titlerule*[0.5pc]{.}\contentspage}

% Estilo dos itens da lista de tabelas
\titlecontents{table}[0pt]
{\vspace{0.5ex}\bfseries\large\color{white}}
{\contentslabel{2em}}
{}
{\titlerule*[0.5pc]{.}\contentspage}

% Estilo do sumário
\titlecontents{section}[0pt]
{\vspace{0.5ex}\bfseries\large\color{white}}
{\contentslabel{2em}}
{}
{\titlerule*[0.5pc]{.}\contentspage}



\titlecontents{subsection}[2em]
{\vspace{0.3ex}\normalsize\color{white}}
{\contentslabel{2.3em}}
{}
{\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsubsection}
  [4.5em] % Indentação ainda maior
  {\color{white}\addvspace{2pt}\small\itshape} % Formatação diferenciada
  {\contentslabel{3em}} % Número
  {} % Sem prefixo
  {\titlerule*[.5pc]{.}\contentspage} % Página

\newcommand{\backgroundsumario}{%
    \AddToShipoutPictureBG*{%
        \put(0,0){%
            \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/capa_secoes.pdf}%
        }%
    }%
}



\makeatletter
\renewcommand\tableofcontents{%
    \cleardoublepage
    \backgroundsumario % Ativa o fundo apenas nesta página
    \thispagestyle{empty} % Remove cabeçalhos e rodapés
    \section*{\contentsname} % Título do sumário
    \@starttoc{toc} % Conteúdo do sumário
    \ClearShipoutPictureBG % Remove o fundo das páginas seguintes
}
\makeatother

\makeatletter
\renewcommand\listoffigures{%
    \cleardoublepage
    \backgroundsumario
    \thispagestyle{empty}
    \section*{\listfigurename}
    \@starttoc{lof}
    \ClearShipoutPictureBG
}

\renewcommand\listoftables{%
    \cleardoublepage
    \backgroundsumario
    \thispagestyle{empty}
    \section*{\listtablename}
    \@starttoc{lot}
    \ClearShipoutPictureBG
}
\makeatother

% APENDICE
\newcommand{\capaapendice}[1]{
    \clearpage
    \thispagestyle{empty}
    \AddToShipoutPicture*{
        \put(-3,0){
            \includegraphics[width=\paperwidth,height=\paperheight]{configs/figuras/capa_secoes.pdf}
        }
    }
     \color{white}

    \vspace*{\fill}
    \begin{center}

    {\fontsize{60}{0}\bfseries\MakeUppercase{#1}}
    \end{center}
    \vspace*{\fill}

    \refstepcounter{secnum}
    \phantomsection
    \addcontentsline{toc}{section}{#1}

    \color{black}
    
    \null
    \clearpage
}


\newcounter{apendicecount}
\setcounter{apendicecount}{0}%

\newcommand{\apendice}[2]{
        \clearpage
        \stepcounter{apendicecount}%
        \ifnum\value{apendicecount}=1
        \capaapendice{Apêndices}
        \fi
        \phantomsection
        \addcontentsline{toc}{subsection}{\MakeUppercase{\alph{apendicecount}}\quad #1}
        \begin{flushleft}
        {\color{fundo_idp}\Large\bfseries\MakeUppercase{Apêndice \alph{apendicecount}}} \\
        \vspace*{1em}
        {\color{fundo_idp}\Large\bfseries\MakeUppercase{#1}} \\
        \end{flushleft}
        
        \input{#2}
}

%% Anexos


\newcounter{anexocount}
\setcounter{anexocount}{0}%

\newcommand{\anexo}[2]{
        \clearpage
        \stepcounter{anexocount}%
        \ifnum\value{anexocount}=1
        \capaapendice{Anexos}
        \fi
        \phantomsection
        \addcontentsline{toc}{subsection}{\MakeUppercase{\alph{anexocount}}\quad #1}
        \begin{flushleft}
        {\color{fundo_idp}\Large\bfseries\MakeUppercase{Anexo \alph{anexocount}}} \\
        \vspace*{1em}
        {\color{fundo_idp}\Large\bfseries\MakeUppercase{#1}} \\
        \end{flushleft}
        
        \input{#2}
}


