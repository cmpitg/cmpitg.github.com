---
layout: post
title: Common Lisp - Finding all functions in a package
tagline: "#!"
category: Common Lisp
tags: [cl, common-lisp]
last_updated: Sun, 30 Aug 2015 23:07:50 +0300
---
{% include JB/setup %}

On the way to resume the development of TODO|Ulquikit, I needed a way to
retrieve all functions from a package so that a Ulquikit command could be
automatically detected and invoked when necessary.  Common Lisp doesn't
provide this out of the box.  However, it's very easy to build one with
`do-all-symbols`.

`do-all-symbols` takes the following form: `(do-all-symbols (symbol package)
*body)`, binding `symbol` to all symbols in `package` one at a time and
execute `body` each time.  A function symbol can be checked with `fboundp`,
which returns `t` if that symbol corresponds to a function.  We then have the
first working version below:

```lisp
(defun all-function-symbols (package)
  "Retrieves all functions in a package."
  (let ((res (list)))
    (do-all-symbols (sym package)
      (when (fboundp sym)
        (push sym res)))
    res))
```

Let's try it out:

```lisp
(defpackage #:foobar
  (:use :cl)
  (:export #:public-func))

(in-package #:foobar)
(defun private-func () (format t "A private function~%"))
(defun public-func () (format t "A public function~%"))

(in-package :cl-user)
(format t "~{~A~%~}" (all-function-symbols :foobar))
```

This simple implementation introduces two problems: 1) it returns imported
functions from other packages that the current package `use`s, and 2) it
doesn't check if `package` is a package designator.  Both are easily tackled.

The second problem could be solved by checking if the return value of
`(find-package package)` is not `nil`.  The first problem is then consequently
solved by capturing the return value of `find-package` and check if it's
`eql`-ed to the corresponding package of `sym` using `(symbol-package sym)`.
In short, the condition looks like:

```lisp
(when (and (fboundp sym)
           (eql (symbol-package sym)
                (find-package package)))
  ...)
```

Putting everything together:

```lisp
(defun all-function-symbols (package)
  "Retrieves all functions in a package."
  (when (find-package package)
    (let ((res (list)))
      (do-all-symbols (sym package)
        (when (and (fboundp sym)
                   (eql (symbol-package sym)
                        (find-package package)))
          (push sym res)))
      res)))
```
