---
title: Introducing dynamic documents
---

# Three parables for dynamic documents

1. The parable of the old dataset
2. The parable of the big project
3. The parable of the future experiment

# Defining qualities of dynamic documents

1. Reproducible
2. Agnostic* about style

# Dynamic documents outside of data analysis

**A markdown document can be dynamic.**  
Contents of "game-of-thrones-fan-fic.md":

```
    # Chapter 1

    **John Snow is bold**.

    # Chapter 2

    _Arya Stark is italic_.
```

```bash
npm install -g md-fileserver
mdopen game-of-thrones-fan-fic.md
```

# Dynamic docs are written in markup languages

- Gruber flavored Markdown
- Github flavored Markdown
- ReStructured Text
- HTML
- YAML
- TOML

<aside class="notes">
John Gruber or as he's known online "daring fireball" defined the
authoritative version of Markdown, and it's the inspiration for
many of the variants, but they all differ in some way.

Restructured Text is the markup language of choice for many pythonistas,
because it is the markup language used to write the official python
docs.

Both Markdown and ReStructured Text exist primarily for offering a simpler
way to write HTML. It separates the content from the styling so people can
worry about content independent of style. They are also used because they
are more "pleasing to the eye" than reading HTML source.

But then things get a little messy because HTML itself is a markup language.
After all, HTML stands for Hypertext Markup Language. And there are many
other markup language.

YAML is a popular one. YAML originally stood for Yet Another Markup Language
until it was later renamed to the recursive "YAML Ain't Markup
Language". And it's true, most of the time I haven't seen YAML used as a
markup language, but rather as a way to specify config files and other
data that is read in by different languages.

This true for TOML too. TOML stands for Tom's Minimal, Obvious Language,
and it's technically a markup language though it's used mostly like YAML
for storing program data. (I just think the name is funny.)
</aside>

# pandoc

> Wouldn't it be great to have a universal document converter?

# pandoc ♡'s Makefile

```Makefile
introducing-dynamic-documents.pdf: introducing-dynamic-documents.md
  pandoc -t beamer -V theme=metropolis -o $@ $<
```
