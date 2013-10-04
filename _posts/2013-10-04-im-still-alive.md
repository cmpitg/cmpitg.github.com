---
layout: post
title: I'm still alive
tagline: ""
description: ""
category: misc
tags: [email]
last_updated: Fri, 04 Oct 2013 14:40:35 +0700
---
{% include JB/setup %}

I'm still alive, back to email and developing fun stuff again.

Recently, I've been toying with lots of tools and ideas.  By far,
[Xiki](http://xiki.org) is among the most impressive.  The idea of
having a global text-based interface with expression-based interact
has been haunting me in the last few months.  Still chasing a
[better editor](/projects/espada), here are the list of new ideas I
have summed up to add to mine:

* Everything is *beautifully formatted* text (inspired by
  [Emacs](http://www.gnu.org/software/emacs/) and
  [Xiki](http://xiki.org))

* Actions are defined using patterns

* Full control of keyboard and mouse chords (inspired by
  [Acme](http://acme.cat-v.org/))

* Minimalism and cleanliness (inspired by
  [Chekhov's gun](http://en.wikipedia.org/wiki/Chekhov%27s_gun))

* Incremental development (inspired by Paul Graham's
  [Lisp in Web-Based Applications](http://ep.yimg.com/ty/cdn/paulgraham/bbnexcerpts.txt),
  a copy version of it could be found
  [here](/archive/paul_graham_lisp_in_web.txt))

I intended to integrate all these features into
[Escudo](https://github.com/cmpitg/escudo/) and eventually ended up
developing a [wrapper](https://github.com/cmpitg/blutkit) for PySide
(Python 3 + Qt) for personal use.

[Bogoengine](/projects/bogoengine) is nearly dead while not being
feature-completed.  Writing C is good but not particularly fun.  I
have implemented a small UTF-8 and unit test libraries for Bogoengine.
No more bloating, no more dependencies, more more complicated build
tool.  Plain makefiles are great!  I also want to write an
experimental version in [Chicken Scheme](http://call-cc.org) which
compiles to C.  Let's see how it goes.

*Random notes*: Back to Lisp again, I feel I really need a boost.  A
method for good practicing is needed, and judge system is the first
thing comes to my mind.  Writing a new one seems to be a neat idea
:-).
