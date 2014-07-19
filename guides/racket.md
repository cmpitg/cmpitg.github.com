---
layout: page
title: Racket
tagline: "(contract violation)"
category: Programming_Language
tags: [racket, guide]
permalink: /racket/
last_updated: Sat, 19 Jul 2014 23:24:05 +0700
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

### Retrieve path of current running file ###

Thanks to
[StackOverflow](http://stackoverflow.com/questions/16842811/racket-how-to-retrieve-the-path-of-the-running-file):

```racket
#lang racket

(require racket/runtime-path)

(define-runtime-path +this-directory+ ".")

(displayln (~a +this-directory+))
```

### Change current directory ###

By `parameterize`ing `current-directory`:

```racket
#lang racket

(define (list-dir)
  (system* (find-executable-path "ls") "-lahF"))

(parameterize ([current-directory "/tmp/"])
  (list-dir))
```

### Run `main` function ###

#### New method ####

Thanks to suggestion from [Takikawa-san](https://github.com/takikawa) (asumu
on IRC):

```racket
#lang racket

(module+ main
  (displayln "¡Hola mundo!"))
```

And you can run `racket` command without any argument to execute the `main`
submodule:

```sh
racket a-module.rkt
```

#### Old method ####

Suppose we have this simple Racket module:

```racket
#lang racket

(provide main)

(define (main)
  (displayln "¡Hola mundo!"))
```

Reading `racket --help`, one might be tempted to use:

```sh
racket -m a-module.rkt
```

to run the `main` function, which fails, and it seems unexpected.  However,
the [Racket doc](http://docs.racket-lang.org/guide/racket.html) shows that for
Racket to process `-m`, you need to explicitly tell Racket to `require` and do
so with `-t`:

```sh
racket -tm a-module.rkt
```

Personally, I consider it as a bad design decision, but this is how it's
supposed to work.

**Small but important note:**
[Inexperienced Racket programmers](http://stackoverflow.com/questions/6380327/how-do-you-load-a-file-into-racket-via-command-line)
might tell you to remove the `#lang` line and change it to a `require`.  This
works but your file is no longer a module, which most of the time is a
horrible idea.  If you don't know what it means, go read
[Racket references](http://docs.racket-lang.org/reference/module.html).
Unless you know exactly what you're doing, do **NOT** write non-module Racket.

## FAQs ##

### When to use keywords and when to use symbols ###

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

### `print` vs. `write` vs. `display` ###

From [Racket Guide](http://docs.racket-lang.org/guide/read-write.html):

* `print` displays a value in its normal form,
* `write` displays a value in a form that `read` uses to read,
* `display` displays a value in human-readable form.

### `require`ing a module multiple times ###

From [Racket reference](http://docs.racket-lang.org/reference/require.html):

> No identifier can be bound multiple times in a given phase level by an
> import, unless all of the bindings refer to the same original definition in
> the same module.

This is a rather vague, highly-abstracted sentence.  Let's take

### Setting current working directory ###

Racket has this parameter called `current-directory` which determines exactly
that.  To do something with current working directory changed, dynamically
bind `current-directory` to the path you want:

```racket
(parameterize ([current-directory "/some/path/"])
  ...)
```

## Pitfalls ##

### `copy-directory/files` copies directory contents, not the directory itself ###

Demonstration:

```sh
ls /tmp/hello/
# -> hello.js hello.css
```

```racket
(copy-directory/files "/tmp/hello/" "/tmp/world/")
```

```sh
ls /tmp/world/
# -> hello.js hello.css
```

But we actually expect the `hello/` directory is copied itself, not its
contents.  To fix this, create `/tmp/world/hello/` first then do the copy:

```racket
(make-directory* "/tmp/world/hello")
(copy-directory/files "/tmp/hello/" "/tmp/world/")
```

And we're gonna have our desire behavior:

```sh
ls /tmp/world/
# -> hello
ls /tmp/world/hello/
# -> hello.js hello.css
```
