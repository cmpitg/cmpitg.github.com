---
layout: page
title: PySide Idioms
tagline: "#!/usr/bin/env python3"
category: Programming
tags: [python, guide, idiom, qt, pyside]
permalink: /pyside/
last_updated: Thu, 13 Jun 2013 23:39:51 +0700
---
{% include JB/setup %}

**Supported Python version/implementation**: [CPython](http://en.wikipedia.org/wiki/Cpython) [3+](http://en.wikipedia.org/wiki/Py3k#Version_3.0)

## TODO

* TOC

## Notes

This guide supports Qt on [\*nix](http://en.wikipedia.org/wiki/Unix-like) platforms.  Specific notes for [Microsoft Windows®](http://en.wikipedia.org/wiki/Microsoft_Windows) and other non-\*nix platforms are not mentioned.

## Idioms

### Disabling context menu

```python
aWidget.setContextMenuPolicy(Qt.NoContextMenu)
```

### Retrieving the application instance

```python
QApplication.instance()
```

### Removing widget margin

As simple as such:

```python
aWidget.setContentsMargins(0, 0, 0, 0)
```

### Centering a widget

Centering a widget can be done by calculating the appropriate geometry for the current widget.  Notes that:

* The available geometry (desktop size, minus dock/panel/unplaceable area) could be retrieved by `QApplication.instance().desktop().availableGeometry()`

* To set the geometry of a widget, use `widget.setGeometry`

Example code:

```python
availGeometry = QApplication.instance().desktop().availableGeometry()
availWidth = availGeometry.width()
availHeight = availGeometry.height()

widget.setGeometry(QStyle.alignedRect(Qt.LeftToRight,
                   Qt.AlignCenter,
                   widget.size(),
                   availGeometry))
```

### Catching the closing event of a widget

The closing event is handled by method `closeEvent(self, event)` of a widget.  This technique is often used with a top-level widget (such as a `QMainWindow`) to change the way the application is closed.  Call `event.accept()` to let Qt do further processing to close the widget and call `event.ignore()` to prevent the widget from closing.

```python
class MyMainWindow(QWidget):

    def closeEvent(self, event):
        if self.maybeSave():
            self.writeSettings()
            event.accept()
        else:
            event.ignore()
```

### Creating a shortcut associated with a widget

This example will create a `pathEntry` widget and bind `Ctrl+L` to focus the `pathEntry`.

```python
pathEntry = QLineEdit()
focusShortcut = QShortcut(QKeySequence("Ctrl+L), pathEntry)
focusShortcut.activated.connect(pathEntry.setFocus)
```

### Disabling right-click context menu



### Tool button

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

##### Adding actions

There are several ways to add actions into a menu:

```python
gotoDirAction = QAction("&Go to dir", menu)
gotoDirAction.triggered.connect(gotoDir)
menu.addAction(gotoDirAction)

menu.addAction("&New file")
actions = menu.actions()
actions[len(actions) - 1].triggered.connect(newFile)

action = menu.addAction("&Save file")
action.triggered.connect(saveFile)

actionWithIcon = menu.addAction(anIcon, "&Open file")
actionWithIcon.triggered.connect(openFile)
```

There are more ways to add actions to a menu.  Visit [PySide documentation](http://srinikom.github.io/pyside-docs/PySide/QtGui/QMenu.html#PySide.QtGui.PySide.QtGui.QMenu.addAction) or [Qt documentation](http://doc-snapshot.qt-project.org/qt5-stable/qtwidgets/qmenu.html) for further info.

My most recommended way of adding an action is the last example.

##### Adding submenu

Submenus *are* menus, so adding submenus is pretty straightforward:

```python
menu.addMenu(systemMenu)

appMenu = menu.addMenu("Applications")
# Do something with appMenu

gameMenu = menu.addMenu(gameIcon, "Games")
# Do something with gameMenu
```

##### Showing/executing a menu

Showing/executing a menu means making the menu visible on the screen.  Usually, the visibility of the menu associates with the current position of the cursor/mouse. Thus,

* if the menu is showed at the current mouse position:

  ```python
  menu.exec(QCursor.pos())
  ```

  or using a `QMouseEvent e`:

  ```python
  menu.exec(e.globalPos())
  ```

* if the menu is aligned to a widget:

  ```python
  menu.exec(aWidget.mapToGlobal(QPoint(0, 0)))
  ```

Although you may specify directly the list of actions the menu shows using `exec`, it's not a recommended way.

There are cases when you want the menu to be displayed so that an action `someAction` will be at the specified global position `pos`.  Use `popup` then:

```python
menu.popup(pos, someAction)
```

##### Tearing-off the menu

Tearing off a menu means "extracting" the menu into a standalone widget and vice-versa.  Qt directly supports tear-off menu with `menu.setTearOffEnable(trueOrFalse)`.  The property could be accessed via `menu.isTearOffEnabled()`.
