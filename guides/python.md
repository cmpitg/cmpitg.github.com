---
layout: page
title: Python Idioms
tagline: "#!/usr/bin/env python3"
category: Programming_Language
tags: [python, guide]
permalink: /python/
last_updated: Sat, 16 Nov 2013 11:20:44 +0700
---
{% include JB/setup %}

**Supported Python version/implementation**:
[CPython](http://en.wikipedia.org/wiki/Cpython)
[3+](http://en.wikipedia.org/wiki/Py3k#Version_3.0)

## Notes

* I like Python to some extent, mostly for its relatively clean syntax,
  healthy community, practical uses, and well-supported in the *desktop* land.

* I don't like Python for its unconventional and inconsistent naming
  convention, especially conflict naming conventions in the standard library,
  broken syntax, limited supported for
  [functional programming practice](http://stackoverflow.com/questions/1017621/why-isnt-python-very-good-for-functional-programming)
  (thanks to
  [Guido](http://www.artima.com/weblogs/viewpost.jsp?thread=98196)'s
  [*dictatorship*](http://en.wikipedia.org/wiki/Benevolent_Dictator_For_Life),
  half-ass OOP (can you *ever* be able to do `1.to_str()`?), ...), ...

* Forget what I love and hate about Python, use it and have fun!

* Good way to call [IPython](http://ipython.org/) is to use it with
  `qtconsole`, i.e. `ipython3 qtconsole`.

## (Not-so) FAQs

### `classmethod` vs. `staticmethod`

Stackoverflow question:
[What is the difference between @staticmethod and @classmethod in Python?](http://stackoverflow.com/questions/136097/what-is-the-difference-between-staticmethod-and-classmethod-in-python)

* `staticmethod`:
  - knows nothing about the class or instance,
  - basically useless, could completely be replaced by module function

* `classmethod`:
  - gets passed the class or instance it was called on,

### Decorator explanation

A decorator is **a callable** that **takes a function** as an argument and
**returns a replacement function**.  This is best illustrated with the
following code snippet:

```python
#
# function()
# -> replacement()
#

print("Case #1: function() -> replacement()")

def a_decorator(a_func):
    def replacement():
        ret = a_func()
        print("Result before decorated: {}".format(ret))
        return ret + 1
    return replacement


@a_decorator
def just_return_1():
    return 1


print("Result after decorated: {}".format(just_return_1()))

#
# function(an_arg)
# -> replacement()
#

print()
print("Case #2: function(an_arg) -> replacement()")

def one_becomes_zero_decorator(a_func):
    def replacement():
        ret = a_func(10)
        print("No more argument, a_func(10) is called.")
        return ret
    return replacement


@one_becomes_zero_decorator
def just_return_x(x):
    return x


print("Result after decorated: {}".format(just_return_x()))

#
# function(an_arg)
# -> replacement(same_arg)
#

print()
print("Case #3: function(an_arg) -> replacement(same_arg)")

def keeping_argument_decorator(a_func):
    def replacement(same_arg):
        ret = a_func(same_arg)
        print("Result before decorated: {}".format(ret))
        return ret - 100
    return replacement


@keeping_argument_decorator
def just_return_x_squared(x):
    return x * x


print("Result after decorated: {}".format(just_return_x_squared(20)))
```

### How to install Python 3 version of package via `pip`

From
[my answer at Stack Overflow](http://stackoverflow.com/questions/10763440/how-to-install-python3-version-of-package-via-pip/17266254#17266254):

* Install `setuptools` for Python 3 in case it's not installed yet.  For Debian-based:

  ```sh
  sudo aptitude install python3-setuptools

  # or
  su -c 'aptitude install python3-setuptools' -

  # or
  sudo apt-get install python3-setuptools
  ```

* With Python 2.4+, `easy_install` could be invoked with specific Python
  version by `python -m easy_install`, so `pip` for Python 3 could be
  installed by:

  ```sh
  sudo python3 -m easy_install pip

  # or
  su -c 'python3 -m easy_install pip' -
  ```

* Now you got `pip` 3, invoke it with its specific version, e.g.

  ```sh
  sudo pip-3.2 install pygments

  # or
  su -c 'pip-3.2 install pygments' -
  ```

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

```python
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

### Adding `classmethod` to class dynamically

By making use of `getattr` and `setattr`:

```python
getattr(x, 'y') == (x.y)
setattr(x, 'y', v) == (x.y = v)
```

```python
import types

class RandomClass(object):
    @classmethod
    def add_method(cls, func):
        return setattr(cls, func.__name__, types.MethodType(func, cls))


def say_hello(self, words):
    print(words)


RandomClass.add_method(say_hello)
RandomClass.say_hello('World from class!')

random_instance = RandomClass()
random_instance.say_hello('World from instance!')
```
