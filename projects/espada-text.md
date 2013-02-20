---
layout: page
title: Espada Text
description: Thoughts about writing a new text editor
last_updated: Thu, 21 Feb 2013 01:41:11 +0700
---
{% include JB/setup %}

This page is growing through time, if you're interested in the idea, besure to check it every 3 days.  Please shoot me *constructive* comments if you have some time to kill.

Current repository:

* [On Github](https://github.com/CMPITG/espada)
* [On Bitbucket](https://bitbucket.org/cmpitg/espada)

## Notes

* This page like a brain-dump, although it's more formal than a brain-dump and much less formal than an essay.

* I do make complaints about some languages at some points below.  This is purely my subjective opinion, *no offense towards the language creators and the community around the languages*.  Please kindly leave me a message if you feel offended and I apologize if you feel so.

* This is **not** an attempt to clone *Emacs*, *Vim*, *TextMate*, *Sam*, *Acme*, ... and the like.  My ambition is to combine the **best** of them all.

* The project focuses on **hackability**, **extendability**, and **elegance**.

## Reasons

* Many good text editors available but all of them don't really suite my need:
  - Emacs and Vim: see [the problems with Emacs and Vim](/pages/emacs-vim-problems.html).
  - [TextMate](http://macromates.com/): [open source](https://github.com/textmate/textmate), I have heard good things about it, no Linux port available yet (as of 2012/12).
  - [Sublime Text 2](http://www.sublimetext.com/): [not open source](problem-with-non-free.html).
  - [Kate](http://kate-editor.org/), [Gedit](http://projects.gnome.org/gedit/), [Geany](http://www.geany.org/), ...: if you have seen my [Emacs config](https://github.com/CMPITG/emacs-config), you will understand why.

* User experience: a (not really) different way people work with text editor:
  - Sam and Acme: TODO.
  - Gesture-based interaction
  - Effectively use of mouse:
    + As in Sam and Acme
    + Preventing [RSI](pages/rsi.html)
  - Infinite extensibility:
    + Fully hackable - full-feature programming environment. <- **target**.
    + Easily hackable.
  - Easy to use for both beginners and advanced users <- **target**.

* Promoting good languages as a killer application:
  - Like Emacs Lisp with Emacs.
  - Like Objective-C and the evil iThings.
  - Like Rails with Ruby.

* Promoting good programming practice:
  - [Functional programming](http://en.wikipedia.org/wiki/Functional_programming) style (TODO: explain why it's good)
  - Reducing the need for **overuse** of [OOP](http://en.wikipedia.org/wiki/Object-oriented_programming) without knowing exactly why it should (not) be used (TODO: explain)

## Name?

**Espada**:

- means *sword* in Spanish
- I love [Bleach](http://en.wikipedia.org/wiki/Bleach_%28manga%29) ;-)

## Difficulties

### In choosing language

* Libraries:
  - Requirements: [Rope](http://en.wikipedia.org/wiki/Rope_%28computer_science%29), well-supported mid-level GUI library at beta mature level at least.
  - Have to be available, time and resource are good excuses, and I want to focus on the text editor itself, not the things around.

Choosing a GUI library is actually what took most of my time, since I have to really dig into choices, try and compare.  Besides its availability and maturity significantly affect the language.

TODO: draw a table

* Language:
  - Candidates: [LiveScript](http://livescript.net/), JavaScript, Ruby, Python, Scala.
  - Cleanly designed and elegant.
  - More difficult to write bad code than good code.
  - Good in performance.  This part is hard to defined. (TODO: explain)

### Why Not a Lisp Dialect?

Candidates: Clojure, Racket, newLisp, PicoLisp.

TODO: explain

Notes:

* Macros are powerful but horribly ugly creatures.

* Extremely easy to write bad Lisp than good Lisp.  Good Lisp needs really thoughtful code.

* Subjective opinion: up to now (2012) I've never seen a problem which could be solved beautifully with macros or fexps couldn't be solved beautifully with functional style.

* Large Lisp programs tend to introduce so many layers of abstraction, which is a double-edged sword.  Otherwise you'd have ugly really Lisp programs.  This comes directly from my personal experience working with Lisp dialects, both for fun and for profit.  See [Paul Graham](http://paulgraham.com/)'s [On Lisp](http://www.paulgraham.com/onlisp.html) for more on this.

* Why not Clojure?
  - Not starting up fast enough.  Yet I have known no way to speed up.
  - Setting up process is a real pain.
  - It's impossible not to call Java - a real pain in the neck.

* Why not newLisp?
  - Contexts are terrible creatures, with class-like properties and global scope.  No  builtin dictionary/hash-table data structures.  I condider these two as newLisp's biggest design flaws.
  - After reading newLisp's source code, I don't trust it anymore.

* Why not Racket?
  - Large programs tend to be very noisy.
  - Very hard to keep large programs elegant and maintainable.  Perhaps *Espada* will have a community, but it surely starts from a one-man's work.

## Experiment Time!

Fragmented notes:

### Choosing a GUI library

* First thought: something related to [Node.js](http://nodejs.org):
  - [node-gir](TODO) is badly leaky.

### Misc

* Writing original JavaScript and preventing people from contributing bad JavaScript are probably not a very good idea.  I love JavaScript but the fact that it's [the world's most misunderstood programming language](http://www.crockford.com/javascript/javascript.html) concerns me a lot.

* *LiveScript* is awesome, however, the language is too fragmented and it's so easy to write bad code.
