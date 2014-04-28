---
layout: page
title: LightTable experiment
category: Editor
tags: [editor, ide, lighttable]
permalink: /lighttable/
last_updated: Tue, 29 Apr 2014 03:21:23 +0700
---
{% include JB/setup %}

## The LightTable experiment ##

### Reasoning ###

* I always want a better system than Emacs:
  - More beautiful
  - Supports concurrent programming
  - Uses a better Lisp (Clojure **is** a **better** Lisp, from my personal
    view)
  - Flexible in displaying things (like in a browser)
  - Better code base.

* LightTable is a great tool to experiment cool ideas:
  - Quick to prototype
  - Live-experiment

* Chris Granger is not satisfied with what we have in programming.

So I decided to begin experimenting LightTable (LT) in all ways possible,
starting with this page.  I'll try to keep this page as concise as helpful as
possible.

### Getting started ###

Sources:

* LightTable's
  [readme](https://github.com/LightTable/LightTable/blob/master/README.md)

* Basic setup:

  ```sh
  # Install lein
  mkdir ~/bin
  wget --no-check-certificate \
      -O ~/bin/lein \
      https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
  chmod +x ~/bin/lein
  echo 'export PATH=$HOME/bin:$PATH' >> ~/.profile
  export PATH=$HOME/bin:$PATH
  lein

  git clone https://github.com/LightTable/LightTable.git
  cd LightTable
  ./linux_deps.sh
  ./deploy/LightTable
  ```

Basic keybinding:

* `Ctrl-Enter` to eval an expression

* `Ctrl-O` to open a file

* `Ctrl-.` to jump to definition, and

  `Ctrl-,` to jump back

* `Ctrl-D` to look up inline documentation, and

  `Ctrl-Shift-D` for documentation searcher

* `Ctrl-Shift-F` for `grep`-like searching

Basic concepts

* LT is organized around **behaviors**, **objects**, and **tags** (BOT):

  * Read more about them
    [here](http://www.chris-granger.com/2013/01/24/the-ide-as-data/)

  * BOT model is more or less the same as Golang's OOP model:

    * *Objects* are simply hashtables

    * *Behaviors* are fundamentally *methods*

    * Behaviors *don't reside in objects*

    * Which behaviors could be applied upon which objects is defined by
      *tagging*:

      - Each object has a set of *tags*, which can be added or removed

      - Each tag has a set of behaviors, which can also be added or removed

      - If a behavior belongs to a tag, which in turns belongs to an object,
        that behavior could be called upon that object
