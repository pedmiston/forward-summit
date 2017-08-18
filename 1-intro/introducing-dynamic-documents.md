---
title: Introducing dynamic documents
---

# Three parables for dynamic documents

1. The parable of the old dataset
2. The parable of the big project
3. The parable of the future experiment

# Two qualities of dynamic documents

1. Reproducible
2. Agnostic* about style

<!-- If you can't reproduce, you can't extend. -->

# A markdown document can be dynamic

Contents of "game-of-thrones-fan-fic.md":

```
    # Chapter 1

    John Snow is **bold**.

    # Chapter 2

    Arya Stark is _italic_.
```

```bash
npm install -g md-fileserver
mdopen game-of-thrones-fan-fic.md
```

# Markdown is a markup language

- Github flavored Markdown
- ReStructured Text
- HTML
- TeX
- YAML
- TOML

# pandoc

> Wouldn't it be great to have a universal document converter?

# pandoc ♡'s Makefile

```Makefile
introducing-dynamic-documents.pdf: introducing-dynamic-documents.md
  pandoc -t beamer -V theme=metropolis -o $@ $<
```
