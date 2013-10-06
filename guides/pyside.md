---
layout: page
title: PySide Idioms
tagline: "#!/usr/bin/env python3"
category: Programming
tags: [python, guide, idiom, qt, pyside]
permalink: /pyside/
last_updated: Sat, 05 Oct 2013 15:56:02 +0700
---
{% include JB/setup %}

**Supported Python version/implementation**: [CPython](http://en.wikipedia.org/wiki/Cpython) [3+](http://en.wikipedia.org/wiki/Py3k#Version_3.0)

## TODO

* TOC

## Notes

This guide supports Qt on [\*nix](http://en.wikipedia.org/wiki/Unix-like) platforms.  Specific notes for [Microsoft Windows®](http://en.wikipedia.org/wiki/Microsoft_Windows) and other non-\*nix platforms are not mentioned.

## Idioms

### Application

#### Retrieving the application instance

```python
QApplication.instance()
```

### Position & border

#### Removing widget margin

As simple as such:

```python
aWidget.setContentsMargins(0, 0, 0, 0)
```

#### Centering a widget

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

### Events & shortcuts

#### Catching the closing event of a widget

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

#### Creating a shortcut associated with a widget

This example will create a `pathEntry` widget and bind `Ctrl+L` to focus the `pathEntry`.

```python
pathEntry = QLineEdit()
focusShortcut = QShortcut(QKeySequence("Ctrl+L), pathEntry)
focusShortcut.activated.connect(pathEntry.setFocus)
```

#### Disabling right-click context menu

```python
aWidget.setContextMenuPolicy(Qt.NoContextMenu)
```

#### Re-catching keyboard event using event filter

A event filter needs to be reimplemented and installed into the current
widget.  Here is how key stroke events work:

* Each key press generates a key press event (where `event.type() == QEvent.Type.KeyPress`)

* Each key release generates a key release event (where `event.type() == QEvent.Type.KeyRelease`)

* Key modifiers are represented as integers:

    ```python
    [
        Qt.NoModifier,
        Qt.ShiftModifier,
        Qt.ControlModifier,
        Qt.AltModifier,
        Qt.MetaModifier,
        Qt.KeypadModifier,
        Qt.GroupSwitchModifier
    ]
    ```

* Each combination of key modifiers is produced by bit-wise `OR`-ing the
  integers representing those modifiers.  E.g. if *Control* and *Shift* are
  pressed, the value of this combination is `Qt.ShiftModifier | Qt.ControlModifier`.

* A key event includes:
  - the activated key, retrieving its string representation by using
    `event.key()`
  - the activated modifiers, is a integer produced by the bit-wise `OR`-ing
    operation, originally stored in `event.modifiers()` and can be retrieved
    by testing if a modifier contributes to forming `event.modifiers()`.

* The event filter needs to return `False` if it delegates the event for the
  widget itself to further processing and return `True` otherwise.

To sum up, the code might look like:

```python
class SomeWidget(QWidget):

    def __init__(self):
        # Do some stuff
        self.installEventFilter(self.eventFilter)

    def eventFilter(self, sender, event):
        """
        This event filter will take care of managing keyboard event of the
        TextEdit.
        """
        if isKeyPressEvent(event):
            key = getKeyFromEvent(event)
            mods = getKeymodsFromEvent(event)

            # Save the modifiers for mouse chord events
            self.pressedMods = mods

            # Discard events where modifiers and keys are the same
            if isKeymod(key):
                return False

            return self.processKey(key=key, mods=mods)

        elif isKeyReleaseEvent(event):
            # IMPORTANT: Notes that release is not caught when the window
            # manager interferes

            key = getKeyFromEvent(event)

            #
            # Used for mouse chords, release the modifier
            #
            if isKeymod(key) and toKeymod(key) in self.pressedMods:
                self.pressedMods.remove(toKeymod(key))

        #
        # Let the default event handler processes the event
        #
        return False
```

See [Blutkit](https://github.com/cmpitg/blutkit)'s implementation of
[TextEdit](https://github.com/cmpitg/blutkit/blob/master/blutkit/gui/textedit.py)
for more info about real-world use.

#### Catching mouse chords

Normally, catching simple mouse chords (single click, double click) is very
easy.  Things get complicated when you want to catch multiple-cursors chords
like `Left_Button-Right_Button` (hold down the left button, press the right
button, then release both).  [Acme](http://acme.cat-v.org) is one of the very
few editors that makes use of multiple-cursors mouse chords really well.  Here
is how we're gonna try tackling this problem using PySide.

At any point, we need to know *which buttons are pressed* and in **which
order**.  Assume that we're gonna use an array `mousePressedButtons` to store
that information.

The current pressed/released button is retrieved by `event.button()`.  Buttons
of a typical 3-button mouse are represented by the following Qt values:

```python
[
    Qt.LeftButton,
    Qt.MidButton,
    Qt.RightButton
]
```

The 2 methods we need to override are `mousePressEvent` and
`mouseReleaseEvent`:

* In `mousePressEvent`, we add the pressed button to `mousePressedButtons` and
  delegate the processing part to a method called `processKey`

* In `mouseReleaseEvent`, we remove the current activated button from
  `mousePressedButtons`

* We often want our mouse chords to be processed with keyboard modifiers, so
  `processKey` would take currently pressed keyboard modifiers and mouse
  buttons as its arguments.

* A double-click event doesn't generate the corresponding mouse press event,
  so you need to override it to manually add the pressed button to
  `mousePressedButtons`

* **Notes**:
  - We usually want the widget itself furthers processing the mouse chords
    (such as single click to move cursor to a different position, double click
    to select word, triple click to select line), so we call
    `super().mousePressEvent(event)` and `super().mouseReleaseEvent(event)` at
    the end of the 2 event handlers.
  - To correctly catch right click events, context menu needs to be disabled,
    see the *Disabling right-click context menu* part.
  - Double-click is a legitimate mouse press event and it does not generate a
    mouse press event, so usually everything handled in mouse press event
    needs to be handled in double-click event too.
  - The click-double_click events generate a mouse release event when the
    second button is released.  Sometimes it might interrupt the handler, so
    this mouse release event needs to be checked and handle properly.

Here is how the code looks like:

```python
def SomeWidget(QWidget):
    def __init__(self):
        # Do something
        self.mousePressedButtons = []

    #
    # Mouse chord catching
    #

    def isOneMouseButtonAlreadyPressed(self):
        """Determine if a mouse button has already been pressed and not yet
        released.  This function is useful when handling 2-button press
        event.
        """
        return len(self.mousePressedButtons) == 1

    def getMousePressedButtons(self, event):
        """Get currently pressed mouse buttons in correct order."""
        if not event.button() in self.mousePressedButtons:
            return self.mousePressedButtons + [event.button()]
        else:
            return self.mousePressedButtons

    def mouseDoubleClickEvent(self, event):
        """Handle all double click events."""
        # TODO: Define away to handle double click events

        # Double click means the clicked button is still pressed
        if not event.button() in self.mousePressedButtons:
            self.mousePressedButtons.append(event.button())

        #
        # If number of pressed buttons is more than 1, it's not an usual
        # double click event -> needed to treat like single click as well
        #
        if len(self.mousePressedButtons) != 1:
            self.processKeyCombination(mods=self.pressedMods,
                                       mouse=self.mousePressedButtons)
            return

        super().mouseDoubleClickEvent(event)

    def mousePressEvent(self, event):
        """Handling all kinds of mouse press events."""

        pressedButtons = self.getMousePressedButtons(event)
        self.mousePressedButtons.append(event.button())
        self.processKeyCombination(key=None,
                                   mods=self.pressedMods,
                                   mouse=self.mousePressedButtons)
        super().mousePressEvent(event)

    def mouseReleaseEvent(self, event):
        """Handling mouse release event by unregistering the pressed
        button."""
        #
        # Strange case: Left-Left-Middle
        # * Expected: select word, then cut
        # * Real: select word, cut, then paste right after Middle is
        #   released:
        #
        # Cause: the Middle release event is further processed by default
        # event handler
        #
        # Solution: only delegate the event to super class when number of
        # pressed buttons before the release event is emited is 1
        #

        nButtonsBefore = len(self.mousePressedButtons)

        if event.button() in self.mousePressedButtons:
            self.mousePressedButtons.remove(event.button())

        # Disable default "middle-click to paste" if necessary
        if len(self.getMousePressedButtons(event)) == 1 \
           and event.button() == Qt.MidButton \
           and not self.midClickXPaste:
            return

        # Solution to strange case mentioned above
        if nButtonsBefore == 1:
            super().mouseReleaseEvent(event)
```

See [Blutkit](https://github.com/cmpitg/blutkit)'s implementation of
[TextEdit](https://github.com/cmpitg/blutkit/blob/master/blutkit/gui/textedit.py)
for more info about real-world use.

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

### Text Edit widget

* All text manipulation is done using a `QTextCursor`, received by
  `textEdit.textCursor()`.  After done, the text cursor needs to be re-set to
  replace current cursor using `textEdit.setTextCursor(cursor)`:

     ```python
     cursor = textEdit.textCursor()
     # Do something with cursor
     textEdit.setTextCursor(cursor)
     ```

#### Selecting current line

```python
class MyTextEdit(QTextEdit):

    def selectLine(self):
        """Select the current line."""
        cursor = self.textCursor()
        cursor.movePosition(QTextCursor.StartOfBlock)
        cursor.movePosition(QTextCursor.EndOfBlock, QTextCursor.KeepAnchor)
        self.setTextCursor(cursor)
```

### Clear current selection

```python
class MyTextEdit(QTextEdit):

    def clearSelection(self):
        """Clear the current selection."""
        cursor = self.textCursor()
        cursor.clearSelection()
        self.setTextCursor(cursor)
```
