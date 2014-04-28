---
layout: page
title: LightTable experiment
category: Editor
tags: [editor, ide, lighttable, experiment]
permalink: /lighttable/
last_updated: Tue, 29 Apr 2014 03:39:49 +0700
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

Basic components of LT:

* LT uses [CodeMirror](http://codemirror.net/) for all the syntax highlighting
  and editing functionalities

Basic concepts

* LT is organized around **behaviors**, **objects**, and **tags** (BOT):

  * Read more about them
    [here](http://www.chris-granger.com/2013/01/24/the-ide-as-data/)

  * BOT model is more or less the same as Golang's
    [object-oriented programming](http://en.wikipedia.org/wiki/Object-oriented_programming)
    (OOP) model:

    * *Object templates* are fundamentally classes

    * *Objects* are simply hashtables (actually they are
      [*atoms*](http://clojure.org/atoms) that hold hashtables)

    * *Behaviors* are fundamentally *methods*

    * Behaviors *don't reside in objects*

    * Which behaviors could be applied upon which objects is defined by
      *tagging*:

      - Each object has a set of *tags*, which can be added or removed

      - Each tag has a set of behaviors, which can also be added or removed

      - If a behavior belongs to a tag, which in turns belongs to an object,
        that behavior could be called upon that object

    This model:

    * Is a re-implementation and a better version (IMHO) of OOP.  Actually
      it's **is** OOP,

    * Allows much more flexible type of method/behavior dispatching compared
      to the poor OOP models of C++, Java, PHP, Python, ...  (Have you used
      [CLOS](http://en.wikipedia.org/wiki/Common_Lisp_Object_System)?),

    * Allows adding/removing methods dynamically (just add/remove them from
      *tags*) without any special techniques or special runtime penalty,

    * Allows much better ways to instropect an object and its behaviors,

    * Allows much rapid development due to quick and easy ways of
      introspection mentioned above.

  * Operations:

    Taken from `src/lt/objs/jump_stack.cljs` as examples.

    - Create an object template with `lt.object/object*`

      ```clojure
      (lt.object/object* ::jump-stack
                         :tags [:jump-stack]
                         :stack [])
      ```

      Explanation:

      * `::jump-stack` is the name of the object template (or class name if
        you want to use traditional OOP term)

      * `:tags` is a vector of tag names, which is used to control its
        objects' *behaviors*.  `::jump-stack` will react to all *behaviors*
        added to `:jump-stack` tag.

      * `:stack` is its custom field, initially takes an empty vector as its
        value.