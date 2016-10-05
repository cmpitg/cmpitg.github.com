---
layout: post
title: RequireJS - An example of bad documentation
tags: [javascript, documentation]
last_updated: Wed, 05 Oct 2016 11:54:41 +0300
---

I have a Django project that makes moderate use of JavaScript to tabulate
output data and make AJAX calls.  [RequireJS](http://requirejs.org) is taken
into consideration to organize JavaScript code and improve its load time.
After reading the documentation for 2 days, I'm completely disappointed.  It's
an example of how documentation is so poorly written.  I have no intention of
contributing to the project to improve it since I'm having troubles
understanding myself.  Besides, I don't trust projects whose documentation is
not properly invested in.

Here are some quick notes:

* I tried first [Homepage](http://requirejs.org/).  Actually it has a good
  short description, immediately helping people understand what RequireJS is:

  > RequireJS is a JavaScript file and module loader. It is optimized for
  > in-browser use, but it can be used in other JavaScript environments, like
  > Rhino and Node. Using a modular script loader like RequireJS will improve
  > the speed and quality of your code.

* Following the link
  to [getting started page](http://requirejs.org/docs/start.html), a quick
  look points me to
  the [jQuery tutorial](http://requirejs.org/docs/jquery.html):

  > Note: If you are using jQuery, there is a targeted jQuery tutorial

  This is where things get ambiguous:

  > jQuery registers itself as the global variables "$" and "jQuery", even
  > when it detects AMD/RequireJS

  What's AMD?  I was more or less aware of JavaScript asynchronous module
  definition but it's **not** obvious it's the AMD the documentation
  mentions.

  > jQuery defines named AMD module 'jquery' (all lower case) when it detects
  > AMD/RequireJS. To reduce confusion, we recommend using 'jquery' as the
  > module name in your require.config.

  What's `require.config`?  They don't even use monospace font for inline
  code?

  ```javascript
  require.config({
      baseUrl: 'js/lib',
      paths: {
          // the left side is the module ID,
          // the right side is the path to
          // the jQuery file, relative to baseUrl.
          // Also, the path should NOT include
          // the '.js' file extension. This example
          // is using jQuery 1.9.0 located at
          // js/lib/jquery-1.9.0.js, relative to
          // the HTML page.
          jquery: 'jquery-1.9.0'
      }
  });
  ```

  Interesting, but

  * Where do I put this code?  Do I need to read RequireJS's original tutorial
    then come back?

  * What does `require.config` do?

  * The comments are detailed but poorly explain the concept.  What's that
    *module ID* and why do we need it?  I guess jQuery is loaded and assigned
    to the variable `jquery` but the whole function still doesn't make sense.

    If it's about using about using jQuery as global variable so why not
    something like:

    ```javascript
    jquery = require.config(...);
    // or
    $ = require.config(...);
    ```

    This RequireJS API sucks hard.

  Then, the documentation says the following snippet doesn't work:

  ```javascript
  // THIS WILL NOT WORK
  define(['lib/jquery'], function ($) {...});
  ```

  I don't even know what it does, not to mention how it should work and why it
  doesn't...

  > Example using shim config

  What on earth is this shim config?  Why don't they take a bit a of time and
  write a sentence or two to explain?  Instead of making me go to the API
  reference, where things are even more ambiguous?

  > Example loading jquery from a CDN

  Okay, perhaps this is what I need?

  > This example requires all your jQuery plugins to call define() to properly
  > express their dependencies. Shim config does not work after optimization
  > builds with CDN resources.

  Again, effing up with their own jargon.  I have no idea whatsoever what
  `define` does and I start to get the feeling that I no longer want to know.

  Anyway,
  let's
  [follow their example](https://github.com/requirejs/example-jquery-cdn)

  > This example shows one way to load jQuery and jQuery plugins with
  > require.js

  What is this project again?  Is it *RequireJS* or *require.js*.  Project
  structure `README.md` isn't even carefully formatted.  Again I don't know
  what `r.js` is.  Source code is fragmented and overcomplicated.

  Back to the jQuery tutorial, the next 2 sections are worse.  The code is
  formatted inconsistently compared to previous sections of the same page:

  ```javascript
  require(['jquery'], function( $ ) {
    console.log( $ ) // OK
  });
  ```

  ```javascript
  define(['jquery'], function (jq) {
      return jq.noConflict( true );
  });
  ```

* Back to original tutorial again, I no longer expected I could find something
  useful.  The code example is extremely brief and it explains nothing how I
  could leverage RequireJS (or require.js) for better (or worse).

* I spent time tinkering around the website and reading the API reference.
  Same problems: jargon-y terms, useless examples, overcomplicated logic,
  illogical flow of reading, ...

  I gave up.

Documentation is a way to communicate with people.  Writing good documentation
is hard, I understand, but it's not an excuse for not even trying.  Some rules
of thumb: Give clear explanation, give lots of examples with detailed
comments.

This entry was valid at this point it was written.  After 2 and a half year
(October 2016), I revisited the site and saw more or less the same crap.
Awful design, sloppy writing, poor examples.  My opinion stands.
