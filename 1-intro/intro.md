---
title: Introducing dynamic documents
author: |
  Pierce Edmiston  
  Madpy and MadR  
  <pierce.edmiston@gmail.com>  
  github.com/pedmiston  
  twitter.com/pedmistor
---

# Overview

Dynamic documents for reproducible research

1. Pierce: Introducing dynamic documents
2. Tristan: RMarkdown documents
3. Scott: Jupyter notebooks

# Three parables for dynamic documents

1. The old dataset
2. The big project
3. The future experiment

# Defining qualities of dynamic documents

1. Reproducible (No C&P!!!)
2. Agnostic* about style

# Markdown documents can be dynamic

Contents of `game-of-thrones-fan-fic.md`:

```
    # Chapter 1

    **John Snow is bold**.

    # Chapter 2

    _Arya Stark is italic_.
```

```bash
$ npm install -g md-fileserver
$ mdopen game-of-thrones-fan-fic.md
```

# Dynamic docs are written in markup languages

Examples of markup languages:

- Markdown
- Github flavored Markdown
- ReStructured Text
- HTML
- YAML
- TOML

# pandoc

> Wouldn't it be great to have a universal document converter?  
-- John MacFarlane, Professor of Philosophy, UC-Berkeley

# pandoc formats

![](img/pandoc-formats.png)

# pandoc loves make 

```Makefile
slides.pdf: intro.md img/pandoc-formats.png
  pandoc -t beamer -V theme=metropolis -o $@ $<
img/pandoc-formats.png: pandoc-formats.R
  ./pandoc-formats.R
```

# Dynamic documents: pandoc + code chunks

```
    # Sleepstudy data

    I fit a hierarchical linear model to the data.

    ```{r}
    library(lme4)
    data("sleepstudy")
    mod <- lmer(Reaction ~ Days + (Days|Subject), data = sleepstudy)
    summary(mod)
    ```

```
