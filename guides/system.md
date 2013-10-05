---
layout: page
title: System Maintenance
tagline: "#!/bin/sh"
category: System
tags: [system, guide, shell]
permalink: /system/
last_updated: Sat, 05 Oct 2013 14:53:15 +0700
---
{% include JB/setup %}

## Notes

* I don't use [Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29), I use [Zsh](https://en.wikipedia.org/wiki/Zsh) with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) with lots of customizations.  See [Why Zsh is cooler than your shell?](http://www.reddit.com/r/linux/comments/1e4ozl/why_zsh_is_cooler_than_your_shell/) for a motivation of changing your shell to Zsh.

## udev

### Reloading udev rules

```sh
udevadm control --reload-rules
udevadm trigger
```

## Troubleshooting

### Zsh compinit: insecure directies

* Source: [a post on Zsh mailing list](http://www.zsh.org/mla/users/2008/msg00566.html).

* Solution:

  - Run `compaudit` to check which directories are considered insecure.
  - `chmod 755` (try w/out `-R`) to fix the permision.
