\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VampireSheet}[2018/07/06 World of Darkness LaTeX]
\LoadClass[a4paper,twocolumns,oneside]{book}
\PassOptionsToPackage{table}{xcolor}
\usepackage{xcolor}
\usepackage{tikz}
\usepackage{pgffor}
\usepackage{graphicx}
\usepackage{wrapfig}
\usepackage{amssymb}
\usepackage{mwe,tikz}
\usepackage{textcomp}
\usepackage{background}
\usepackage{intcalc}
\usepackage{calc}
\usepackage{fmtcount}
\usepackage[percent]{overpic}
\usepackage{relsize}
\usepackage[most]{tcolorbox}
\usepackage{wasysym}
\usepackage{fontspec}
\usepackage{sectsty}
\usepackage[outline]{contour}% http://ctan.org/pkg/contour
\usepackage{multido}
\usepackage{xstring}
\usepackage{xparse}
\usepackage{etoolbox}

\definecolor{coverGold}{RGB}{235,186,118}
\definecolor{coverFontTitleColor}{RGB}{253, 215, 215}
\definecolor{tablebackground}{RGB}{255,255,255}

%\rowcolors{2}{gray!15}{white}
%\newcommand{\head}[1]{\textcolor{white}{\textbf{#1}}}
%\newcommand{\firstColumn}[1]{\textcolor{white}{\textbf{#1}}}

\DeclareOption{portuguese}{\PassOptionsToClass{\CurrentOption}{artigo}}
\DeclareOption{english}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{LQ}{\providecommand{\isLQ}{_LQ}}
\DeclareOption{HQ}{\providecommand{\isLQ}{}}
\DeclareOption{Vampire}{
	\providecommand{\genrePath}{Vampire}
	\providecommand{\genreFont}{Delavan}
	\providecommand{\titleFont}{DeRoos}
	\providecommand{\genreFrontTextColor}{black!10}
	\providecommand{\genreGeometryTop}{2.5cm}
	\providecommand{\genreGeometryBottom}{3.5cm}
	\providecommand{\genreGeometryInner}{2.5cm}
	\providecommand{\genreGeometryOuter}{2.5cm}
	\providecommand{\genreChapterSpacing}{6cm}
	\providecommand{\genreTOCSpacing}{10cm}
	\providecommand{\genreLeftMargin}{1.8cm}
	\providecommand{\genreChapTitlePos}{.01\paperwidth,-.01\paperheight}
	\providecommand{\genreCreditsPos}{.352\paperwidth,-.404\paperheight}
	\providecommand{\genreTOCTitleColor}{white!80!black}
	\providecommand{\genreTOCBodyColor}{white!80!black}
}%end of Vampire Specifics

\ProcessOptions\relax
\ExecuteOptions{english,LQ,Vampire}%setting Default
\usepackage{babel}
\usepackage[a4paper,top=\genreGeometryTop, bottom=\genreGeometryBottom, outer=\genreGeometryOuter, inner=\genreGeometryInner, left=\genreLeftMargin]{geometry}
\usetikzlibrary{calc}
\defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
\usetikzlibrary{calc,fit,intersections}
\usetikzlibrary{fadings,shadings,decorations.text}
\usetikzlibrary{patterns}


\newcommand{\theFont             }{\genreFont}
\newcommand{\theFontSection      }{\genreFont}
\newcommand{\theFontSubSection   }{\genreFont}
\newcommand{\theFontSubSubSection}{\genreFont}

\newcommand{\coverTitleFont}{\titleFont}


\newcommand{\EmptyDot}{\Circle}
\newcommand{\FilledDot}{$\CIRCLE$}

\providecommand{\SmallWoDSeperatorSheet}[1]
{
	\center
	\begin{tikzpicture}
		\node {
			\includegraphics[width=0.95\textwidth]
			{
				../art/sidebar/\genrePath/SidebarSheet\isLQ
			}
		};
		\node [anchor=center, align=center, fill=white, inner sep=5pt] {#1};
	\end{tikzpicture}
}

\providecommand{\BigWoDSeperatorSheet}[1]
{
	\center
	\begin{tikzpicture}
		\node {\includegraphics[width=1\textwidth]{
				../art/sidebar/\genrePath/SidebarBrokenSheet\isLQ}
		};
		\node [anchor=center, align=center]at (0,-2.8mm){
			\textbf{
				\fontspec{
					\theFont
				}
				\fontsize{23}{20}\selectfont #1}
		};
	\end{tikzpicture}
}

\providecommand{\BigWoDSeperatorSheetNonText}[0]
{
	\center
	\begin{tikzpicture}
		\node {\includegraphics[width=1\textwidth]{
				../art/sidebar/\genrePath/SidebarSheet\isLQ}
		};
	\end{tikzpicture}
}

\setmainfont{Goudy Old Style}
% Comando que cria o grupo de atributos com a fila de dots
\newcommand{\PlayerCharGameInfo}[3]{%
	\noindent
	\begin{center}
		\setlength{\tabcolsep}{10pt}
		\begin{tabular}{ll}
			\makebox[4.7em][l]{#1} & \\
			\makebox[4.7em][l]{#2} & \\
			\makebox[4.7em][l]{#3} & 
		\end{tabular}%
	\end{center}
}

% Comando que cria o grupo de atributos com a fila de dots
\newcommand{\Attributes}[3]{%
	\noindent
	\begin{center}
		\vspace{-1.0\baselineskip}
		\setlength{\tabcolsep}{10pt}
		\begin{tabular}{ll}
			\makebox[4.7em][l]{#1} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#2} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#3} & \dottedSkill{1}{10}
		\end{tabular}%
	\end{center}
}

\newcommand{\dottedSkill}[2]{%
	%parameter 1 the filled dots
	%parameter 2 the max dots  
	\multido{\ix=1+1}{#1}{\FilledDot}%
	\ifnum#1<#2 \multido{\ix=#1+1}{\numexpr#2-#1}{\EmptyDot}\fi
}%

\newcommand{\Healthlevel}[0]{%
	\noindent
	\begin{center}
		\begin{tabular}{lcr}
			Bruised & & $\square$ \\
			Hurt & -1 & $\square$ \\
			Injured & -1 & $\square$ \\
			Wounded & -2 & $\square$ \\
			Mauled & -2 & $\square$ \\
			Crippled & -5 & $\square$ \\
			Incapacitated & & $\square$ \\
		\end{tabular}%
	\end{center}
}

\newcommand{\Abilities}[9]{%
	\noindent
	\begin{center}
		\vspace{-1.0\baselineskip}
		\setlength{\tabcolsep}{10pt}
		\begin{tabular}{ll}
			\makebox[4.7em][l]{#1} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#2} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#3} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#4} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#5} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#6} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#7} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#8} & \dottedSkill{1}{10}\\
			\ComplAbilities{#9}{|}
		\end{tabular}%
	\end{center}
}


% Comando intermediário para dividir a string
\newcommand{\ComplAbilities}[2]{%
	\noindent
	\makebox[4.7em][l]{\StrBefore{#1}{#2}} & \dottedSkill{1}{10}\\
	\makebox[4.7em][l]{\StrBehind{#1}{#2}} & \dottedSkill{1}{10}
}


\newcommand{\Disciplines}[6]{%
	\noindent
	\begin{center}
		\vspace{-1.0\baselineskip}
		\setlength{\tabcolsep}{10pt}
		\begin{tabular}{ll}
			\makebox[4.7em][l]{#1} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#2} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#3} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#4} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#5} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#6} & \dottedSkill{1}{10}\\
		\end{tabular}%
	\end{center}
}

\newcommand{\Backgrounds}[6]{%
	\noindent
	\begin{center}
		\vspace{-1.0\baselineskip}
		\setlength{\tabcolsep}{10pt}
		\begin{tabular}{ll}
			\makebox[4.7em][l]{#1} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#2} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#3} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#4} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#5} & \dottedSkill{1}{10}\\
			\makebox[4.7em][l]{#6} & \dottedSkill{1}{10}\\
		\end{tabular}%
	\end{center}
}

\newcommand{\Virtues}[3]{%
	\noindent
	\begin{center}
		\vspace{-1.0\baselineskip}
		\setlength{\tabcolsep}{10pt}
		\begin{tabular}{ll}
			\makebox[7.6em][l]{#1} & \dottedSkill{1}{5}\\[11.5pt]
			\makebox[7.6em][l]{#2} & \dottedSkill{1}{5}\\[11.5pt]
			\makebox[7.6em][l]{#3} & \dottedSkill{1}{5}\\[11.5pt]
		\end{tabular}%
	\end{center}
}


\newcommand{\OtherTraits}[8]{%
	\noindent
\begin{center}
	\vspace{-1.0\baselineskip}
	\setlength{\tabcolsep}{10pt}
	\begin{tabular}{ll}
		\makebox[4.7em][l]{#1} & \dottedSkill{1}{10}\\
		\makebox[4.7em][l]{#2} & \dottedSkill{1}{10}\\
		\makebox[4.7em][l]{#3} & \dottedSkill{1}{10}\\
		\makebox[4.7em][l]{#4} & \dottedSkill{1}{10}\\
		\makebox[4.7em][l]{#5} & \dottedSkill{1}{10}\\
		\makebox[4.7em][l]{#6} & \dottedSkill{1}{10}\\
		\makebox[4.7em][l]{#7} & \dottedSkill{1}{10}\\
		\makebox[4.7em][l]{#8} & \dottedSkill{1}{10}\\
		%\ComplOtherTraits{#9}{;}
	\end{tabular}%
\end{center}
}

\NewDocumentCommand{\ComplOtherTraits}{ >{\SplitList{|}} m }{%
	\setcounter{traitCounter}{0}
	\ProcessList{#1}{\traitEntry}%
}

\NewDocumentCommand{\traitEntry}{m}{%
	\makebox[4.7em][l]{#1} & \dottedSkill{1}{10}%
	\ifnumcomp{\value{traitCounter}}{<}{\ListLength}{\\}{}
	\stepcounter{traitCounter}
}

\newcommand{\NewdottedSkill}[2]{%
	%parameter 1 the filled dots
	%parameter 2 the max dots  
	\multido{\ix=1+1}{#1}{\FilledDot}%
	\ifnum#1<#2 \multido{\ix=#1+1}{\numexpr#2-#1}{\EmptyDot\, \kern-0.2pt}\fi
}%

% Defina o comando \Humanity
\newcommand{\Humanity}[1]{%
	\noindent
	\begin{center}
		\vspace{-0.5\baselineskip}
		\setlength{\tabcolsep}{0pt}
		\begin{tabular}{c}
			#1\\[-10.0pt]
			\rule{78pt}{0.4pt}\\
			\NewdottedSkill{0}{10}
		\end{tabular}%
	\end{center}
}

% Defina o comando \Willpower
\newcommand{\Willpower}[0]{%
	\noindent
	\begin{center}
		\vspace{-0.5\baselineskip}
		\setlength{\tabcolsep}{0pt}
		\begin{tabular}{c}
			\Squarerow
		\end{tabular}%
	\end{center}
}

\newcommand{\Squarerow}{%
	$\square$\, \kern-0.2pt	
	$\square$\, \kern-0.2pt	
	$\square$\, \kern-0.2pt	
	$\square$\, \kern-0.2pt	
	$\square$\, \kern-0.2pt	
	$\square$\, \kern-0.2pt	
	$\square$\, \kern-0.2pt	
	$\square$\, \kern-0.2pt	
	$\square$\, \kern-0.2pt	$\square$\\
	\EmptyDot\, \kern-0.2pt	
	\EmptyDot\, \kern-0.2pt	
	\EmptyDot\, \kern-0.2pt	
	\EmptyDot\, \kern-0.2pt	
	\EmptyDot\, \kern-0.2pt	
	\EmptyDot\, \kern-0.2pt	
	\EmptyDot\, \kern-0.2pt	
	\EmptyDot\, \kern-0.2pt	
	\EmptyDot\, \kern-0.2pt	\EmptyDot\\
}

\newcommand{\Bloodpool}[1]{%
	% parameter 1: total number of squares
	\setcounter{squarecount}{0} % Inicializa o contador
	\noindent
	\foreach \ix in {1,...,#1}{%
		$\square$\ifnum\ix<#1 \kern-1.0pt\fi % Adiciona espaço entre quadrados
		\stepcounter{squarecount}
		\ifnum\value{squarecount}=10 \\ % Inicia uma nova linha após 10 quadrados
		\setcounter{squarecount}{0} % Reinicia o contador para uma nova linha
		\fi
	}
}%

\newcommand{\experience}{
	\begin{tikzpicture}[remember picture, overlay]
		\draw[thick, black, solid] (-2.5,-1.7) rectangle ++(5,2);
	\end{tikzpicture}
}
\endinput