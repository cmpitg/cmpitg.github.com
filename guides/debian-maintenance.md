---
layout: page
title: Debian Maintenance Idioms
tagline: "#!"
category: Operating_System
tags: [debion, maintenance, idiom]
permalink: /debian_maintenance/
last_updated: Sun, 27 Oct 2013 02:30:18 +0700
---
{% include JB/setup %}

*Note: This is an unpublished page*

## Notes

* This guide makes use of `sudo` instead of `su` for various reasons (TODO).

## Tasks

### Clean up APT cache

* To clean all the cached `*.deb` files: `sudo apt-get clean`.

* To clean all the no-longer-available cached `*.deb` files: `sudo apt-get autoclean`.

### Examine disk space ignoring symlinks

Simple mount your disk to a temporarily separated mount point and examine it.

* Install `baobab`:

  ```sh
  sudo aptitude install baobab
  ```

* Create a temp dir and mount your disk:

  ```sh
  mkdir /tmp/remove-me
  sudo mount /dev/sd<whatever> /tmp/remove-me
  ```

* Then use `baobab` to examine the mount point.

* (Optional) Unmount when done.
