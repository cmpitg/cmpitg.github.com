---
layout: page
title: System Maintenance
tagline: "#!/bin/sh"
category: System
tags: [system, guide, shell]
permalink: /system/
last_updated: Thu, 30 Jan 2014 06:59:07 +0700
---
{% include JB/setup %}

## Notes

* I don't use [Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29), I
  use [Zsh](https://en.wikipedia.org/wiki/Zsh) with
  [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) with lots of
  customizations.  See
  [Why Zsh is cooler than your shell?](http://www.reddit.com/r/linux/comments/1e4ozl/why_zsh_is_cooler_than_your_shell/)
  for a motivation of changing your shell to Zsh.

## udev

### Reloading udev rules

```sh
udevadm control --reload-rules
udevadm trigger
```

## Power saving

### Making Powertop changes permanent

* Run Powertop and tweak.

* Save Powertop output to a HTML file, besure to *run as root*:

  ```sh
  cd /tmp/
  powertop --html
  ```

  This will generate a `powertop-xxxxxxxxxx-xxxxxx.html` file

* Now, all the `echo` commands in the file are necessary commands to save the
  change, copy them all and put it in a script or your `rc.local`.

## Troubleshooting

### Zsh compinit: insecure directies

* Source: [a post on Zsh mailing list](http://www.zsh.org/mla/users/2008/msg00566.html).

* Solution:

  - Run `compaudit` to check which directories are considered insecure.
  - `chmod 755` (try w/out `-R`) to fix the permision.

### Debian - Release file is expired ###

This might happen due to the most 2 common reasons:

* Your mirror is broken, go ahead and check it, also check for the timestamp
* Your clock is wrong

One quick workaround is to run `aptitude` with
`Acquire::Check-Valid-Until=false`:

```sh
aptitude -o 'Acquire::Check-Valid-Until=false' update
```

And to make that change permanently, create a file in `/etc/apt/apt.conf.d/`
(e.g. `/etc/apt/apt.conf.d/99disablecheckvaliduntil`)

```
Acquire::Check-Valid-Until "false";
```
