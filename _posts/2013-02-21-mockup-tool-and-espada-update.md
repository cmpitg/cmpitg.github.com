---
layout: post
title: Mockup tool and Espada update
tagline: "#!"
category: Design
tags: [espada, mockup, design]
last_updated: Thu, 21 Feb 2013 01:38:19 +0700
---
{% include JB/setup %}

In order for the [Espada](/projects/espada-text.html) to be at its best status possible, I need a mockup tool which helps me express design perpective for myself, and for anyone who's interested in the project.  I spent the whole evening just to find a piece I felt most comfortable.

LibreOffice Draw is not a GUI mockup tool, but it's my usual choice whenever I needed to sketch simple stuff, or make a diagram.  Fairly useful, but not reaching the standard for someone wants beauty, and the workflow is not flexible.  Up to now and I haven't found any way to change the default properties of a shape (and I doubt if it's possible at this time of writing), which copying and pasting could partly solve as an ugly solution.  No fancy widgets for GUI prototyping, and I decided to go for another piece.

Inkscape fell short the same way.  Very powerful tools and features for vector drawing, but when using to prototype GUI, for me it seemed to be overkilled.  Same thing happens for GIMP.

[Evolus' Pencil](http://pencil.evolus.vn/) seemed to be just the tool I needed.  With plenty of available widgets, packaged into stencils, simple interface, and very easy to use.  I've used Pencil as a Firefox extension a couple years ago but left it due to its bugs and the stagnancy of development when [Firefox broke its addon compability](http://support.mozilla.org/en-US/questions/886836) and [switched to rapid-release cycle](http://en.wikipedia.org/wiki/History_of_Firefox#Rapid_release).  There had been many improvements since (thanks to [tuanta](http://fedoraproject.org/wiki/User:Tuanta) who had some nice discussions with [Duong Thanh An](http://code.google.com/u/dgthanhan/), which incident I personally know) but unfortunately, the situation seemed not good enough for me to choose the software as my tool.  The newest version has a bug which prevents the document to be exported as PNG and ODT.  I have already tried with my Debian Wheezy 64-bit and Ubuntu 12.04 LTS 64-bit, both the standalone version and Firefox extension version with no difference.  The software is fantastic, but one significant bug makes it unusable for me.  I have [filed the bug](http://code.google.com/p/evoluspencil/issues/detail?id=545&sort=-id) and now waiting for the fix.  Poking around the project made me disappointed a bit.  There's no information about Pencil development on the main website, I only found [its Google Code project](http://code.google.com/p/evoluspencil) when I clicked on "Linux Builds" in the download page.  The [issue list page](http://code.google.com/p/evoluspencil/issues/list) contains 545 ones (including the one I submitted).  The oldest one was from 2008 and no further information since then.  I went for another choice.

After a while searching, I didn't find any good FOSS piece.  I went on and tried some online services.  A bit Googling took me to a couple of sites, but the one I liked the most was [Moqups](https://moqups.com/).  Easy to get started, straight to use, intuitive and simple, has the ability to export to PDF and PNG and save to local drive, Dropbox or Google Drive.  Users can also upload their own images as widget to add to the sketch.  You can also share your piece pretty quickly when you're done.  Registration took almost no time, just a few clicks and types.  For an amateur sketcher like me, Moqups is more than enough.  And here is the quick result of a mockup I needed for today, my apologies for being so bad at drawing:

<div style="align: center; text-align: center; font-style: italic;">
    <img src="https://raw.github.com/CMPITG/espada/experiment/concepts/text_buffer.png" alt="Espada Text Buffer" /><br />
    Espada Text Buffer mockup
</div>

<br />

The process took longer than I thought but sure rewarding.

A small note before this entry ends: I decided to public Espada via [Github](https://github.com/CMPITG/espada) (which is the mirror of [my Bitbucket repo](https://bitbucket.org/cmpitg/espada)).  The more I get familiar with [Mercurial](http://mercurial.selenic.com/), the more I prefer it to Git.  And part of the reason why I chose [Bitbucket](https://bitbucket.org/) in the first place was because almost I didn't want to make it public, and just few people knew of my [Bitbucket account](https://bitbucket.org/cmpitg) ;-).
