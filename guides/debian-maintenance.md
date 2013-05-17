---
layout: page
title: Debian Maintenance Idioms
tagline: "#!"
category: Operating_System
tags: [debion, maintenance, idiom]
permalink: /debian_maintenance/
last_updated: 
---
{% include JB/setup %}

*Note: This is an unpublished page*

## Notes

* This guide makes use of `sudo` instead of `su` for various reasons (TODO).

## Tasks

### Clean up APT cache

* To clean all the cached `*.deb` files: `sudo apt-get clean`.

* To clean all the no-longer-available cached `*.deb` files: `sudo apt-get autoclean`.
