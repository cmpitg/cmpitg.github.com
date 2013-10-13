---
layout: page
title: Python Idioms
tagline: "#!/usr/bin/env python3"
category: Programming_Language
tags: [python, guide]
permalink: /python/
last_updated: Sun, 13 Oct 2013 23:05:40 +0700
---
{% include JB/setup %}

*Note: This is an unpublished page*

**Supported Python version/implementation**: [CPython](http://en.wikipedia.org/wiki/Cpython) [3+](http://en.wikipedia.org/wiki/Py3k#Version_3.0)

## Notes

* I like Python to some extent, mostly for its relatively clean syntax, healthy community, practical uses, and well-supported in the *desktop* land.

* I don't like Python for its unconventional and inconsistent naming convention, especially conflict naming conventions in the standard library, broken syntax, limited supported for [functional programming practice](http://stackoverflow.com/questions/1017621/why-isnt-python-very-good-for-functional-programming) (thanks to [Guido](http://www.artima.com/weblogs/viewpost.jsp?thread=98196)'s [*dictatorship*](http://en.wikipedia.org/wiki/Benevolent_Dictator_For_Life), half-ass OOP (can you *ever* be able to do `1.to_str()`?), ...), ...

* Forget what I love and hate about Python, use it and have fun!

* Good way to call [IPython](http://ipython.org/) is to use it with `qtconsole`, i.e. `ipython3 qtconsole`.

## Idioms

### Reimplement `__hash__` and `__eq__`

Purpose: to make the object hashable and `==`-able.

An easy and correct (though not efficient) way to implement them is to make use of tuple:

```python
class MyClass:
    def __key(self):
        return (self.attr1, self.attr2, self.attr3)

    def __eq__(x, y):
        return x.__key() == y.__key()

    def __hash__(self):
        return hash(self.__key())
```

To hash a `dict`, one way is to use `frozenset`:

```
d = { "a": 1, "b": 2 }
some_dict[frozenset(sorted(d.items()))] = 10
```

### Loading a Python file

* The most obvious way is to `exec` the content of the file you want to load,
  `execfile` was there in Python 2 but is removed in Python 3+, so:

  ```python
  def load_file(path, globals=None, locals=None):
     """Load a Python script."""
     with open(path, 'r') as script:
         exec(compile(script, path, 'exec'), globals, locals)
  ```

* Another way is to add the file path to `sys.path` and use `import` as a safe
  bet:

  ```python
  import os

  def load_file(path):
     """Import a Python script as a module."""
     dirpart = os.path.dirname(path)
     filepart = os.path.splitext(os.path.basename(path))[0]

     sys.path.append(dirpart)
     exec("import {0}".format(filepart))
  ```

### Capitalize a string

```python
def capitalize_str(str):
    """Return a copy of the capitalized version of the string."""
    return str[:1].upper() + str[1:]
```

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
