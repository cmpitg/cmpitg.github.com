---
layout: page
title: Racket
tagline: "(contract violation)"
category: Programming_Language
tags: [racket, guide]
permalink: /racket/
last_updated: Mon, 09 Dec 2013 22:00:51 +0700
---
{% include JB/setup %}

## Emacs integration

`#lang not enabled in the current context`

`C-c C-k` to compile first, then load all except for the `#lang` line: `C-c
C-r`.

## Idioms

### Raw strings

From
[this post](https://groups.google.com/forum/#!topic/racket-users/4h0RHjvuzYk)
on the Racket-user mailing list:

* Using [Scribble](http://docs.racket-lang.org/scribble/)'s `@` syntax:

  ```racket
  #lang at-exp racket

  (define s_ string-append)
  (display @s_{\This is a raw string\})
  ```

* Using [a library](https://github.com/jarnaldich/with-raw-string) written by
  Joan Arnaldich ([@jarnaldich](https://github.com/jarnaldich)):

  ```racket
  #lang with-raw-string racket #\$

  (directory-list $"\\SERVER\Share")           ; list unc paths under windows
  (directory-list $[c:\Program Files] )        ; use paring chars as delimiters
  (regexp-split (pregexp $'\s') "two fields")  ; -> '("two" "fields")
  ```

### Redirecting standard output

According to
[The Racket Guide](http://docs.racket-lang.org/guide/default-ports.html),
default ports could be retrieved with `(current-input-port)`,
`(current-output-port)`, and `(current-error-port)`.  They are actually
parameters, and thus could be `parameterize`d:

```racket
#lang racket

(define (display-to-string)
  (let ([output-port (open-output-string)])
    (parameterize ([current-output-port output-port])
      (display "Hello World"))
    (get-output-string output-port)))

(display (format "Result: ~a" (display-to-string)))
```

## FAQs

### When to use keywords and when to use symbols

From [Racket Guide](http://docs.racket-lang.org/guide/keywords.html):

> **Keywords** are intended for use (unquoted) as special markers in *argument
> lists* and in certain *syntactic forms*. For *run-time flags* and
> *enumerations*, use **symbols** instead of keywords

```racket
(define dir (find-system-path 'temp-dir)) ; not '#:temp-dir

(with-output-to-file (build-path dir "stuff.txt")
  (lambda () (printf "example\n"))
  ; optional #:mode argument can be 'text or 'binary
  #:mode 'text
  ; optional #:exists argument can be 'replace, 'truncate, ...
  #:exists 'replace)
```

### `print` vs. `write` vs. `display`

From [Racket Guide](http://docs.racket-lang.org/guide/read-write.html):

* `print` displays a value in its normal form,
* `write` displays a value in a form that `read` uses to read,
* `display` displays a value in human-readable form.