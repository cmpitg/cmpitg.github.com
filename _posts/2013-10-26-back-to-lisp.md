---
layout: post
title: Back to Lisp
tagline: "#!"
description: "Back to Lisp"
category: Lisp
tags: [common_lisp]
last_updated: Sat, 26 Oct 2013 01:01:47 +0700
---
{% include JB/setup %}

On the journey for **one language to rule them all**, I encountered my most
beloved and hatred language of all time.  Not only does Common Lisp suck
(which language doesn't anyway) but also does it suck really hard.  I
abandoned Common Lisp once because it's not the most beautiful piece I want to
write program in and it doesn't have a good eco-system.

But this post is not a rant on why and how Common Lisp sucks, there are people
who wrote about it much
[better](https://groups.google.com/forum/#!topic/comp.lang.lisp/GMx6gjESVZw[1-25-false])
and [deeper](https://soundcloud.com/zach-beane/peter-seibel-common-lisp) and
than me, and I share pretty the same sympathy with them all.  This post is a
quick recap of how I came back to Common Lisp to some extent.

Work is waiting ahead for me tomorrow, so excuse me for this rude brevity.
I'll write more about this matter in latter post.  For now, long story short:

[The UNIX-HATER handbook](http://en.wikipedia.org/wiki/The_Unix-Haters_Handbook)
has [enlightened](/operating_system/2013/10/04/rethinking-nix/) me greatly.
Helpless and powerless, I was stuck with my system, knowing it
super-unproductive but couldn't find the way to improve.  I didn't live in the
era of the [superior](http://www.youtube.com/watch?v=o4-YnLpLgtk)
[Lisp Machine](http://www.youtube.com/watch?v=NOysrxexTXg).
[Plan 9](http://en.wikipedia.org/wiki/Plan_9_From_Bell_Labs) and
[Inferno](http://en.wikipedia.org/wiki/Inferno_%28operating_system%29) have
their influence on the way I think of and work with a system, but nothing has
greatly inspired like how those Lisp Machine videos did.  All the live
debugging, online documentation (like **real documentation**, not those crappy
man pages), tight integration, live patching, ...  *I know what I want to do*.

On language side, I want to master (not like God, but like a
[Supreme Archangel](http://www.celestialheavens.com/viewpage.php?id=599)) a
language in which the code has to be

* **maintainable**,
* **readable**, and
* **extensible**

in a beautiful way.  It should have a good eco-system, in terms of community
and mature libraries.  It should support GUI programming well (although this
is not really a big problem if it doesn't, I can always use more than 2
languages for a program, or make use of
[Webkit](http://en.wikipedia.org/wiki/Webkit) and/or
[**the browser**](http://en.wikipedia.org/wiki/Firefox)).  Don't ask me why, I
care a lot about user experience, the way I interact with the system so I
could make the best out of it.  Several choices pop up in my mind:

* Racket,

* Python (just for practical purposes, I have lots of problems with Python
  lately due to its full of flaws design),

* Ruby (-1 due to the recent disappointment of violating the
  [POLA](http://en.wikipedia.org/wiki/Principle_of_least_astonishment), in
  case of [`lambda` vs `Proc`](/ruby/2013/10/21/ruby-lambda-and-proc/),
  slowness Gem server, and lots of 1.8-only and unsupported Gems),

* [Fancy](http://www.fancy-lang.org/)

* Emacs Lisp (do you know you can make
  [beautiful](https://github.com/cmpitg/emacs-config/blob/master/emacs-cmpitg-config/custom-functions.el)
  [stuff](https://github.com/trogdoro/xiki) out of a crappy Lisp?)

* and that bastard Common Lisp again

Not like in the past, when choosing a language was merely a hobby, it's a
*must* for me now due to the (desparately) need for (a) killer application(s).
Lisp is the family I care the most.  I started to look deeper into problems
could **only be solved beautifully** with Lisp (macros), especially
Scheme/Racket's [hygienic macro](http://en.wikipedia.org/wiki/Hygienic_macro)
system.  So much excitement to read
[On Lisp](http://www.paulgraham.com/onlisp.html),
[Practical Common Lisp](http://www.gigamonkeys.com/book/), and
[Land of Lisp](http://landoflisp.com/) again, with
[Realm of Racket](http://realmofracket.com/) joins my Lisp bookshelf.  This's
gonna take a couple of weeks to months for the choice to be solid.
Documenting will be served on the way!
