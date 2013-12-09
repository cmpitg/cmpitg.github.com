---
layout: post
title: Redirecting standard output in Racket
tagline: "(contract-violation)"
description: "Redirecting standard output in Racket."
category: Racket
tags: [racket, racket_ports, redirect_output]
last_updated: Mon, 09 Dec 2013 22:30:32 +0700
---
{% include JB/setup %}

A long time ago, I tried to find a way to redirect standard output in Racket,
Google didn't give me the result I wanted.  Surprisingly now Google hasn't
still.  So I write this post with the hope that beginner Racketeers may
quickly find it through Google.

According to
[The Racket Guide](http://docs.racket-lang.org/guide/default-ports.html),
default ports could be retrieved with `(current-input-port)`,
`(current-output-port)`, and `(current-error-port)`.  They are actually
parameters, and thus could be `parameterize`d.  For example:

```racket
#lang racket

(define (display-to-string)
  (let ([output-port (open-output-string)])
    (parameterize ([current-output-port output-port])
      (display "Hello World"))
    (get-output-string output-port)))

(display (format "Result: ~a" (display-to-string)))
```

This comes in handy in an awful lot of situations.  One of the applications
that I personally use is to generate HTML from
[`xexpr`](http://docs.racket-lang.org/xml/#%28def._%28%28lib._xml/main..rkt%29._xexpr-~3estring%29%29)
with
[Neil's `html-template` library](http://www.neilvandyke.org/racket-html-template/).
By default, the `html-template` function writes to `current-output-port`.  I
frequently want the result to be in a string, so I write my own macro to
redirect:

```racket
#lang racket
(require (planet neil/html-template:2:2))

(define-syntax html-template-to-string
  (syntax-rules ()
    [(html-template-to-string body)
     (let ([output (open-output-string)])
       (html-template #:port output
                      body)
       (get-output-string output))]

    [(html-template-to-string body ...)
     (let ([output (open-output-string)])
       (html-template #:port output
                      (begin body ...))
       (get-output-string output))]))
```

This way, instead of writing

```racket
(html-template
 (html (head (link (@ (rel "stylesheet")
                      (href "bootstrap.min.css")))

             (title "Try something fun!"))
       (body (script (@ (src "bootstrap.min.js")))
             (script (@ (src "jquery-latest.min.js"))))))
```

I write

```racket
(display (html-template-to-string
          (html (head (link (@ (rel "stylesheet")
                               (href "bootstrap.min.css")))

                      (title "Try something fun!"))
                (body (script (@ (src "bootstrap.min.js")))
                      (script (@ (src "jquery-latest.min.js")))))))
```

The above example demonstrates the use of output redirection directly with
`parameterize`.  In practice, it's exactly what
[`call-with-output-string`](http://docs.racket-lang.org/reference/port-lib.html#%28def._%28%28lib._racket/port..rkt%29._call-with-output-string%29%29)
does, so you might want to use this function instead.

This entry is saved in [my Racket guide](/guides/racket/) for future
reference.
