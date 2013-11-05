---
layout: page
title: Racket
tagline: "(contract violation)"
category: Programming_Language
tags: [racket, guide]
permalink: /racket/
last_updated: Wed, 06 Nov 2013 01:51:29 +0700
---
{% include JB/setup %}

## Idioms

### Raw strings

From
[this post](https://groups.google.com/forum/#!topic/racket-users/4h0RHjvuzYk)
on the Racket-user mailing list:

* Using [Scribble](http://docs.racket-lang.org/scribble/)'s `@` syntax:

  ```scheme
  #lang at-exp racket

  (define s_ string-append)
  (display @s_{\This is a raw string\})
  ```

* Using [a library](https://github.com/jarnaldich/with-raw-string) written by
  Joan Arnaldich ([@jarnaldich](https://github.com/jarnaldich)):

  ```scheme
  #lang with-raw-string racket #\$

  (directory-list $"\\SERVER\Share")           ; list unc paths under windows
  (directory-list $[c:\Program Files] )        ; use paring chars as delimiters
  (regexp-split (pregexp $'\s') "two fields")  ; -> '("two" "fields")
  ```
