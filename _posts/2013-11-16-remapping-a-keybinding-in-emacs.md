---
layout: post
title: Remapping a keybinding in Emacs
tagline: "Emacs Rocks"
category: Emacs
tags: [emacs, emacs_lisp, elisp, keybinding]
last_updated: Sat, 16 Nov 2013 10:52:23 +0700
---
{% include JB/setup %}

Detailed instruction and notes were written clearly and carefully in
[Emacs Lisp Reference](http://www.gnu.org/software/emacs/manual/html_node/elisp/Remapping-Commands.html),
here are just some quick notes:

* To remap a keybinding, use the `remap` event:

  ```elisp
  (define-key some-mode-map [remap kill-line] 'my-kill-line)
  
  ;; or with global keybinding
  (global-set-key [remap kill-line] 'my-kill-line)
  ```

* Remap works on **one level** only, if the following snippet is `eval`-ed

  ```elisp
  (define-key some-mode-map [remap kill-line] 'my-kill-line)
  (define-key some-mode-map [remap my-kill-line] 'my-other-kill-line)
  ```

  Then the second line actually does **nothing**, i.e. `kill-line` is only
  remapped to `my-kill-line`.

* To undo remapping, remap again to `nil`:

  ```elisp
  (define-key some-mode-map [remap kill-line] nil)
  ```

A small note about `global-set-key`: using

```elisp
(global-set-key (kbd "C-c") 'a-function)
```

is equivalent to:

```elisp
(define-key (current-global-map) (kbd "C-c") 'a-function)
```

Which means all keybindings defined by `global-set-key` could be defined using
`define-key` with `(current-global-map)` is its mode map.

The Vietnamese instruction for remapping is saved in my
[Emacs guide](/guides-vi/emacs/).
