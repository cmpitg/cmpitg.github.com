---
layout: post
title: Python scripting with modules
tagline: "#!/usr/bin/env python3"
description: "Scripting with Python, importing modules"
category: Python
tags: [python, python_sucks, programming_language, idiom]
last_updated: Tue, 03 Jun 2014 15:14:21 +0700
---
{% include JB/setup %}

Supposed we have this directory structure:

```python
top_level/
   __init__.py
   say_hello.py
   main.py
```

With the following code as the content of `say_hello.py` and `main.py`
respectively:

```python
# top_level/say_hello.py
def say_hello_world():
    print("¡Hola mundo!")

```

```python
# top_level/main.py
#!/usr/bin/env python
from top_level.say_hello import say_hello_world


say_hello_world()

```

Then in `top_level/`, you execute `main.py` as a script:

```sh
python main.py
```

And it happens:

```
ImportError: No module named top_level.say_hello
```

Ask Python community and they would say it's a bad idea to call a script in
the middle of a package.  I don't actually give a crap about this argument
since it does nothing good than harmful, especially by restricting users to do
what they want and feel natural about.

There are 2 ways to resolve:

* Directly call the module with `python -m`:

  ```sh
  # Inside top_level/
  cd ..

  # Now we're outside
  python -m top_level.main
  ```

* Or poorly learn from the Ruby world be creating a wrapper *outside*
  `top_level/`:

  ```python
  # top_level/../run-script.sh

  if __file__ == "__main__":
      import top_level.main
  ```

See?  Python sucks.

*This post is noted as a port of my [Python guide](/guides/python)*
