---
layout: post
title: Rethinking *nix
tagline: "#!"
description: "Unix sucks"
category: Operating_System
tags: [*nix, rethink]
last_updated: Fri, 04 Oct 2013 23:34:35 +0700
---
{% include JB/setup %}

[The UNIX-HATERS handbook](http://wayback.archive.org/web/20120120031001/http://m.simson.net/ugh.pdf)
is a fantastic book about how suck *nix does, in terms of system design,
workflow, and user experience.  It totally changes the way I think about how I
work with an operating system, how the "do one thing and do it well" used to
be good but isn't relevant anymore.  I haven't finished the book, and I don't
want to give away the thoughtful and interestingly enjoying contents.  So all
I could say is find the book and enjoy if you really want to make use of it
practically: think differently and boost your performance.

You can also find a copy of the book [here](/archive/ugh.pdf).

This serves as a brain-dump I've got for a while but haven't reviewed it
thoroughly to make decision:

* I want to use **one** programming language as a global language for my
  system.  The language needs to satisfy the following criteria:
  - Is shell-friendly *and* can emulate shell behavior.  There are many
    reasons for this, and the 2 most important are:
    * Shell-scripts could be easily ported or made use (in case of complex
      scripts) without much change.  Although this leads to another problem
      with badly-written scripts (which GRUB 2 is one clear example)
    * The language has to be mature enough in terms of its eco-system.  I love
      building tools, but I need good small tools first.
  - Uses **interpreters** instead of compilers.  Compilers, build tools,
    stripping debugging symbols, no way to directly patch the program itself,
    ...  All sucks.  Or rather, they could be much better with an interpreted
    language.
  - Has good packaging system, where installing, patching, making, and
    deploying packages are simple and efficient.

* I want to make full use of hardware I'm having, including human-interface
  devices like keyboard and mouse, especially mouse chords and mouse gestures.
  Plan 9 and its editor Sam and Acme are great examples for this.

* GUI is cool, why not GUI?

* And more...

Having several choices at hands (Ruby, Python, Racket, and PicoLisp), I'll
start toying with them soon to realize the hope of a better environment.
