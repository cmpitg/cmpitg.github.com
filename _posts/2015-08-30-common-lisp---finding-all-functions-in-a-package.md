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
(let ((res (list)))
  (do-all-symbols (sym package)
    (when (fboundp sym)
      (push sym res)))
  res)
```
