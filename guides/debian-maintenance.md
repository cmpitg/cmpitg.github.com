---
layout: page
title: Debian Maintenance Idioms
tagline: "#!"
category: Operating_System
tags: [debion, maintenance, idiom]
permalink: /debian_maintenance/
last_updated: Mon, 28 Oct 2013 17:00:18 +0700
---
{% include JB/setup %}

*Note: This is an unpublished page*

## Notes

* This guide makes use of `sudo` instead of `su` for various reasons (TODO).

## Tasks

### Install Infinality Freetype patch

[Infinality patches](http://www.infinality.net/blog/) is a collection of
patches to provide better font rendering and customization.

Thanks to [Xiao-Long Chen](https://github.com/chenxiaolong) for his
[repo](https://github.com/chenxiaolong/Debian-Packages) and
[Hadrons](http://tinyurl.com/nlk7ou7) the
[excellent installation instruction](http://forums.debian.net/viewtopic.php?f=16&t=88545),
we could now install Infinality on Debian in a couple of simple steps:

```sh
## We're gonna use sudo due to its superiority compared to su

# Install the basic requirement: Git and devscripts
sudo aptitude install git devscripts

# Clone the repo
cd /any/dir/
git clone https://github.com/cmpitg/infinality-debian-package.git

# Install and build dependencies
cd infinality-debian-package/freetype-infinality/
dpkg-checkbuilddeps
cd ../fontconfig-infinality/
dpkg-checkbuilddeps
# Then install them all

# Build the package
cd ../freetype-infinality/
./build.sh
cd ../fontconfig-infinality/
./build.sh

# And install all the .deb files
cd ../
sudo dpkg -i \
    freetype-infinality/*.deb \
    fontconfig-infinality/*.deb

# And reboot
sudo reboot
```

Tweak your setting in `/etc/profile.d/infinality-settings.sh`.

I have [forked](https://github.com/cmpitg/infinality-debian-package) Chen's
repository to add documentation on how to install the patches.

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
