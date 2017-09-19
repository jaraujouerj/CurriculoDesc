\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{ementa}[2017/05/01 Ementa Engenharia UERJ]
\LoadClass[12pt,a4paper]{article}

\RequirePackage{calc} %serve para fazer certas contas simples
\RequirePackage[left=2.75cm,right=1.85cm,top=1.35cm,marginparwidth=3.4cm]{geometry} % Adjust page margins
\RequirePackage{tabularx} % Ambiente de tabelas
\RequirePackage{fancyhdr} % Required to customize headers

\setlength{\headheight}{80pt} % Increase the size of the header to accommodate meta-information
\pagestyle{fancy}\fancyhf{} % Use the custom header specified below
\renewcommand{\headrulewidth}{0pt} % Remove the default horizontal rule under the header

\RequirePackage[utf8]{inputenc}
\RequirePackage[portuguese]{babel}

\RequirePackage[defernumbers=true, backend=biber, sorting=none]{biblatex} %bibliografia

\nocite{*} %Não coloca a palavra bibliografia
\bibliography{bibliografia}{}

\RequirePackage{ifthen}

\makeatletter
\renewcommand\@cite[2]{%
  Ref.~#1\ifthenelse{\boolean{@tempswa}}
    {, \nolinebreak[3] #2}{}
}
\renewcommand\@biblabel[1]{#1.}
\makeatother

\RequirePackage{tikz}
\include{disciplinasDB}
\tikzset{
    %Define standard arrow tip
	>=stealth,
    %Define style for boxes
    linha/.style={
    	rectangle,
    	draw=none,
    	minimum width=16.5cm,
    	text width=16.5cm,
    	minimum height=0.755cm,
        append after command={
        	(\tikzlastnode.north west)edge[ultra thin](\tikzlastnode.north east)
        	(\tikzlastnode.north east)edge[ultra thin](\tikzlastnode.south east)
        	(\tikzlastnode.north west)edge[ultra thin](\tikzlastnode.south west)},
        font=\scriptsize},
	linha2/.style={
		rectangle,
		draw=none,
		text width=10cm,
		minimum height=0.755cm,
        ultra thin,
        font=\footnotesize},
	linhafinal/.style={
		rectangle,
		draw=black,
		text width=16.515cm,
		minimum height=0.755cm,
		ultra thin,
		font=\scriptsize},
    % Define arrow style
    pil/.style={},
    label/.style={
                      text width=16cm,
                      draw=none,
                      font=\scriptsize},
    label2/.style={
                      text width=16cm,
                      font=\small},
    label3/.style={
    	text width=16cm,
    	draw=none,
    	append after command={
    		(\tikzlastnode.north west)edge[ultra thin](\tikzlastnode.north east)
    		(\tikzlastnode.north east)edge[ultra thin](\tikzlastnode.south east)
    		(\tikzlastnode.north west)edge[ultra thin](\tikzlastnode.south west)},
    		font=\scriptsize},
    label4/.style={
    	minimum width=5.051cm,
    	text width=4.77cm,
    	draw=none,
    	append after command={
    		(\tikzlastnode.north west)edge[ultra thin](\tikzlastnode.north east)
    		(\tikzlastnode.north west)edge[ultra thin](\tikzlastnode.south west)},
    		font=\scriptsize},
}
\tikzstyle{basico}=[linha]
\tikzstyle{boxmodalidade}=[linha, text height=0.77cm]
\tikzstyle{campo}=[linha, font=\Large, align=center]
\tikzstyle{box}=[draw=black, minimum width=6.1mm, minimum height=6.1mm, font=\LARGE]
\usetikzlibrary{positioning,shapes,shadows,arrows,calc}
\setlength{\parindent}{0cm} % Remove paragraph indentation

%----------------------------------------------------------------------------------------
%	HEADER INFORMATION
%----------------------------------------------------------------------------------------

\renewcommand*{\familydefault}{\sfdefault}
\lhead{
\raisebox{-0.3\height}{\includegraphics[height=20.1mm,keepaspectratio]{imagens/subreitoria}}}
\chead{\hspace{0.9mm}\raisebox{1mm} {UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO}\\[5pt]
		FORMULÁRIO DE IDENTIFICAÇÃO DE DISCIPLINA}
\rhead{\raisebox{-0.28\height}{\includegraphics[height=19.5mm,keepaspectratio]{imagens/dep1}}}

\newcommand*{\tamlin}{0.81cm}%
\newcommand*{\xsepara}{1mm}%
\newcommand*{\paddingsup}{-79mm}
\newcommand*{\gap}{0mm}%
\newcommand{\cursowidth}{11.435cm}

\def \boxlabel [#1]#2#3{\node%PRESENCIAL BOX
						[box,  #1] 
						(boxpres)
						{#3};				
					\node[right =1mm of boxpres, text width=4cm, font=\scriptsize] 
					(pres)
					{\textbf{#2}};}

\newcommand \curso[1] {%
  \ifx&#1&%
   \newcommand \icurso {}%
  \else
   \newcommand \icurso{#1}%
  \fi}

\newcommand \naoobrigatoria	{
  \newcommand{\obrigatoria}{}%
} %disciplina é obrigatória? 
		
\newcommand{\alteracao}{%
   \newcommand{\ialteracao}{x}%
 }

\newcommand \aprovadofrequencia	{
  \newcommand{\frequencia}{x}%
} %Se aprovação for por frequência, marcar x.


\newcommand \eletivadefinida[1] {%
  \newcommand{\idefinida}{x}%
  \ifx&#1&%
   \newcommand \icursodefinida {ERRO}%
  \else
   \newcommand \icursodefinida {#1}%
  \fi}

\newcommand \eletivarestrita[1] {%
  \newcommand{\irestrita}{x}%
  \ifx&#1&%
   \newcommand \icursorestrita {Engenharia de Computação}%
  \else
   \newcommand \icursorestrita {#1}%
  \fi}

\newcommand {\semipresencial}{%
   \newcommand{\isemipresencial}{x}%
}

\newcommand \adistancia{%
   \newcommand{\iadistancia}{x}%
}

\newcommand \permiteempreparo	{
	\newcommand \empreparosim{x} % Permite situação em preparo?
}

\newcommand \naopermitemaisdeumdocente	{
	\newcommand \maisdeumdocentenao	{x} %Permite mais de um docente? nao
}

\newcommand \permitehorarioincompleto	{
	\newcommand \horarioincompletosim	{x} %Permite
}

\newcommand \permiteconcomitancia	{
	\newcommand \concomitanciasim	{x} %Permite
}

\newcommand \disciplinaisolada	{
	\newcommand \isoladasim	{x} %Permite
}

\newcommand \travadecreditos[1]{
	\newcommand \itravadecreditos{#1} %Permite
}

\newcommand\ndisciplina[1]{%
  \ifx&#1&%
   \newcommand \indisciplina {0}%
  \else
   \newcommand \indisciplina {#1}%
  \fi}

\newcommand\codigo[1]{%
  \ifx&#1&%
   \newcommand \icodigo {FEN06-XXXXX}%
  \else
   \newcommand \icodigo {#1}%
  \fi}

\newcommand\nomeprofessor[1]{%
  \ifx&#1&%
   \newcommand \inomeprofessor {}%
  \else
   \newcommand \inomeprofessor {#1}%
  \fi}

\newcommand\matriculaprofessor[1]{%
  \ifx&#1&%
   \newcommand \imatriculaprofessor {0}%
  \else
   \newcommand \imatriculaprofessor {#1}%
  \fi}

\newcommand\preum[1]{%
  \ifx&#1&%
   \newcommand \ipreum {0}%
  \else
   \newcommand \ipreum {#1}%
  \fi}
\newcommand\codpreum[1]{%
  \ifx&#1&%
   \newcommand \icodpreum {0}%
  \else
   \newcommand \icodpreum {#1}%
  \fi}

\newcommand\predois[1]{%
  \ifx&#1&%
   \newcommand \ipredois {0}%
  \else
   \newcommand \ipredois {#1}%
  \fi}

\newcommand\codpredois[1]{%
  \ifx&#1&%
   \newcommand \icodpredois {0}%
  \else
   \newcommand \icodpredois {#1}%
  \fi}

\newcommand\objetivos[1]{%
  \ifx&#1&%
   \newcommand \iobjetivos {}%
  \else
   \newcommand \iobjetivos {#1}%
  \fi}

\newcommand\ementa[1]{%
  \ifx&#1&%
   \newcommand \iementa {}%
  \else
   \newcommand \iementa {#1}%
  \fi}

\newcommand\credteorica[1]{%
  \ifx&#1&%
   \newcommand \crteorica {0}%
  \else
   \newcommand \crteorica {#1}%
  \fi}

\newcommand\credpratica[1]{%
  \ifx&#1&%
   \newcommand \crpratica {0}%
  \else
   \newcommand \crpratica {#1}%
  \fi}

\newcommand\credlab[1]{%
  \ifx&#1&%
   \newcommand \crlab {0}%
  \else
   \newcommand \crlab {#1}%
  \fi}

\newcommand\credestagio[1]{%
  \ifx&#1&%
   \newcommand \crestagio {0}%
  \else
   \newcommand \crestagio {#1}%
  \fi}

\newcommand\chta[1]{%carga horária total aluno
  \ifx&#1&%
   \newcommand \ichta {0}%
  \else
   \newcommand \ichta {#1}%
  \fi}

\newcommand\chtp[1]{%carga horária total professor
  \ifx&#1&%
   \newcommand \ichtp {0}%
  \else
   \newcommand \ichtp {#1}%
  \fi}

%inicio defaults*******************************************

\newcommand \euniversal	{}%disciplina é eletiva universal? marcar x
\newcommand \cursouniversal{}

%fim defaults

\newcommand*{\formementa}[1]{
\headsep = 1pt
%contadores
\newcounter{numcr}
\newcounter{chteoricatotal}
\newcounter{chprattotal}
\newcounter{chlabtotal}
\newcounter{chlabsemanal}
\newcounter{chpratsemanal}
\newcounter{chestagiototal}
\newcounter{chestagiosemanal}
\newcounter{chtotalsemanal}
\newcounter{chtotal}

\ifx\ialteracao\undefined
  \newcommand{\icriacao}{x}
  \newcommand{\ialteracao}{}
\else
  \newcommand{\icriacao}{}
\fi

\ifx\isemipresencial\undefined
  \ifx\iadistancia\undefined
    \newcommand{\ipresencial}{x}
    \newcommand{\isemipresencial}{}
    \newcommand{\iadistancia}{}
  \else
    \newcommand{\ipresencial}{}
    \newcommand{\isemipresencial}{}
   \fi
\else %curso semipresencial
    \newcommand{\ipresencial}{}
    \newcommand{\iadistancia}{}
\fi

\ifx\frequencia\undefined
  \newcommand{\frequencia}{}
  \newcommand{\frequenciaenota}{x}
\else
  \newcommand{\frequenciaenota}{}
\fi

\ifx\horarioincompletosim\undefined
  \newcommand{\horarioincompletosim}{}
  \newcommand{\horarioincompletonao}{x}
\else
  \newcommand{\horarioincompletonao}{}
\fi

\ifx\concomitanciasim\undefined
  \newcommand{\concomitanciasim}{}
  \newcommand{\concomitancianao}{x}
\else
  \newcommand{\concomitancianao}{}
\fi

\ifx\empreparosim\undefined
  \newcommand{\empreparonao}{x}
  \newcommand{\empreparosim}{}
\else
  \newcommand{\empreparonao}{}
\fi

\ifx\maisdeumdocentenao\undefined
  \newcommand{\maisdeumdocentenao}{}
  \newcommand{\maisdeumdocentesim}{x}
\else
  \newcommand{\maisdeumdocentesim}{}
\fi

\ifx\isoladasim\undefined
  \newcommand{\isoladasim}{}
  \newcommand{\isoladanao}{x}
\else
  \newcommand{\isoladanao}{}
\fi



\ifx\icursodefinida\undefined
  \newcommand{\icursodefinida}{}
  \ifx\idefinida\undefined
   \newcommand{\idefinida}{}
  \fi
\fi


\ifx\irestrita\undefined
  \newcommand{\irestrita}{}
\fi

\ifx\icursorestrita\undefined
  \newcommand{\icursorestrita}{}
\fi

\ifx\itravadecreditos\undefined
  \newcommand{\itravadecreditos}{}
\fi

\ifx\obrigatoria\undefined
  \newcommand{\obrigatoria}{x}
  \ifx\icurso\undefined
     \newcommand{\icurso}{\small Engenharia de Computação}
  \fi
\else
  \newcommand{\icurso}{}
\fi



\ifx \crpratica \undefined
  \newcommand \crpratica {0}
\fi

\ifx \crteorica \undefined
  \newcommand \crteorica {0}
\fi

\ifx \crlab \undefined
  \newcommand \crlab {0}
\fi

\ifx \crestagio \undefined
  \newcommand \crestagio {0}
\fi

\ifx \indisciplina \undefined
  \newcommand \indisciplina {}
\fi

\ifx \icodigo \undefined
  \newcommand \icodigo {FEN 06-XXXXX}
\fi

\ifx \ipreum \undefined
  \newcommand \ipreum {}
  \newcommand \icodpreum {}
\else 
  \ifx \icodpreum \undefined
    \newcommand \icodpreum {}
  \fi
\fi

\ifx \ipredois \undefined
  \newcommand \ipredois {}
  \newcommand \icodpredois {}
\else 
  \ifx \icodpredois \undefined
    \newcommand \icodpredois {}
  \fi
\fi


\ifx \iobjetivos \undefined
  \newcommand \iobjetivos {}
\fi

\ifx \iementa \undefined
  \newcommand \iementa {}
\fi

\ifx \inomeprofessor \undefined
  \newcommand \inomeprofessor {}
\fi

\ifx \imatriculaprofessor \undefined
  \newcommand \imatriculaprofessor {}
\fi

\ifx \ichta \undefined
  \newcommand \ichta {}
\fi

\ifx \ichtp \undefined
  \newcommand \ichtp {\ichta}
\fi

\setcounter		{numcr}{0}

\addtocounter		{numcr}{\crteorica}
\addtocounter		{numcr}{\crlab}
\addtocounter		{numcr}{\crestagio}
\addtocounter		{numcr}{\crpratica}

\setcounter		{chteoricatotal}{15*\crteorica}

\setcounter		{chlabtotal}{30*\crlab}
\setcounter		{chestagiototal}{30*\crestagio}
\setcounter		{chprattotal}{30*\crpratica}

\setcounter		{chlabsemanal}{2*\crlab}
\setcounter		{chpratsemanal}{2*\crpratica}

\setcounter		{chestagiosemanal}{2*\crestagio}

\setcounter		{chtotalsemanal}{0}
\setcounter		{chtotalsemanal}{2*\crlab}
\addtocounter		{chtotalsemanal}{2*\crestagio}
\addtocounter		{chtotalsemanal}{2*\crpratica}
\addtocounter		{chtotalsemanal}{\crteorica}

\setcounter		{chtotal}{0}
\setcounter		{chtotal}{\the\value{chprattotal}+\the\value{chestagiototal}+\the\value{chlabtotal}+\the\value{chteoricatotal}}
\flushleft
\begin{tikzpicture}
%  UNIDADE
\node at (0mm,0mm)
	[basico] 
	(unidade)
	{};
\node 
	[box, above left=3mm and -48mm of unidade] 
	(boxcriacao)
	{\icriacao};
\node %box CRIAÇÃO
	[right =3mm of boxcriacao, text width=1.5cm] 
	(criacao)
	{CRIAÇÃO};
\node %BOX ALTERAÇÃO
	[box, right=14mm of criacao] 
	(boxaltera)
	{\ialteracao};
\node 
	[right =1mm of boxaltera, text width=1.5cm] 
	(criacao)
	{ALTERAÇÃO};

\node %UNIDADE
	[label, below left =\xsepara and \paddingsup of unidade.north ] 
	(unidadelabel)
	{\textbf{UNIDADE:} 
	{\small Faculdade de Engenharia}};

\node %DEPARTAMENTO
	[basico, below=\gap of unidade] (depto){};
\node 
	[label, below left =\xsepara and \paddingsup of depto.north] 
	(deptolabel)
	{\textbf{DEPARTAMENTO:} 
	{\small Engenharia de Sistemas e Computação}};

\node %DISCIPLINA
	[basico, below=\gap of depto] (disciplina){};
\node 
	[label, below left =\xsepara and \paddingsup   of disciplina.north] 
	(discilabel)
	{\textbf{DISCIPLINA:}  
	{\small \indisciplina}};

\node %MODALIDADE DE ENSINO
	[boxmodalidade,below=\gap of disciplina] 
	(modalidade)
	{};
\node 
	[below left =2.2mm and 43mm of modalidade.north,font=\scriptsize] 
	(discilabel)
	{\textbf{MODALIDADE DE ENSINO:} };

\boxlabel[right=5mm  of discilabel]{PRESENCIAL}{\ipresencial}
\boxlabel[right=37mm  of discilabel]{SEMIPRESENCIAL}{\isemipresencial}
\boxlabel[right=78mm  of discilabel]{A DISTÂNCIA}{\iadistancia}

\node %
	[basico, below=\gap of modalidade, minimum height=1.9cm, font=\scriptsize] (#1big){};

\node [label={Label}, below right = 2mm and 14.8mm of #1big.north west] 
	{\textbf{ALUNO}};
\node [label={Label}, below right = 11mm and 15.8mm of #1big.north west] 
	{\Large \ichta};
	\node [label={Label}, below right = 2mm and 30.2mm of #1big.north west] 
	{\textbf{PROFESSOR}};
\node [label={Label}, below right = 11mm and 34.2mm of #1big.north west] 
	{\Large \ichtp};
\node [label={Label}, below right = 2mm and 52mm of #1big.north west] 
	{\textbf{CRÉDITOS:}};
\node [label={Label}, below right = 8mm and 67mm of #1big.north west] 
	{\Large \the\value{numcr}};
\node [label={Label}, below right = 2mm and 95.4mm of #1big.north west] 
	{\textbf{CÓDIGO:}};
\node [label={Label}, below right = 7.9mm and 95.4mm of #1big.north west] 
	{\large \icodigo};
\path ($(#1big.south west) + (13mm,0mm) $)edge [ultra thin]
	($ (#1big.north west) + (13mm,0mm) $);
	
\path ($(#1big.south west) + (30.4mm,0mm) $)
	edge [ultra thin]
	($ (#1big.north west) + (30.4mm,0mm) $);
	
\path ($(#1big.south west) + (50.6mm,0mm) $)
	edge [ultra thin] 
	($ (#1big.north west) + (50.6mm,0mm) $);
\path ($(#1big.south west) + (94mm,0mm) $)
	edge [ultra thin] 
	($ (#1big.north west) + (94mm,0mm) $);
	
\path ($(#1big.north west) + (13mm,-9mm) $)
	edge [ultra thin] 
	($ (#1big.north west) + (50.6mm,-9mm) $);
\node [label,below right =3mm and -0.3mm of #1big.north west, text width=1.2cm, draw=none] 
	(chlabel2)
	{\textbf{CH\\TOTAL} };
	
\node %STATUS
	[label4,align=flush left, below right=0mm and 0mm of #1big.south west, minimum height=\tamlin, fill=gray!20] 
	(status)
	{\textbf{STATUS}};

\node %CURSO(S) / HABILITAÇÃO(ÕES) / ÊNFASE(S)
	[label3,align=flush left, right=0mm  of status, text width=\cursowidth, minimum height=\tamlin, fill=gray!20] 
	(cursos)
	{\textbf{CURSO(S) / HABILITAÇÃO(ÕES) / ÊNFASE(S):}};


\node %OBRIGATÓRIA
	[label4, below =\gap  of status, text width=4.764cm, minimum height=\tamlin] 
	(obrig)
	{};

\node 
	[label3,align=flush left, below =\gap  of cursos, text width=\cursowidth, minimum height=\tamlin] 
	(obrig2)
	{\icurso};

\node 
	[label4, below =\gap  of obrig, text width=4.764cm, minimum height=\tamlin] 
	(restrita)
	{};

\node 
	[label3,align=flush left, below =\gap  of obrig2, text width=\cursowidth, minimum height=\tamlin] 
	(restrita2)
	{\small \icursorestrita};
\node 
	[label4, below =0mm  of restrita, text width=4.764cm, minimum height=\tamlin,] 
	(definida)
	{};
\node 
	[label3,align=flush left, below =0mm  of restrita2, text width=\cursowidth, minimum height=\tamlin] 
	(definida2)
	{\small \icursodefinida};

\node 
	[label4, below =\gap  of definida, text width=4.764cm, minimum height=\tamlin] 
	(universal)
	{};
\node 
	[label3, below =\gap  of definida2, text width=\cursowidth, minimum height=\tamlin] 
	(universal2)
	{\small \cursouniversal};

\boxlabel[below left=1mm and -10mm of obrig.north west]{OBRIGATÓRIA}{\obrigatoria}
\boxlabel[below left=1mm and -10mm of restrita.north west]{ELETIVA RESTRITA}{\irestrita}
\boxlabel[below left=1mm and -10mm of definida.north west]{ELETIVA DEFINIDA}{\idefinida}
\boxlabel[below left=1mm and -10mm of universal.north west]{ELETIVA UNIVERSAL}{\euniversal}

\node 
	[linhafinal, below right =\gap and -0.02mm  of universal.south west,  minimum height=\tamlin] 
	(aprova)
	{};

\node 
	[below left =1.4mm and 48mm   of aprova.north,font=\scriptsize,] 
	(discmoda)
	{\textbf{TIPO DE APROVAÇÃO:} };
	
\boxlabel[right=3mm  of discmoda]{FREQUÊNCIA}{\frequencia}
\boxlabel[right=40mm  of discmoda]{FREQUÊNCIA E NOTA}{\frequenciaenota}

%\node [box,  right=3mm  of discmoda] (boxpres){\frequencia};
%\node [  right =2mm of boxpres, text width=0.5cm, font=\scriptsize] (pres){\textbf{FREQUÊNCIA}};
%
%\node [box, right=15mm of pres] (boxsp){\frequenciaenota};
%\node [  right =1mm of boxsp, text width=4cm, font=\scriptsize] (fn){\textbf{FREQUÊNCIA E NOTA}};

\end{tikzpicture}

\vspace{-2.5mm}
\scriptsize 
\renewcommand{\arraystretch}{1.5}
\begin{center}
\textbf{QUADRO DE DISTRIBUIÇÃO DE CARGA HORÁRIA / CRÉDITO}
\begin{tabular}{|l|c|c|c|}
\hline
\textbf{TIPO DE AULA} & \textbf{CRÉDITO} & \textbf{CH SEMANAL} & \textbf{CH TOTAL} \\
\hline
TEÓRICA & \crteorica & \crteorica h & \the\value{chteoricatotal}h \\
\hline
PRÁTICA / Trab. Campo & \crpratica & \the\value{chpratsemanal}h & \the\value{chprattotal}h \\
\hline
LABORATÓRIO & \crlab & \the\value{chlabsemanal}h  & \the\value{chlabtotal}h \\
\hline
ESTÁGIO & \crestagio & \the\value{chestagiosemanal}h & \the\value{chestagiototal}h \\
\hline
\textbf{TOTAL} & \the\value{numcr} & \the\value{chtotalsemanal}h & \the\value{chtotal}h \\
\hline
\end{tabular}
\vspace{1.5mm}
\end{center}

\def\tamanholinha{16.8cm}
\renewcommand{\arraystretch}{2.6}
\begin{tabularx}{\tamanholinha}{ |X| }
  \hline
  \textbf{OBJETIVOS:} {\small \iobjetivos} \\
  \hline
  \textbf{EMENTA:} {\small \iementa}  \\
  \hline
\end{tabularx}
\vspace{2mm}

\begin{tabularx}{\tamanholinha}{ |X|X| }
  \hline
  \textbf{PRÉ-REQUISITO 1:} {\small \ipreum}& \textbf{CÓDIGO:} {\small \icodpreum}\\
  \hline
  \textbf{PRÉ-REQUISITO 2:} {\small \ipredois}& \textbf{CÓDIGO:} {\small \icodpredois}\\
  \hline
  \textbf{CÓ-REQUISITO:}& \textbf{CÓDIGO:} \\
  \hline
  \textbf{PRÉ-CÓ-REQUISITO:}& \textbf{CÓDIGO:} \\
  \hline
  \textbf{TRAVA DE CRÉDITOS:} {{\large \itravadecreditos} } \\
  \hline
  \textbf{DISCIPLINA(S) CORRESPONDENTE(S):}& \textbf{CÓDIGO(S):} \\
  \hline
\end{tabularx}

\vspace{2mm}
\begin{tabularx}{\tamanholinha}{ |X| }
  \hline
  \textbf{BIBLIOGRAFIA:} { \printbibliography[heading=none, resetnumbers=true, keyword=#1, notsubtype=ref]
  \small \printbibliography[title={\small Referências}, keyword=#1, subtype=ref]
  }\\
  
  \hline
\end{tabularx}
\vspace{2mm}

\begin{center}
\penalty -1000
\fontfamily{phv}\selectfont\normalsize
  SITUAÇÕES ESPECIAIS\\
  \vspace{4pt}

\begin{figure}[ht]
\begin{tikzpicture}
\node [linhafinal,  minimum height=\tamlin, very thin] (aprova){};
\node [below right=1mm and 0mm  of aprova.north west,font=\scriptsize] (discmoda){\textbf{PERMITE SITUAÇÃO ``EM PREPARO'' DE ACORDO COM A DELIBERAÇÃO 27/03:} };
\node [box,  below right=1mm and 120mm  of aprova.north west] (boxpres){\empreparosim};
\node [  right =2mm of boxpres, text width=0.5cm, font=\scriptsize] (pres){\textbf{SIM}};
\node [box, right=10mm of pres] (boxsp){\empreparonao};
\node [  right =1mm of boxsp, text width=3cm, font=\scriptsize] (fn){\textbf{NÃO}};
\end{tikzpicture}
\end{figure}
\vspace{4pt}

\begin{figure}[ht]
\begin{tikzpicture}
\node [linhafinal, minimum height=\tamlin, very thin] (aprova3){};
\node [below right=1.5mm and 0mm  of aprova3.north west,font=\scriptsize] (discmoda){\textbf{PERMITE MAIS DE UM DOCENTE:} };
\node [box,  below right=1mm and 120mm  of aprova3.north west] (boxpres){\maisdeumdocentesim};
\node [  right =2mm of boxpres, text width=0.5cm, font=\scriptsize] (pres){\textbf{SIM}};
\node [box, right=10mm of pres] (boxsp){\maisdeumdocentenao};
\node [  right =1mm of boxsp, text width=3cm, font=\scriptsize] (fn){\textbf{NÃO}};
\end{tikzpicture}
\end{figure}
\vspace{4pt}
\begin{figure}[!ht]
\begin{tikzpicture}
\node [linhafinal, minimum height=\tamlin, very thin,, minimum height=11mm] (aprova3){};
\node [below right=1mm and 0mm  of aprova3.north west,font=\scriptsize, text width=7cm] (discmoda){\textbf{PERMITE HORÁRIOS INCOMPLETOS NO PT: (TUTORIA OU ORIENTAÇÃO)} };
\node [box,  below right=2mm and 120mm  of aprova3.north west] (boxpres){\horarioincompletosim};
\node [  right =2mm of boxpres, text width=0.5cm, font=\scriptsize] (pres){\textbf{SIM}};
\node [box, right=10mm of pres] (boxsp){\horarioincompletonao};
\node [  right =1mm of boxsp, text width=3cm, font=\scriptsize] (fn){\textbf{NÃO}};
\end{tikzpicture}
\end{figure}

\begin{figure}[!ht]
\begin{tikzpicture}
\node [linhafinal, minimum height=\tamlin, very thin] (aprova3){};
\node [below right=1mm and 0mm  of aprova3.north west,font=\scriptsize] (discmoda){\textbf{CONCOMITÂNCIA DE HORÁRIOS:} };
\node [box,  below right=1mm and 120mm  of aprova3.north west] (boxpres){\concomitanciasim};
\node [  right =2mm of boxpres, text width=0.5cm, font=\scriptsize] (pres){\textbf{SIM}};
\node [box, right=10mm of pres] (boxsp){\concomitancianao};
\node [  right =1mm of boxsp, text width=3cm, font=\scriptsize] (fn){\textbf{NÃO}};
\end{tikzpicture}
\end{figure}


\begin{figure}[!ht]
\begin{tikzpicture}
\node [linhafinal, minimum height=\tamlin, very thin] (aprova3){};
\node [below right=1.5mm and 0mm  of aprova3.north west,font=\scriptsize] (discmoda){\textbf{PODE SER OFERECIDA COMO DISCIPLINA ISOLADA:} };
\node [box,  below right=1mm and 120mm  of aprova3.north west] (boxpres){\isoladasim};
\node [  right =2mm of boxpres, text width=0.5cm, font=\scriptsize] (pres){\textbf{SIM}};
\node [box, right=10mm of pres] (boxsp){\isoladanao};
\node [  right =1mm of boxsp, text width=3cm, font=\scriptsize] (fn){\textbf{NÃO}};
\end{tikzpicture}
\end{figure}
\end{center}

\raggedright
%\begin{figure}[!ht]
\begin{minipage}{\linewidth}% to keep image and caption on one page
\begin{flushright}


\begin{tikzpicture}
\node [linhafinal, text width=11.3cm, minimum height=10pt, align=center] 
	(proponente)
	{\textbf{PROFESSOR PROPONENTE}};
\node [linhafinal, minimum width=3cm, text width=3cm, minimum height=1.9cm, align=center, 
		below right=0mm of proponente.south west] 
		(data){\today};
\node [below=0mm and 0mm  of data.north,font=\scriptsize]{\textbf{DATA}};

\node [linhafinal, minimum width=8.3cm, text width=7cm, minimum height=1.9cm, very thin, align=center, right=-0.09mm of data] (assinatura){\\[1cm]
\inomeprofessor\ - Mat. \imatriculaprofessor};
\node [below=-0.7mm and 0mm  of assinatura.north, font=\scriptsize] {\textbf{ASSINATURA/MATRÍCULA/CARIMBO}};

\end{tikzpicture}
\end{flushright}
\end{minipage}
%\end{figure}
\\[5mm]
{\normalsize \textbf{OBS}: Segundo o Parágrafo Único do Artigo 57 da Deliberação 33/95, a unidade de crédito corresponde a 15h de aulas teóricas ou 30h de prática, laboratório ou estágio.}
}
\endinput
%------------------------------------------------------------------------------------
