---
layout: post
title: Rethinking Espada
tagline: "#!"
category: Review
tags: [espada]
last_updated: Sat, 05 Oct 2013 02:25:19 +0700
---
{% include JB/setup %}

This entry's title is pretty random.  Don't let the title fool you.

It's been several days since the last commit to [Espada](/projects/espada/).  I have encountered several problems when extensively developing Espada in the last month.  Some problems lie in the [Qt library](https://qt-project.org/), but some of them were my own, here are 2 of my favorite:

* Weird behaviors in key capturing.  Detailed explanation could be found in the source code of the [TextEdit](http://goo.gl/AhqcY) widget.

* Random crash when using [QTreeView](http://qt-project.org/doc/qt-4.8/qtreeview.html) with Ruby's [qtbindings](https://github.com/ryanmelt/qtbindings).  This happened in both my Debian Wheezy 64-bit and Ubuntu 12.04 64-bit systems.  I have filed a [bug report](https://github.com/ryanmelt/qtbindings/issues/50).  Hopefully this will be fixed soon enough, before I reconsider my language and tool of choice for Espada.

I hacked Espada everyday and loved *every minute* of it.  Writing Ruby brought me great pleasure.  However, I'm facing serious problems with the Espada project and with my own code:

* Not following my own standard.  I was too tempted to see the result of my work everyday and didn't write any test.  Thanks to my friend [Serge](http://doesnotunderstand.org/) and [Hanoi Coding Dojo gang](http://hanoicodingdojo.github.io/), I learnt to appreciate the value of unit test and [TDD](http://en.wikipedia.org/wiki/Test-driven_development).  When Serge left Vietnam to come back to France, I (kinda) lost my motivation in Coding Dojo and I didn't organize any session.  My coding habit's slowly forgetting about tests, which resulted in a huge amount of unnecessary waste time.  Seriously, I and Hanoi Coding Dojo need a reboot.

* Horrible design.  In fact, the current version of Espada is just a bunch of spontaneous code with no design at all.  I haven't thoughts deeply enough until I built in myself and realized how bad it would be if I continue the way I'm doing right now.

* Lost of direction.  I couldn't count how many times I have asked myself what kind of text editor I would want to make.  I worked everyday with Emacs and Sublime Text 2 and wanted to bring **all** the good parts of those two into Espada, but it *won't work*, at least for near future, until Espada is able to be used to program itself.  I feel my creativity was somehow restricted by the tools I used everyday.

* Not documenting everything as I have planned.

* [RSI](http://en.wikipedia.org/wiki/Repetitive_stress_injury) bothered me **everyday**.  Couldn't be helped!

* Too much information, too little time to process.  This classic problem is a good yet unforgivable excuse.  I seriously need to learn to focus on one thing at a time.

* Failed resolutions.  Again, and always be the greatest problem. Failed resolutions.  Including no blog entry :-(.

Perhaps there are more, but that's all I can think of at the moment.  Man, I gotta be strict with myself much more!

And now, the baby-step solution, resolutions for the next few days:

* Rethinking Espada:
  - With careful mockup & use case, visualized as much as possible.
  - Carefully design Espada.  The current version is a failure but a good failure.  I don't mind throwing away my own code as I have learnt a lot from them.  This time is no exception.

* Redesign:
  - My page
  - Hanoi Coding Dojo homepage
  - [Hanoi Community Space homepage](http://khonggiancongdong.org/)

* Write at least once every week.

That's about it for now...
