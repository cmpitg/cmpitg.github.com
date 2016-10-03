---
layout: post
title: Loading main function in Racket
tags: [racket]
last_updated: Sat, 01 Mar 2014 23:44:02 +0700
---

**Updated on Sat, 01 Mar 2014 23:37:57 +0700**: Thanks to
[Takikawa-san](https://github.com/takikawa) (asumu on IRC) for pointing out
the use of `main` submodule.  Now all you have to do is to declare a `main`
submodule:

```racket
#lang racket

(module+ main
  (displayln "¡Hola mundo!"))
```

And you can run `racket` command without any argument to achieve the same
effect:

```sh
racket a-module.rkt
```

---

This is the question I've encountered several times helping people learning
Racket.  The default behavior is a little unexpected, so I think I'd note it
here as a short entry for whom it may be of help.

If you're coming from the Python world, you'd probably write a Python code as
followed:

```python
#!/usr/bin/env python

# Some code
# ...

if __name__ == "__main__":
    run_this_module_as_script()
```

Meaning your Python module could be executed as script.
`run_this_module_as_script()` is called only when this module is treated as
script.

The same technique could be performed by Rubyists though it's highly
discouraged since the standard Ruby design pattern is to separate modules and
scripts:

```ruby
#!/usr/bin/env ruby

# Some code
# ...

if __FILE__ == $0
    run_this_module_as_script
end
```

Let's get back to Racket.  Suppose we have this simple Racket module:

```racket
#lang racket

(provide main)

(define (main)
  (displayln "¡Hola mundo!"))
```

To achieve the same effect, reading `racket --help`, one might be tempted to use:

```sh
racket -m a-module.rkt
```

to run the `main` function, which (unexpectedly) fails.

[Inexperienced Racket programmers](http://stackoverflow.com/questions/6380327/how-do-you-load-a-file-into-racket-via-command-line)
might tell you to remove the `#lang` line and change it to a `require`.  This
works but your file is no longer a module, which most of the time is a
horrible idea.  If you don't know what it means, go read
[Racket references](http://docs.racket-lang.org/reference/module.html).
Unless you know exactly what you're doing, do **NOT** write non-module Racket.

Reading carefully, you'd see that the
[Racket guide](http://docs.racket-lang.org/guide/racket.html) shows that for
Racket to process other flags, you need to explicitly tell Racket to do so
with `-t`:

```sh
racket -tm a-module.rkt
```

And voilà!

Personally, I think it's a bad design decision as it surprises
[new users](http://en.wikipedia.org/wiki/Principle_of_least_astonishment).
Still, that's how it's supposed to work for a long time.  Behaviors from the
Racket world don't follow other popular languages.  Sometimes they're better,
and sometimes they're worse.  Watch out for these moments and always read the
documentation carefully.
