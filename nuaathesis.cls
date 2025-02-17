%% class clarification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nuaathesis}[2017/03/20 0.9a The LaTeX template for academic  degree thesis of Nanjing University of Aeronautics and Astronautics]
\typeout{Document Class `nuaathesis' 0.9a by Jack Wang (2017/03/20)}
\newcommand\version{v0.9a}

%% 学士学位论文选项、以后可以此格式拓展硕士、博士选项
\newif\ifnuaa@bachelor\nuaa@bachelorfalse
\DeclareOption{bachelor}{\nuaa@bachelortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[oneside, a4paper, zihao=-4, UTF8, openright]{ctexbook}
\AtEndOfClass{\input{nuaathesis.cfg}}

%%===============
%% 加载LaTeX宏包
%%===============

\RequirePackage{algorithm, algorithmicx, algpseudocode} %% 算法排版相关
\RequirePackage{amsfonts,amssymb,amsthm,bm,mathrsfs,mathtools}  %% 公式相关
\RequirePackage[backend=biber, style=gb7714-2015]{biblatex} %% 参考文献相关
\RequirePackage{booktabs} %% 表格格式相关
\RequirePackage[inline]{enumitem} %% list环境相关
\RequirePackage{fancyhdr} %% 页眉页脚相关
\RequirePackage{fontspec}
\RequirePackage[perpage,bottom]{footmisc}
\RequirePackage[top=4.05cm,bottom=2.82cm,left=2cm,right=2cm]{geometry} %% 页面大小相关
\RequirePackage{graphicx} %% 插图相关
\RequirePackage[xetex,hidelinks]{hyperref} %% 交叉引用相关
\RequirePackage{indentfirst}  %% 首段缩进
\RequirePackage{listings} %% 代码排版相关
\RequirePackage{longtable}  %% 跨页表格
\RequirePackage{makecell} %% 表格相关
\RequirePackage{multirow} %% 跨行表格相关
\RequirePackage{rotating} %% 宽表格
\RequirePackage[titles]{tocloft}
\RequirePackage{tabularx} %% 表格相关
\RequirePackage[table]{xcolor}  %% 颜色相关
\RequirePackage{xltxtra}
\RequirePackage{ccaption} %% ccaption包因为特殊原因必须在longtable之后加载

%%====================
%% 基本设置与简单宏定义
%%====================

\setcounter{secnumdepth}{3}  %% 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     %% 目录深度 (part 对应 -1)

%% 设置英文字体
\setmainfont[Mapping=tex-text]{Times New Roman}
% \setmainfont{TeX Gyre Termes}

%% 设置行间距
\linespread{1.5}

\renewcommand{\labelenumi}{(\theenumi)}

%%===========
%% 各宏包设置
%%===========

%% tocloft package
\renewcommand{\cftchapleader}{\heiti\cftdotfill{\cftdotsep}}%% 目录中章后也有点

%% fancyhdr package
%% 正文页眉页脚
\pagestyle{fancy}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[L]{\setlength{\unitlength}{1mm}
    \begin{picture}(0,0)
      \put(7.3,1.5){\includegraphics[height=0.9cm,width=6cm]{nuaa.png}}
    \end{picture}}
  \fancyhead[R]{\makebox[6.7cm]\raggedright{\sihao 课程论文}}
  \fancyfoot[R]{\footnotesize{-\ \thepage\ -}}
  \renewcommand{\headrulewidth}{0.7pt}
  \renewcommand{\footrulewidth}{0.7pt}
}
\appto\frontmatter{\pagestyle{plain}}
\appto\mainmatter{\pagestyle{plain}}

%% ctex & xeCJK package

%% 字号宏定义
\newcommand{\verybig}{\fontsize{53pt}{82.68pt}\selectfont}
\newcommand{\chuhao}{\Huge\selectfont}
\newcommand{\erhao}{\LARGE\selectfont}
\newcommand{\xiaoerhao}{\Large\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}
\newcommand{\xiaosanhao}{\large\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{16.8pt}\selectfont}
\newcommand{\xiaosihao}{\normalsize\selectfont}
\newcommand{\wuhao}{\small\selectfont}
\newcommand{\xiaowuhao}{\footnotesize\selectfont}

%% 标题名称宏定义
\ctexset{abstractname={\xiaosanhao\heiti\nuaa@abstractname}}
\ctexset{contentsname={\nuaa@contentsname}}
\ctexset{listfigurename={\nuaa@listfigurename}}
\ctexset{listtablename={\nuaa@listtablename}}
\floatname{algorithm}{\nuaa@label@algo}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}
\renewcommand{\listalgorithmname}{\nuaa@listalgorithmname}
\renewcommand{\lstlistingname}{\nuaa@value@listingname}

\ctexset{chapter={%
	format={\centering\xiaosanhao\heiti},
	nameformat={\xiaosanhao\heiti},
	titleformat={\xiaosanhao\heiti},
	beforeskip={15\p@},
	afterskip={12\p@},
	}
}
\ctexset{section={%
	format={\sihao\heiti},
	afterskip={1.0ex \@plus .2ex},
	}
}
\ctexset{subsection={%
	format={\xiaosihao\heiti},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}
\ctexset{subsubsection={%
	format={\normalfont\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphicx package
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

%% ccaption pacakge
\captiondelim{\ }
\captionnamefont{\wuhao\heiti}
\captiontitlefont{\wuhao\heiti}

%% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

\renewcommand{\thealgorithm}{\arabic{chapter}.\arabic{algorithm}}

%% 使用enumitem宏包配制列表环境
%% 紧凑间距
\setlist{nosep}
%% 列表和段落头对齐
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} %% Only the level 1

%%==================
%% listings/listlistings package
%%==================
% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,%
  captionpos=t,%
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,%
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true%
  numbersep=-1em%
}

%% 定理环境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\nuaa@label@algo~}[chapter]
\theoremstyle{definition}
  \newtheorem{thm}{\nuaa@label@thm~}[chapter]
  \newtheorem{defn}{\nuaa@label@defn~}[chapter]
  \newtheorem{conj}{\nuaa@label@conj~}[chapter]
  \newtheorem{exmp}{\nuaa@label@exmp~}[chapter]
  \newtheorem{rem}{\nuaa@label@rem~}
  \newtheorem{case}{\nuaa@label@case~}
  \newtheorem{lem}[thm]{\nuaa@label@lem~}
  \newtheorem{prop}[thm]{\nuaa@label@prop~}
  \newtheorem{cor}[thm]{\nuaa@label@cor~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\nuaa@label@thm~}
  \newtheorem{blem}[thm]{\nuaa@label@lem~}
  \newtheorem{bprop}[thm]{\nuaa@label@prop~}
  \newtheorem{bcor}[thm]{\nuaa@label@cor~}
  \renewcommand{\proofname}{\bf\nuaa@label@proof}

%%==================
%% nuaathesis 宏定义
%%==================

%% 封面页
\newcommand\zhtitle[1]{\def\nuaa@value@zhtitle{#1}}
\newcommand\entitle[1]{\def\nuaa@value@entitle{#1}}
%\renewcommand\author[1]{\def\nuaa@value@author{#1}}
\newcommand\studentid[1]{\def\nuaa@value@studentid{#1}}
\newcommand\college[1]{\def\nuaa@value@college{#1}}
\newcommand\major[1]{\def\nuaa@value@major{#1}}
\newcommand\classid[1]{\def\nuaa@value@classid{#1}}
\newcommand\advisorname[1]{\def\nuaa@value@advisorname{#1}}
\newcommand\advisortitle[1]{\def\nuaa@value@advisortitle{#1}}
\newcommand\applydate[1]{\def\nuaa@value@applydate{#1}}

\newcommand{\makecover}{
  \cleardoublepage
  \thispagestyle{empty}
  \begin{titlepage}
    \begin{flushright}
      {\heiti\sanhao\nuaa@label@thesisnum\hspace{10pt}\underline{\hspace{60pt}}} \\
    \end{flushright}
    \begin{center}
      {\textbf{\erhao\kaishu\@nuaa}} \\
      \vspace*{32pt}
      {\verybig\nuaa@coverpagetitle} \\
      \vspace*{65pt}
      {
        \parbox[c]{6em}{\erhao\heiti\nuaa@label@title}
        \parbox[c]{25em}{%
          \erhao\heiti
          \begin{center}
            \nuaa@value@zhtitle
            \end{center}
        }%
      } \\
      \vspace*{40pt}
      \renewcommand{\arraystretch}{2}
      \setlength{\tabcolsep}{0pt}
      {%
        \begin{tabular}{cc}
          {\xiaosanhao\heiti\nuaa@label@author\quad} &
          \underline{\makebox[20em][s]{\makebox[20em][c]{\sanhao\heiti\nuaa@value@author}}} \\
          {\xiaosanhao\heiti\nuaa@label@studentid\quad} &
          \underline{\makebox[20em][s]{\makebox[20em][c]{\sanhao\heiti\nuaa@value@studentid}}} \\
          {\xiaosanhao\heiti\nuaa@label@college\quad} &
          \underline{\makebox[20em][s]{\makebox[20em][c]{\sanhao\heiti\nuaa@value@college}}} \\
          {\xiaosanhao\heiti\nuaa@label@major\quad} &
          \underline{\makebox[20em][s]{\makebox[20em][c]{\sanhao\heiti\nuaa@value@major}}} \\
          {\xiaosanhao\heiti\nuaa@label@classid\quad} &
          \underline{\makebox[20em][s]{\makebox[20em][c]{\sanhao\heiti\nuaa@value@classid}}} \\
          {\xiaosanhao\heiti\nuaa@label@advisor\quad} &
          \underline{\makebox[20em][s]{\makebox[20em][c]{\sanhao\heiti\nuaa@value@advisorname\quad\nuaa@value@advisortitle}}} \\
        \end{tabular}
      }
      \vfill
      {\sanhao\heiti\nuaa@value@applydate\par}
    \end{center}
  \end{titlepage}
}

%%===========
%% 诚信承诺书
%%===========
\newcommand{\declare}{%
  \thispagestyle{empty}{%
    \begin{center}{\heiti\xiaoerhao\@nuaa\\\vspace{1em}本科毕业设计（论文）诚信承诺书}
    \end{center}
    {%
    \linespread{1.68}
    \sihao\hspace{1.8em}
    本人郑重声明：所呈交的毕业设计（论文）（题目：\uline{\nuaa@value@zhtitle}）是本人在导师的指导下独立进行研究所取得的成果。尽本人所知，除了毕业设计（论文）中特别加以标注引用的内容外，本毕业设计（论文）不包含任何其他个人或集体已经发表或撰写的成果作品。\par}
    ~\\
    \begin{flushright}
      \sihao
        \begin{tabular}{ccr}
          作者签名： & \hspace{150pt} & \hspace{4em} 年 \hspace{1em} 月 \hspace{1em} 日 \\
          （学号）： & \hspace{150pt} & \\
        \end{tabular}
      \end{flushright}
    \par
  }
  \clearpage
}

%%==================
%% chinese abstract
%%==================
\newenvironment{abstract}[1]{%
  \clearpage\cleardoublepage
  \newcommand{\@keywords}{#1}
  \hypersetup{pdfkeywords={\@keywords}}
  \phantomsection
  \addcontentsline{toc}{chapter}{\nuaa@abstractname}
  \chapter*{\xiaosanhao\nuaa@abstractname}
  \setcounter{page}{1}
}{%
  \par
  \begin{description}
    \item[\sffamily\mdseries\xiaosanhao 关键词：] \@keywords
  \end{description}
}

%%==================
%% english abstract
%%==================
\newenvironment{englishabstract}[1]
{%
  \clearpage\cleardoublepage
  \newcommand{\@keywords}{#1}
  \phantomsection
  \addcontentsline{toc}{chapter}{\nuaa@abstractnameen}
	\chapter*{\erhao\nuaa@value@entitle\vskip 20pt\xiaosanhao Abstract}
}{%
  \par
  \begin{description}
  \item[\xiaosanhao Keywords:] \@keywords
  \end{description}
  \newpage
}


%% thesis define
\newcommand{\nuaathesis}{%
  \makebox{%
    N\hspace{-0.3ex}\raisebox{-0.5ex}{U}\hspace{-0.3ex}A\mbox{$^{\hspace{-0.5ex}2}$}\hspace{0.3ex}\textsc{Thesis}}}

\newcommand{\oldnuaathesis}{%
  N\raisebox{0.5ex}{U}\hspace{-0.3ex}AA%
  \textsc{Thesis}
}

\newcommand{\seuthesix}{%
  \makebox{S\hspace{-0.3ex}\raisebox{-0.5ex}{E}\hspace{-0.3ex}U\hspace{0.1em}%
  \textsc{Thesix}}
}
\endinput
