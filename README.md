# `SCNU_Experimental_Report` 模板使用说明

## 模板简介
本模板是为华南师范大学（SCNU）实验报告设计的 LaTeX 模板，基于 `article` 类定制，符合学校实验报告格式要求。

**特点：**
- 所有字体均从 `common/fonts/` 文件夹加载，无需安装到系统字体目录
- 支持直接导入外部 PDF 文件（如代码附录、原始数据记录）
- 使用 `xeCJKfntef` 实现下划线自动换行
- 支持多实验独立项目（每个实验一个文件夹）

## 文件结构
```
SCNU Experimental Report Template
├─ common                           % 公共模板文件夹
│  ├─ fonts                         % 字体文件夹（必须）
│  │  ├─ FangSong_GB2312.ttf        % 仿宋_GB2312
│  │  ├─ KaiTi_GB2312.ttf           % 楷体_GB2312
│  │  └─ SimHei.ttf                 % 黑体
│  ├─ logo.png                      % 校徽图片（可选，用于报告头）
│  └─ SCNU_Experimental_Report.cls  % 模板文件（必须）
├─ Multiterm1                       % 多项目示例文件夹
│  ├─ cite.bib                      % 参考文献数据库（可选）
│  ├─ Example1.tex                  % 多项目示例.tex文件
│  ├─ figures                       % 图片文件夹
│  │  ├─ Ex1_Fig1.jpg
│  │  ├─ Ex1_Fig2.jpg
│  │  ├─ Ex1_Fig3.jpg
│  │  └─ Ex1_Fig4.jpg
│  ├─ Record.pdf                    % 实验记录 PDF
│  └─ tables                        % 表格文件夹（可选）
├─ Multiterm2                       % 多项目示例文件夹（同 Multiterm1）
│  ├─ cite.bib
│  ├─ Example2.tex
│  ├─ figures
│  │  ├─ Ex1_Fig1.jpg
│  │  ├─ Ex1_Fig2.jpg
│  │  ├─ Ex1_Fig3.jpg
│  │  └─ Ex1_Fig4.jpg
│  ├─ Record.pdf
│  └─ tables
├─ README.md
└─ Single                           % 单项目示例文件夹
   ├─ cite.bib
   ├─ Example.tex
   ├─ figures
   │  ├─ Ex1_Fig1.jpg
   │  ├─ Ex1_Fig2.jpg
   │  ├─ Ex1_Fig3.jpg
   │  └─ Ex1_Fig4.jpg
   ├─ Record.pdf
   └─ tables

```

## 快速开始

### 1. 基本使用
```latex
\documentclass{../common/SCNU_Experimental_Report}

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

### 3. 章节标题格式
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

### 5. 图片
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

### 8. 导入外部 PDF 文件
适用于插入代码清单、原始数据记录、实验原始手稿等。

```latex
% 导入单页
\includepdf[pages={1}]{附录代码.pdf}

% 导入多页（1,2,3页）
\includepdf[pages={1-3}]{附录代码.pdf}

% 导入所有页
\includepdf[pages=-]{附录代码.pdf}

% 添加空白页使 PDF 从奇数页开始
\includepdf[pages=-, pagecommand={\thispagestyle{plain}}]{附录代码.pdf}
```

> 注意：`\includepdf` 由 `pdfpages` 宏包提供，模板已自动加载。

### 9. 参考文献

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

### 10. 下划线（自动换行）
```latex
\ul{需要下划线的文字}
```
使用 `xeCJKfntef` 包，支持中文自动换行。

## 编译方法

### 方法一：VS Code（推荐）

1. 安装 `LaTeX Workshop` 插件
2. **（推荐）配置 VS Code 设置**，在 `settings.json` 中添加以下内容，将所有编译产物统一输出到 `.build/` 文件夹，保持源文件目录整洁：

```json
{
    "latex-workshop.latex.outDir": "./.build",
    "latex-workshop.latex.autoBuild.run": "never",
    "latex-workshop.latex.autoClean.run": "onFailed"
}
```

| 配置项 | 作用 |
|:---|:---|
| `latex-workshop.latex.outDir` | 指定所有编译产物（PDF、辅助文件）输出到 `.build/` 文件夹 |
| `latex-workshop.latex.autoBuild.run` | 设为 `never`，手动编译，避免不必要的自动构建 |
| `latex-workshop.latex.autoClean.run` | 设为 `onFailed`，编译失败时自动清理临时文件 |

> 💡 若你不需要自定义输出目录，使用默认配置也可正常编译，但编译产物会散落在 `.tex` 文件同目录下。

3. 打开任意实验文件夹下的 `.tex` 文件
4. 在 `LaTeX Workshop` 扩展中，选择编译 recipe：`latexmk (xelatex)`
5. 编译后 PDF 自动生成在 `.build/` 文件夹下（与 `.tex` 文件同级）

> 📌 若包含参考文献，需将 recipe 改为 `xelatex -> biber -> xelatex -> xelatex`

### 方法二：命令行

```bash
cd Ex1
set TEXINPUTS=../common//;../common/fonts//;
latexmk -xelatex -output-directory=.build report.tex
```

### 带参考文献的完整编译

```bash
cd Ex1
set TEXINPUTS=../common//;../common/fonts//;
latexmk -xelatex -output-directory=.build report.tex
biber .build/report
latexmk -xelatex -output-directory=.build report.tex
latexmk -xelatex -output-directory=.build report.tex
```

> 📌 命令行中 `-output-directory=.build` 与 VS Code 配置的 `outDir` 保持一致，均指向 `.build/` 文件夹。

## 注意事项

1. **字体文件夹**：编译时必须存在 `common/fonts/` 文件夹，并包含：
   - `FangSong_GB2312.ttf`
   - `KaiTi_GB2312.ttf`
   - `SimHei.ttf`

2. **路径写法**：`.tex` 文件中使用 `\documentclass{../common/SCNU_Experimental_Report}`

3. **PDF 位置**：编译后的 PDF 在 `.build/` 文件夹下，不在源文件同目录

4. **编码**：所有 `.tex` 文件请使用 UTF-8 编码保存

5. **编译引擎**：必须使用 `latexmk -xelatex`