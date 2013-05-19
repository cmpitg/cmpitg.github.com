---
layout: page
title: PySide Idioms
tagline: "#!/usr/bin/env python3"
category: Programming
tags: [python, guide, idiom, qt, pyside]
permalink: /pyside/
last_updated: 
---
{% include JB/setup %}

*Note: This is an unpublished page*

**Supported Python version/implementation**: [CPython](http://en.wikipedia.org/wiki/Cpython) [3+](http://en.wikipedia.org/wiki/Py3k#Version_3.0)

## Notes

## Idioms

### Creating a shortcut associated with a widget

This example will create a `pathEntry` widget and bind `Ctrl+L` to focus the `pathEntry`.

```python
pathEntry = QLineEdit()
focusShortcut.QShortcut(QKeySequence("Ctrl+L), pathEntry)
focusShortcut.activated.connect(pathEntry.setFocus)
```

### `QToolButton`

This example create a `QToolButton` displaying an image from a pixmap, setting its tooltip action and assigning a shortcut.

```python
@slot
def quitAction():
    QApplication.instance().exit()


quitPixmap = []             # A pixmap

quitButton = QToolButton()
quitAction = QAction(quitPixmap, "Quit (Ctrl+X)", None)
quitAction.setShortcut(QKeySequence("Ctrl+X"))
quitAction.triggered.connect(quitApplication)
button.setDefaultAction(quitAction)
```
