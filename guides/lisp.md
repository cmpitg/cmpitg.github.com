---
layout: page
title: Lisp Guide
tagline: "()"
category: Programming_Language
tags: [lisp, scheme, racket, common_lisp, guide]
permalink: /lisp/
last_updated: Sun, 27 Oct 2013 02:10:35 +0700
---
{% include JB/setup %}

## Common lisp

### Running a Lisp interpreter with GNU Readline

[GNU Readline](www.gnu.org/software/readline/) is a library that greatly
supports line-editing, adding features like fast jumping, command history, ...

By default many interpreter like SBCL doesn't come with Readline support.
Adding Readline to SBCL command line is actually very easy:

* Make user you have `rlwrap`.  Please refer to your OS's package management
  system for instruction on how to install `rlwrap`.  On a Debian-based
  system, `rlwrap` could be installed with:

  ```sh
  su -c 'aptitude install rlwrap
  ```

  or

  ```sh
  sudo aptitude install rlwrap
  ```

  or

  ```sh
  sudo apt-get install rlwrap
  ```

* Instead of invoking the interpreter alone with (like `sbcl`), use `rlwrap
  <interpreter>`.  E.g. with SBCL:

  ```sh
  rlwrap sbcl
  ```

This technique could be applied to many command line programs to add Readline
support.
