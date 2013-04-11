---
layout: page
title: Problems with Emacs &amp; Vim
last_updated: Sat, 22 Dec 2012 16:04:00 +0700
permalink: /emacs-vim-problems/
---
{% include JB/setup %}

## Notes

Some of my thoughts are already covered somewhere on the Internet, so I will just go ahead, link to them and add things which are not there yet.

## Emacs

* Emacs Lisp is a horrible language:

  - APIs are horribly designed and extremely un-user-friendly:

    + Say `find-file` when you want to *open* a file.

  - [Dynamic scoping](http://c2.com/cgi/wiki?DynamicScoping) is good evil, but there's no support for [lexical scoping](http://c2.com/cgi/wiki?LexicalScoping).

  - No namespace/modules/whatsoever.  Give me a break with all the `my-extension-*` function name!

  - [Horrible regular expression syntax](http://obsidianrook.com/devnotes/whinery/elisp-regexps.html).

  - Emacs Lisp documentation sucks!  No users are supposed to read several thousand lines of code to hack a(n) (builtin) extension.  Even when they did, why not documented it?  An example of this is the notorious [CEDET](http://cedet.sourceforge.net/).  Not convinced yet?  Please try finding a complete documentation about writing a new mode.

* Emacs is a memory-eater, especially when used with Slime.  My usual session usually has a memory peak of 250MB-300MB.  Hell, it's not even Visual $tudio!  I know I used a lot of extensions but it shouldn't consume that much.  Totally unacceptable!

* There has been no maintainable attempt to improve the UI of Emacs.  I've never been able to successfully compiled a cloned branch.  [UI boosts performance](https://encrypted.google.com/search?q=ui+boosts+performance&ie=utf-8&oe=utf-8&aq=t) you know.

* Starting a process in the background, and directing its standard output and standard error streams are all impossible.  Unfortunately, that's one of the most useful uses of Unix philosophy.

* Ever wonder why almost all Emacs extensions, even the simplest ones, are unnecessarily large and complex?

* No internal support for tab bar.  Please, I heard enough about the *undocumented speedbar*, [ECB](http://ecb.sourceforge.net/) requiring CEDET crap, ...  *I need my tab bar!*  The third-party tab bar extension is ugly (really, there's no way to make it prettier) and overly complicated.

* Working with splitted windows is unnatural.  Splitting a window makes all the buffers available on both the old one and the new one, frustrating me all the time.  Sublime Text has done this much better!
