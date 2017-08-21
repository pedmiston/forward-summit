---
title: Introducing dynamic documents
author: |
  Pierce Edmiston
  Madpy and MadR  
---

# Overview

Dynamic documents for reproducible research

1. Pierce: Introducing dynamic documents
2. Tristan: RMarkdown documents
3. Scott: Jupyter notebooks

# Three parables for dynamic documents

1. The last dataset.
2. The only hypothesis.
3. The future experiment.

# The last dataset

<!-- The parable of the last dataset is something that happens any time you
think a dataset is final, but you end up getting more or different data in
place of it.

Here's the story: you get a dataset, thinking that all you have to do is
analyze this particular dataset, so you start exploring and making some plots,
fitting some models, and you write this nice long email to your collaborators
where you summarize your findings and attach plots and stats to support your
key points.

Then you get the dreaded email.

"That wasn't the right data. Use this data instead." Sometimes it isn't an
issue, and you can redo your analysis on the new data no problem. Undoubtedly
you **can** do the same analysis on new data. The question is how pissed off
you're going to be for having to do the same thing twice: remaking the plots,
updating all the numbers you included the first time.

So now imagine an alternative reality where you had instead sent a dynamic
document to your collaborators. Since you wrote your analysis in a dynamic
document, the only change you need to make is to insert the new data, and
recompile. **No matter how hard it was to write the first time, doing it the
second time takes no time.**

But here's the really radical point that is a little utopian, but I still
believe it's possible. Because you sent your collaborators dynamic document,
instead of asking you to plug in the new data, they can actually do it
themselves. **Writing dynamic documents makes it easier for collaborators to interact with your code.** -->

# The only hypothesis

<!-- The parable of the only hypothesis is what happens when you analyze
some data with a single hypothesis in mind, but then you tell people
about the data, and they inevitably ask you about something you didn't
test,

I'll analyze some data
and get an insight that makes me want to collect more datak
-->

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
