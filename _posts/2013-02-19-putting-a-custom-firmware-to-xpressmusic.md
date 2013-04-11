---
layout: post
title: Putting a custom firmware into an XpressMusic
tagline: "#!"
category: Phone_Hacking
tags: [xpressmusic, custom_firmware]
last_updated: Tue, 19 Feb 2013 00:09:11 +0700
---
{% include JB/setup %}

## Foreword

Last weekends, I settled things down, preparing for the first workweek of the Lunar New Year, helping my brother putting a custom firmware on his [Nokia 5800 XpressMusic](http://en.wikipedia.org/wiki/Nokia_5800_XpressMusic).  Bro is no tech addicted, but his interest in tech was enough for him to get his hands dirty for these kinds of thing.

Victory loves preparation, and flashing a firmware is a dangerous process.  Besides, my brother is a high-school student (no financial income), who has an XpressMusic as his only phone, which means if he bricks it, he gotta manage to get another one by himself.  The default Symbian version on his phone is a bunch of crap, especially when it has something to do with the memory card, with laggish performance and memory card corruption all the time.  Though loving his phone, he really hates his OS.  He has this desire for replacing the OS for a while, but after reading about the process and the consequences (*bricking*) it might cause, he hesitated and merely gave up the idea.

The time came up when our mother (sort of) offered him a chance for a secondhand phone, with reasonable cost and lower hardware spec ('cause that's all she and I could afford), and encouraged him to take a shot.  With my support as his supervisor, he decided to spend his last holidays to flash his phone.

## The preparation

Some notes:

* Nokia Cooker and Nokia Firmware Editor serve the same purpose, so just use one of them.

* We couldn't install Phoenix because of the "dongle not found" crap.  Later I found out we need to use the pirate version to get rid of it.  All forum posts saying you should disable anti-virus software, ... were written by idiots, don't trust them!

* JAF contains malware, so we used it in KVM virtual machine, running an evaluation version of Windows, and deleted the whole VM when it's done.

Basically, what we needed was a bunch of software:

* [Nokia Cooker](http://www.symbian-toys.com/nokiacooker.aspx) - for modifying firmware
* [Nokia Firmware Editor](http://www.nokiabreak.com/download-nokia-firmware-editor-v0-3.html) - for modifying firmware
* JAF (link contains pirate software and malware, so I wouldn't post it here) - for flashing
* [Phoenix](http://www.cpkb.org/wiki/Nokia_Phoenix_Service_Software) - for flashing, we didn't use it though
* [Navifirm](http://www.symbian-toys.com/navifirm.aspx) - for downloading original firmware
* [Nokia Ovi Suite](http://www.comms.ovi.com/m/p/ovi/suite/index_my_my.html) - just for installing appropriate driver

And firmwares:

* [iDroid 9.1.4](http://www.symbiantweet.com/idroid-custom-firmware-for-nokia-5800-updated-to-v9-1-4)
* [Nokia Belle](http://www.symbiantweet.com/nokia-belle-custom-firmware-for-nokia-5800)
* [Symbian Anna](http://www.symbiantweet.com/symbian-anna-custom-firmware-v7-5-for-nokia-5800)
* An [unnamed custom firmware (CFW) for 5800](http://symbianvn.net/showthread.php?t=19057) found in a [Symbian VN forum](http://symbianvn.net/).

And tons of guides and tutorials.  As a documentation writer, I would say most of them were pieces of crap!  I only found some *usable enough* and post them here:

* [How to install custom firmware on Nokia N8](http://www.symbiantweet.com/video-tutorial-how-to-install-custom-firmware-on-nokia-n8).  This screencast made of the Pheonix Software, which we didn't 'cause we couldn't have it installed.

* [How To Flash Custom Firmware on Nokia Using “JAF” Tool](http://www.symbiantweet.com/how-to-flash-symbian-custom-firmware-on-nokia-using-jaf-tool) - Very nice piece from [Symbian Tweet](http://www.symbiantweet.com).

* [IDroid OS 9.1.4 firmware update for Nokia 5800](http://www.imserba.com/forum/idroid-os-9-1-4-firmware-update-nokia-5800-a-t204158/)

## The process

There were so much going on during session, so I would briefly describe what I think was useful in a followable steps:

### What we actually used

* Nokia Firmware Editor, to put Vietnamese to the firmware,
* Nokia Ovi Suite, to install drivers,
* Navifirm, to download stock firmware,
* JAF, to flash.

### Steps

* Check our phone's type: `*#0000#` -> *RM-356*.

* Install Nokia Ovi Suite, putting in the device to have appropriate drivers installed, then uninstall it.

* Install/run Navifirm, choose the right model (RM-356) and the right stock firmware (Vietnam RED), download it and copy it to somewhere safe.

* Create the folder: `%programfiles%\Nokia\phoenix\products\RM-356`, and copy the downloaded firmware files to it.

* Run Nokia Firmware Editor:

  - Open the firmware containing Vietnamese (Vietnam RED and some other firmwares we found), and `Extract`.

  - Wait for the files to finish loading.

  - Go to `Tools > Language Manager` and export Vietnamese.

  - Open the `resources/fonts` folder in the explorer and copy to somewhere safe.

  - Close and run Nokia Firmware Editor again.

  - Open the firmware to add Vietnamese, we did it several times, one with each firmware:

    + *iDroid*
    + *Nokia Bell*
    + *Symbian Anna*

  - Replace the `resources/fonts` with the version we've just copied.

  - Now `Repack/Rebuild` and close it.

* Install JAF and run it:

  - Turn off the phone and connect it to the computer using the USB cable.

  - Go to the *BB5* tab.

  - Check `Manual Flash`, `Dead USB`, choose `NORMAL` in `Mode`, and leave everything else unchecked.

  - Check `Use INI` and choose *RM-356*.

  - Choose the appropriate product code.

  - Then `Flash`, confirm by `Yes`, then quickly hold the power button for **1 second** to turn of the phone.  The flashing process begins.

  - When the message says `Done!`, disconnect it from the USB cable, take out the battery and put it in.  Power on.  Then test our phone.

We modified firmwares and flashed them (unmodified and modified version) for a couple dozens times so we could find the best firmware for the device.

### And the result

*iDroid* is a EU RED version, which is incompatible with the Vietnam RED model, causing boot loop and then frozen while booting.  That's so unfortunate as my brother expected it the most.  *Nokia Bell* couldn't boot.  *Symbian Anna* (Ukraine RED) worked well but having problems when displaying Vietnamese.  We ended flashing the unnamed CFW and up to now it provides what my brother needs just fine.

## Afterthought

This was the first time my brother did this kind of hacking.  There were some problems when he (we) tried without thoroughly understanding the process but luckily, everything went just as smooth as I expected.  We started from Saturday night til Sunday afternoon.  I gave him advice as he did the real job.  At the end of the long session, I asked him to note everything he did and blog about his experience but he seemed to be out of interest :-).  So I just go ahead and write.  It's been a while since I had this fun hacking smartphone.
