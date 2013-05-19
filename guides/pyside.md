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

### Menu

Menus are managed by the `QMenu` class, menu bars are managed by the `QMenuBar` class.

* A *menu bar* contain one or more *menus*.

* Each *menu* contains one or more *actions* (managed by `QAction`) or *submenus* (which are simple *menus* managed by `QMenu`).

#### Creating a menu

A menu should be created with its parent.

```python
topMenu1 = QMenu(mainWindow)
topMenu2 = QMenu("This is the title of the menu", mainWindow)
```

#### Adding items

##### Adding actions

There are several ways to add actions into a menu:

```python
gotoDirAction = QAction("&Go to dir", menu)
gotoDirAction.triggered.connect(gotoDir)
menu.addAction(gotoDirAction)

action = menu.addAction("&Save file")
action.triggered.connect(saveFile)

actionWithIcon = menu.addAction(anIcon, "&Open file")
actionWithIcon.triggered.connect(openFile)
```

There are more ways to add actions to a menu.  Visit [PySide documentation](http://srinikom.github.io/pyside-docs/PySide/QtGui/QMenu.html#PySide.QtGui.PySide.QtGui.QMenu.addAction) or [Qt documentation](http://doc-snapshot.qt-project.org/qt5-stable/qtwidgets/qmenu.html) for further info.

My most recommended way of adding an action is the last example.
