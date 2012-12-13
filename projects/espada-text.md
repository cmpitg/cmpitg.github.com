---
layout: page
title: Espada Text
description: Thoughts about writing a new text editor
last_updated: Thu, 13 Dec 2012 14:38:44 +0700
---
{% include JB/setup %}

This page is growing through time, if you're interested in the idea, besure to check it every 3 days.  Please shoot me *constructive* comments if you have some time to kill.

## Notes

* This page like a brain-dump, although it's more formal than a brain-dump and much less formal than an essay.

* I do make complaints about some languages at some points below.  This is purely my subjective opinion, *no offense towards the language creators and the community around the languages*.  Please kindly leave me a message if you feel offended and I apologize if you feel so.

* This is **not** an attempt to clone *Emacs*, *Vim*, *TextMate*, *Sam*, *Acme*, ... and the like.  My ambition is to combine the **best** of them all.

## Reasons

* Many good text editors available but all of them don't really suite my need:
  - Emacs and Vim: see [the problems with Emacs and Vim](/pages/emacs-vim-problems.html).
  - [TextMate](http://macromates.com/): [open source](https://github.com/textmate/textmate), I have heard good things about it, no Linux port available yet (as of 2012/12).
  - [Sublime Text 2](http://www.sublimetext.com/): [not open source](problem-with-non-free.html).
  - [Gedit](TODO-homepage), [Geany](TODO-homepage), ...: if you have seen my [Emacs config](TODO), you will understand why.

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
  - Like Objective-C and the evil iPlatforms.
  - Like Rails with Ruby.

* Promoting good programming practice:
  - [Functional programming](TODO) style (TODO: explain why it's good)
  - Reducing the need for [OOP](TODO) (TODO: explain why it's not good *in all situations*)

## Name?

**Espada**:

- means *sword* Spanish
- I love [Bleach](TODO) ;-)

## Difficulties

### In choosing language

* Libraries:
  - Requirements: [Rope](TODO), mid-level GUI library/framework at a mature level.
  - Have to be available, time is a good excuse, and I want to focus on the text editor itself.

TODO: draw a table

* Language:
  - Condidates: [LiveScript](TODO), JavaScript, Ruby, Python, Scala.
  - Cleanly designed and elegant.
  - More difficult to write bad code than good code.
  - Good in performance.  This part is hard to defined. (TODO: explain)

### Why Not a Lisp Dialect?

Candidates: Clojure, newLisp, PicoLisp.

TODO: explain

Notes:

* Macros are powerful but horribly ugly creatures.

* Easy to write bad Lisp than good Lisp.

* Subjective opinion: up to now (2012) I've never seen a problem which could be solved beautifully with macros of fexps couldn't be solved beautifully with functional style.

* Why not Clojure?
  - Not starting up fast enough.  Yet I have known no way to speed up.
  - Setting up process is ugly.

* Why not newLisp?
  - (Subjective) Contexts are horrible 

## Experiment Time!

Fragmented notes:

### Choosing a GUI library

* First thought: something related to [Node.js](http://nodejs.org):
  - [node-gir](TODO) is badly leaky.

### Misc

* Writing original JavaScript is not a good idea (TODO: explain why?), and preventing people from contributing bad JavaScript.

* *LiveScript* is awesome, however, the language is too fragmented and easy to write bad code.
