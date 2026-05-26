\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SCNU Experimental Report}

% 继承 article 类
\LoadClass[a4paper]{article}

% ===== 必加载宏包 =====
\RequirePackage[UTF8]{ctex}           % 中文支持
\RequirePackage{geometry}              % 页面设置
\RequirePackage{graphicx}              % 图片插入
\RequirePackage{amsmath, amssymb}      % 数学公式
\RequirePackage{booktabs}              % 三线表
\RequirePackage{longtable}             % 长表格
\RequirePackage{array}                 % 表格增强
\RequirePackage[normalem]{ulem}        % 下划线
\RequirePackage{enumitem}              % 列表控制
\RequirePackage{titlesec}              % 标题格式
\RequirePackage{hyperref}              % 超链接
\RequirePackage{float}                 % 浮动体控制

% ===== 页面设置 =====
\geometry{
    a4paper,
    left=2.5cm,
    right=2.5cm,
    top=2.5cm,
    bottom=2.5cm,
}

% ===== 图片路径 =====
\graphicspath{{figure/}{media/}}

% ===== 列表格式 =====
\setlist[enumerate,1]{label=\arabic{enumi}.}
\setlist[itemize,1]{label=\textbullet}

% ===== 章节标题格式 =====
\titleformat{\section}{\Large\bfseries\centering}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{12pt}{12pt}
\titleformat{\subsection}{\large\bfseries}{\thesubsection}{1em}{}
\titlespacing{\subsection}{0pt}{10pt}{8pt}
\titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titlespacing{\subsubsection}{0pt}{8pt}{6pt}

% ===== 下划线简写 =====
\newcommand{\ul}[1]{\uline{#1}}

% ===== 定义报告头所需的变量 =====
\newcommand{\studentname}[1]{\def\@studentname{#1}}
\newcommand{\studentid}[1]{\def\@studentid{#1}}
\newcommand{\major}[1]{\def\@major{#1}}
\newcommand{\class}[1]{\def\@class{#1}}
\newcommand{\coursename}[1]{\def\@coursename{#1}}
\newcommand{\projectname}[1]{\def\@projectname{#1}}
\newcommand{\experimenttype}[1]{\def\@experimenttype{#1}}
\newcommand{\experimentdate}[1]{\def\@experimentdate{#1}}
\newcommand{\teacher}[1]{\def\@teacher{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}

% 默认值（可选）
\newcommand{\@logo}{}  % 校徽图片，可留空
\newcommand{\@experimenttype}{□验证 □设计 □综合}

% ===== 核心：重定义 \maketitle 生成报告头 =====
\renewcommand{\maketitle}{%
    \begin{center}
        % 校徽（如果有）
        \ifx\@logo\empty
            % 无校徽，留空
        \else
            \includegraphics[width=2cm]{\@logo}\\[0.2cm]
        \fi
        
        % 主标题
        {\Huge\bfseries 实 验 报 告}\\[0.8cm]
        
        % 学生信息表格
        \begin{tabular}{p{3cm}p{5cm}p{3cm}p{3cm}}
            学生姓名： & \ul{\@studentname} & 学　　号： & \ul{\@studentid} \\[0.5cm]
            专　　业： & \ul{\@major} & 年级、班级： & \ul{\@class} \\[0.5cm]
            课程名称： & \ul{\@coursename} & 实验项目： & \ul{\@projectname} \\[0.5cm]
            实验类型： & \@experimenttype & 实验时间： & \ul{\@experimentdate} \\[0.5cm]
            实验指导老师： & \ul{\@teacher} & 实验评分： & \ul{\hspace{3cm}} \\
        \end{tabular}
    \end{center}
    \vspace{0.5cm}
    \hrule
    \vspace{0.5cm}
}

% ===== 可选：添加目录控制 =====
\newcommand{\maketoc}{%
    \tableofcontents
    \newpage
}