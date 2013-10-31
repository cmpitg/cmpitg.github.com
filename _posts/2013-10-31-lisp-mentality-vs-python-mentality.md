---
layout: post
title: Lisp mentality vs. Python mentality
tagline: "(void-function this)"
description: "Lisp vs. Python mentality @ PTL (Racket) mailing list archive"
category: lisp
tags: [racket, lisp, python, mindset]
last_updated: Thu, 31 Oct 2013 07:53:08 +0700
---
{% include JB/setup %}

Reading about [Racket](http://racket-lang.org) lately, I came across this
[interesting post](http://lists.racket-lang.org/users/archive/2009-April/032440.html)
on Lisp mentality vs. Python mentality:

> Well, there is a standard function called mismatch that does it, but I can't
> recommend it.  First of all, you don't know where that function's been.
> Anyone and their mother could have worked on it, did they have good, sound
> programming practice in mind when they wrote it?  Of course not.  Let's be
> real here, we have to implement this by hand.

```common-lisp
(defun lists-are-equal (a b)
  (or (and (not a) (not b))
      (and (= (car a) (car b)) (lists-are-equal (cdr a) (cdr b))))
```

> There, much better than the standard function, and better yet, it's in the
> *absolute minimal form possible*.  There is no way to express list
> comparison in a more reduced form.  It's almost erotic how awesome it is.
> I'm---whoa, ok, I'm getting a little excited now, settle down.  Well, come
> to think of it, that's really not that good.  First of all it's a function.
> I mean, it just sits there and does nothing till you call it.  How boring is
> that?  It can't react to the current situation.  Plus it compares all lists
> the same way, and that is really inefficient.  Every list compare is a new
> problem.  Different lists need different comparative strategies.  This
> function simply won't do.  I need a macro that can intelligently compile the
> right list compare methodology in.  For instance, if we want to compare two
> lists that are known at compile time, we don't want to waste time comparing
> them at runtime.  No, the macro must detect constant arguments and special
> case them.  Good start.  Now, we have to consider the conditions this
> comparison is being done under.  If the user is passing the result of a sort
> to this macro, it's almost certain that they are trying to see whether the
> lists have the same elements.  We can do that a lot more efficiently with a
> countset.  So let's have the macro check to see if the forms passed to it
> are all sort calls.  Better yet, let's check for my own powerful sort macro.
> Hmm.  Wait... I think my 4600-line sort macro already checks its calling
> context to see if its results are being fed to a list comparison.  I'll have
> to refactor that together with this macro.  Ok, good, now I am sure other
> users will eventually want to customize list comparison for their own use,
> after all every list comparison is different and I can't possibly anticipate
> all of them.  A user needs to be able to adapt to the situation, so it's
> vitally important to create a plug-in infrastructure to give them that
> flexibility.  Now, what about exceptions, there's a millions ways to deal
> with that...  ...and so on until eyelids can no longer stay open....
>
>
> Python programmer:

```python
a == b
```

> Next question.
>

Enough said!  Bravo Lisp!
