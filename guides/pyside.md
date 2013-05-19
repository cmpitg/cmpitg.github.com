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

### Icon

#### Creating an icon

Icons are managed by the `QIcon` widget.  An icon could be created from:

* a pixmap,
* an image file,
* or another icon (very fast).

```python
aPixMap = []
imagePath = "/path/to/your/image"

icon1 = QIcon(aPixMap)
icon2 = QIcon(imagePath)
icon3 = QIcon(icon1)
```

#### Setting icon for a window

This idiom is usually used to set icon for your top-level window

```python
aWindow.setWindowIcon(anIcon)
```
