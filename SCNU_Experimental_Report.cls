% SCNU 实验报告模板
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SCNU_Experimental_Report}

% 继承 article 类
\LoadClass{article}

% 页面
\RequirePackage{geometry}
\geometry{
    a4paper,
    left=3.18cm,
    right=3.18cm,
    top=2.54cm,
    bottom=2.54cm,
}

% 页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}                          % 清空页眉页脚
\fancyfoot[C]{\thepage}             % 页码居中
\renewcommand{\headrulewidth}{0pt}  % 去掉页眉横线
\renewcommand{\footrulewidth}{0pt}  % 去掉页脚横线

% 字体
\RequirePackage[UTF8]{ctex}
% 设置英文字体
\RequirePackage{fontspec}
\setmainfont{Times New Roman}[
    BoldFont = Times New Roman Bold,
    ItalicFont = Times New Roman Italic,
    BoldItalicFont = Times New Roman Bold Italic,
]
% 设置中文字体
\RequirePackage{xeCJK}
% 楷体 (GB2312)
\newCJKfontfamily\kaibody[
    Path = ./fonts/,
    Extension = .ttf,
    UprightFont = *,
    BoldFont = *,
]{KaiTi_GB2312}
% 黑体
\newCJKfontfamily\heibody[
    Path = C:/Windows/Fonts/,
    Extension = .ttf,
    UprightFont = *,
    BoldFont = *,
]{simhei}
% 仿宋 (GB2312)
\newCJKfontfamily\fangsongbody[
    Path = ./fonts/,
    Extension = .ttf,
    UprightFont = *,
    BoldFont = *,
]{FangSong_GB2312}

% 字号
% 总标题: 28号
\newcommand{\titlefontsize}{\fontsize{28pt}{34pt}\selectfont}
% 一级标题: 16号
\newcommand{\sectionfontsize}{\fontsize{16pt}{22pt}\selectfont}
% 二级标题: 16号
\newcommand{\subsectionfontsize}{\fontsize{16pt}{22pt}\selectfont}
% 正文: 12号
\newcommand{\bodyfontsize}{\fontsize{12pt}{18pt}\selectfont}
% 应用到正文
\AtBeginDocument{
    \bodyfontsize
    \setlength{\baselineskip}{28pt}
}

% 章节标题
\RequirePackage{titlesec}
% 总标题: 楷体_GB2312 28号 居中 加粗
\newcommand{\reporttitle}[1]{
    {\kaibody\titlefontsize\bfseries{#1}\par}
}
% 一级标题: 黑体 16号 不加粗 左对齐
\titleformat{\section}
{\heibody\sectionfontsize\normalfont}
{\thesection.}{0.5em}{}
\titlespacing{\section}{0pt}{12pt}{8pt}
% 二级标题: 楷体_GB2312 16号 加粗
\titleformat{\subsection}
{\kaibody\subsectionfontsize\bfseries}
{\thesubsection.}{0.5em}{}
\titlespacing{\subsection}{0pt}{10pt}{6pt}

% 列表
\RequirePackage{enumitem}
\setlist[itemize,1]{label=\textbullet}  % 一级无序列表用圆点
\setlist[enumerate,1]{label=\arabic*.}  % 一级有序列表用 "1."

% 图片
\RequirePackage{float}  % 图表通用宏包
\RequirePackage{graphicx}
\graphicspath{{./}{./figures/}}

% 表格
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{multirow}

% 公式
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% 参考文献
\RequirePackage[backend=biber, style=ieee, sorting=none]{biblatex}
\addbibresource{./cite.bib}

% 超链接
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    citecolor=green,
    urlcolor=blue,
}

% 报告头
% 变量
\newcommand{\studentname}[1]{\def\@studentname{#1}}
\newcommand{\major}[1]{\def\@major{#1}}
\newcommand{\coursename}[1]{\def\@coursename{#1}}
\newcommand{\experimenttype}[1]{\def\@experimenttype{#1}}
\newcommand{\teacher}[1]{\def\@teacher{#1}}
\newcommand{\studentid}[1]{\def\@studentid{#1}}
\newcommand{\class}[1]{\def\@class{#1}}
\newcommand{\projectname}[1]{\def\@projectname{#1}}
\newcommand{\experimentdate}[1]{\def\@experimentdate{#1}}
% 默认值
\def\@studentname{}
\def\@studentid{}
\def\@major{}
\def\@class{}
\def\@coursename{}
\def\@projectname{}
\def\@experimenttype{$\square$验证 $\square$设计 $\square$综合}
\def\@experimentdate{}
\def\@teacher{}
% Logo位置
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
% 汉字空格
\newlength{\halfcharwidth}
\AtBeginDocument{
    \settowidth{\halfcharwidth}{字}                 % 用任意汉字测量宽度
    \setlength{\halfcharwidth}{0.5\halfcharwidth}   % 取一半
}
\newcommand{\csp}{\hspace{\halfcharwidth}}
% 分栏
\newlength{\infocolumnwidth}
\AtBeginDocument{
    \settowidth{\infocolumnwidth}
    {一二三四五六七八九十一二三四五}    % 15个汉字
}
\RequirePackage{multicol}
% 下划线
\RequirePackage{xeCJKfntef}
\newcommand{\ul}[1]{\CJKunderline*{#1}}
% 实验类型选择
\newcommand{\verify}{
    \experimenttype{$\checkmark$验证 $\square$设计 $\square$综合}
}
\newcommand{\design}{
    \experimenttype{$\square$验证 $\checkmark$设计 $\square$综合}
}
\newcommand{\synthesis}{
    \experimenttype{$\square$验证 $\square$设计 $\checkmark$综合}
}
% 生成报告头
\renewcommand{\maketitle}{
    % Logo
    \begin{textblock}{50}(10, 20)
        \includegraphics[width=5cm]{scnu.png}
    \end{textblock}
    % 总标题
    \begin{center}
        \reporttitle{实\csp 验\csp 报\csp 告}
    \end{center}
    % 学生信息表格 两栏
    \begin{multicols}{2}
        % 左栏
        \begin{tabular}{@{}p{\infocolumnwidth}@{}}
            学生姓名：\ul{　　\@studentname\hfill} \\
            专　　业：\ul{　　\@major\hfill}       \\
            课程名称：\ul{　　\@coursename\hfill}  \\
            实验类型：\@experimenttype           \\
            实验指导老师：\ul{\@teacher\hfill}     \\
        \end{tabular}

        \columnbreak

        % 右栏
        \begin{tabular}{@{}p{\infocolumnwidth}@{}}
            学　　号：\ul{　　\@studentid\hfill}      \\
            年级、班级：\ul{　\@class\hfill}          \\
            实验项目：\ul{　　\@projectname\hfill}    \\
            实验时间：\ul{　　\@experimentdate\hfill} \\
            实验评分：\ul{\hfill}
        \end{tabular}
    \end{multicols}
    \par
}