---
layout: page
title: Python Idioms
tagline: "#!/usr/bin/env python3"
category: Programming_Language
tags: [python, guide]
permalink: /python/
last_updated: 
---
{% include JB/setup %}

*Note: This is an unpublished page*

**Supported Python version/implementation**: [CPython](http://en.wikipedia.org/wiki/Cpython) [3+](http://en.wikipedia.org/wiki/Py3k#Version_3.0)

## Notes

* I like Python to some extent, mostly for its relatively clean syntax, healthy community, practical uses, and well-supported in the *desktop* land.

* I don't like Python for its unconventional and inconsistent naming convention, especially conflict naming conventions in the standard library, broken syntax, limited supported for [functional programming practice](http://stackoverflow.com/questions/1017621/why-isnt-python-very-good-for-functional-programming) (thanks to [Guido](http://www.artima.com/weblogs/viewpost.jsp?thread=98196)'s [*dictatorship*](http://en.wikipedia.org/wiki/Benevolent_Dictator_For_Life), half-ass OOP (can you *ever* be able to do `1.to_str()`?), ...), ...

* Forget what I love and hate about Python, use it and have fun!

## Idioms

### Expand path

Assume that your home directory is `/home/hello` and `/home/johndoe/tmp/` directory exists, given the following inputs

```python
"~"
"~johndoe"
"~johndoe/tmp/"
```

would produce the following outputs:

```python
"/home/hello/"
"/home/johndoe/"
"/home/johndoe/tmp/"
```

Function:

```python
from os import path as ospath

def expand_path(path):
    """Expand shell path to absolute path.  E.g.
expand_path("~")          # => Your home directory
expand_path("~johndoe")   # => "/home/johndoe/" if existed
    """
    return ospath.abspath(ospath.expanduser(path))
```
