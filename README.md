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
\verify                           % 选择实验类型（三选一）
\experimentdate{实验日期}
\teacher{指导教师}

\begin{document}
\maketitle                        % 生成报告头

\section{一级标题}
\subsection{二级标题}

\end{document}
```

### 2. 实验类型选择
```latex
\verify      % 选中“验证”
\design      % 选中“设计”
\synthesis   % 选中“综合”
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

#### 6. 表格

**三线表（推荐）：**

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

#### 7. 公式

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

#### 8. 参考文献

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

\printbibliography   % 文末输出参考文献列表
```

**编译命令：**

```bash
xelatex Example.tex
biber Example
xelatex Example.tex
xelatex Example.tex
```

#### 9. 下划线（自动换行）

```latex
\ul{需要下划线的文字}
```

使用 `xeCJKfntef` 包，支持中文自动换行。

### 编译方法

#### 方法一：命令行

```bash
xelatex Example.tex
```

#### 方法二：VS Code（推荐）

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

按 `Ctrl+Alt+B` 编译。

### 字体配置

模板默认从 `./fonts/` 文件夹加载以下字体：

| 字体 | 文件名 | 用途 |
|------|--------|------|
| 楷体 | `KaiTi_GB2312.ttf` | 总标题、二级标题 |
| 黑体 | `SimHei.ttf` | 一级标题 |
| 仿宋 | `FangSong_GB2312.ttf` | 正文 |

如果没有这些字体，会自动使用系统默认字体（KaiTi、SimHei、FangSong）。

### 常见问题

#### Q: 编译报错 `fontspec Error: font not found`

A: 检查 `fonts/` 文件夹是否存在对应字体文件，或删除 `Path = ./fonts/` 使用系统字体。

#### Q: 下划线不换行

A: 确保使用 `\ul{}` 命令，不要使用 `\underline{}`。

#### Q: 图片显示不出来

A: 检查图片路径是否正确，`\graphicspath` 已包含 `./` 和 `./figures/`。

#### Q: 参考文献显示 `[?]`

A: 需要完整编译：`xelatex` → `biber` → `xelatex` → `xelatex`

#### Q: 页码位置不对

A: 模板默认页码居中，无需额外设置。

### 模板特性

| 功能 | 状态 | 说明 |
|------|------|------|
| 中文支持 | ✅ | 使用 `ctex` 宏包 |
| 校徽 Logo | ✅ | `textpos` 绝对定位 |
| 学生信息栏 | ✅ | 两栏布局，自动换行 |
| 实验类型选择 | ✅ | 提供 `\verify`、`\design`、`\synthesis` |
| 章节标题格式 | ✅ | 字体、字号、间距已预设 |
| 列表 | ✅ | 支持 `itemize`、`enumerate` |
| 图片 | ✅ | 支持浮动体、固定位置 |
| 表格 | ✅ | 支持三线表、合并单元格、长表格 |
| 公式 | ✅ | 完整数学环境 |
| 参考文献 | ✅ | IEEE 格式，支持 biber |
| 超链接 | ✅ | 目录、引用可点击 |
| 下划线换行 | ✅ | `xeCJKfntef` 支持 |

### 许可证

本模板仅供学习使用，欢迎修改和分享。
