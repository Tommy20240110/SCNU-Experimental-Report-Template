# `SCNU_Experimental_Report` 模板使用说明
## 模板简介
本模板是为华南师范大学（SCNU）实验报告设计的 LaTeX 模板，基于 `article` 类定制，符合学校实验报告格式要求。

## 文件结构
```
SCNU Experimental Report Template
├─ cite.bib                         % 参考文献数据库（可选）
├─ Example                          % 示例文件夹
│  ├─ Example.pdf
│  └─ Example.tex
├─ figures                          % 图片文件夹
├─ fonts                            % 字体文件夹（可选）
│  ├─ FangSong_GB2312.ttf
│  └─ KaiTi_GB2312.ttf
├─ README.md
├─ scnu.png                         % 校徽图片（可选）
├─ SCNU_Experimental_Report.cls     % 模板文件（必须）
└─ tables                           % 表格文件夹
```

## 快速开始
### 1. 基本使用
```latex
\documentclass{SCNU_Experimental_Report}

% 填写报告头信息
\studentname{你的姓名}
\studentid{你的学号}
\major{你的专业}
\class{年级班级}
\coursename{课程名称}
\projectname{实验项目名称}
\verify                         % 选择实验类型（三选一）
\experimentdate{实验日期}
\teacher{指导教师}

\begin{document}
\maketitle                      % 生成报告头

\section{一级标题}
\subsection{二级标题}

\end{document}
```

### 2. 实验类型选择
```latex
\verify     % 选中“验证”
\design     % 选中“设计”
\synthesis  % 选中“综合”
```

### 3. 章节标题
| 命令 | 字体 | 字号 | 加粗 |
|------|------|------|------|
| `\section{标题}` | 黑体 | 16号 | 否 |
| `\subsection{标题}` | 楷体 | 16号 | 是 |

### 4. 列表
```latex
% 无序列表
\begin{itemize}
    \item 项目一
    \item 项目二
\end{itemize}

% 有序列表（自动编号为 1. 2. 3.）
\begin{enumerate}
    \item 第一项
    \item 第二项
\end{enumerate}
```

### 5. 图片插入
```latex
\begin{figure}[htbp/H]
    \centering
    \includegraphics[width=0.6\textwidth]{figures/图片名.png}
    \caption{图片标题}
    \label{fig:label}
\end{figure}
```

- `[htbp]`：浮动位置（here, top, bottom, page）
- 使用 `[H]` 可强制放在当前位置（需 `float` 包）

### 6. 表格
**三线表：**
```latex
\begin{table}[htbp]
    \centering
    \caption{表格标题}
    \begin{tabular}{ccc}
        \toprule
        列1 & 列2 & 列3 \\
        \midrule
        数据1 & 数据2 & 数据3 \\
        \bottomrule
    \end{tabular}
\end{table}
```

**合并单元格：**
```latex
\begin{tabular}{|c|c|}
    \hline
    \multirow{2}{*}{合并行} & 列2 \\
    \cline{2-2}
    & 列2 \\
    \hline
    \multicolumn{2}{|c|}{合并列} \\
    \hline
\end{tabular}
```

### 7. 公式
```latex
% 行内公式
$E = mc^2$

% 编号公式
\begin{equation}
    F(u,v) = \sum_{x=0}^{N-1} f(x) e^{-j2\pi ux/N}
\end{equation}

% 矩阵
\begin{pmatrix}
    a & b \\
    c & d
\end{pmatrix}

% 分段函数
\begin{cases}
    x, & x > 0 \\
    0, & x \le 0
\end{cases}
```

### 8. 参考文献
**创建 `cite.bib` 文件：**
```bib
@book{key2024,
    title={书名},
    author={作者},
    year={2024},
    publisher={出版社}
}
```

**在文档中引用：**
```latex
\cite{key2024}

\printbibliography  % 文末输出参考文献列表
```

**编译命令：**
```bash
xelatex Example.tex
biber Example
xelatex Example.tex
xelatex Example.tex
```

### 9. 下划线（自动换行）
```latex
\ul{需要下划线的文字}
```
使用 `xeCJKfntef` 包，支持中文自动换行。

## 编译方法
### 方法一：命令行
```bash
xelatex Example.tex
```

### 方法二：VS Code（推荐）
安装 `LaTeX Workshop` 插件，配置 `settings.json`：
```json
{
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatex",
            "tools": ["xelatex"]
        }
    ],
    "latex-workshop.latex.tools": [
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": ["-synctex=1", "-interaction=nonstopmode", "%DOC%"]
        }
    ]
}
```
在拓展中执行编译命令