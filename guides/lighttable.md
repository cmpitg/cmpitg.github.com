---
layout: page
title: LightTable experiment
category: Editor
tags: [editor, ide, lighttable, experiment]
permalink: /lighttable/
last_updated: Tue, 06 May 2014 01:12:02 +0700
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

  - Read more about them
    [here](http://www.chris-granger.com/2013/01/24/the-ide-as-data/)

  - BOT model is more or less the same as Golang's
    [object-oriented programming](http://en.wikipedia.org/wiki/Object-oriented_programming)
    (OOP) model:

    * *Object templates* are fundamentally classes

    * *Objects* are simply hashtables (actually they are
      [*atoms*](http://clojure.org/atoms) that hold hashtables)

    * *Behaviors* are fundamentally *methods*

    * Behaviors *don't reside in objects*

    * Behaviors are not called directly but rather via their *triggers*, which
      act like in an event system

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

    * Allows adding/removing/redefining methods dynamically (just add/remove
      *them from tags*) without any special techniques or special runtime
      penalty.

    * Allows much better ways to instropect an object and its behaviors,

    * Allows much rapid development due to quick and easy ways of
      introspection mentioned above.

    * Helps managing global states effectively.

  - My attempt in simplifying things:

    * *Object templates* ~ classes,

      *Objects* ~ objects (class instances),

      *Behaviors* ~ methods

    * To create an *object template*:

      ```clojure
      (lt.object/object* :shouter-template
                         :tags #{:shouter}
                         :words "¡Hola mundo!"
                         :init (fn [this]
                                 (println "> A silly object is created")))
      ```

      The object template `:silly-obj-template` can now be used to create new
      objects.

    * To create an object from *object template*:

      ```clojure
      (def shouter (lt.object/create :shouter-template))
      ```

      `lt.object/create` and `lt.object/object*` could be combined:

      ```clojure
      (def loud-shouter (lt.object/create
                          (lt.object/object* :shouter-template
                                             :tags #{:shouter}
                                             :words "¡Hola mundo!"
                                             :init (fn [this]
                                                     (println "> A silly object is created")))))
      ```

      This object and its siblings now can be referred using:

      ```clojure
      (lt.object/by-tag :shouter)

      ;; Or if you now the object ID.  It's recommended NOT to use this
      ;; function since object IDs are only valid within a session
      (lt.object/by-id 104) ```

    * To create a behavior, use `lt.macros/behavior`:

      ```clojure
      (lt.macros/behavior :shout
                          :triggers #{:do-shout}
                          :reaction (fn [this]
                                      (let [words (str (:words @this) "!!!")]
                                        (println words)
                                        words)))

      (lt.macros/behavior :greet-then-shout
                          :triggers #{:do-greet-then-shout}
                          :reaction (fn [this]
                                      (let [words (str "Hola, "
                                                       (:words @this)
                                                       "!!!")]
                                        (println words)
                                        words)))
      ```

    * To add behaviors to an object, there are several ways:

      1. Add a *tag* (a Clojure's
         [keyword](http://clojure.org/data_structures#Data%20Structures-Keywords))
         to the *object*, then add behaviors to that tag.

         E.g.

         ```clojure
         ;; Add tag to object
         (lt.object/add-tags shouter [:throwaway-tag])

         ;; Tag behaviors
         (lt.object/tag-behaviors :throwaway-tag :shout)
         ```

      1. Add behavior directly:

         ```clojure
         (lt.object/add-behavior! shouter :greet-then-shout)
         ```

  - Some constraints:

    * *Tags* can be added to *objects* only.  Adding tags to *object
      templates* will not change their instances' *tags*.


## Tips and tricks ##
