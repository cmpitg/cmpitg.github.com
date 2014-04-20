---
layout: post
title: RequireJS - An example of bad documentation
tagline: "#!"
description: "Quick notes about an example of bad documentation - RequireJS"
category: Documentation
tags: [javascript, requirejs, bad_documentation]
last_updated: Sun, 20 Apr 2014 23:33:58 +0700
---
{% include JB/setup %}

I have a Django project that makes moderate use of JavaScript to tabulate
output data and make AJAX calls.  [RequireJS](http://requirejs.org) was taken
into consideration to organize and optimize JavaScript code in the browser.
After reading the documentation and examples in 2 days, I'm completely
disappointed.  It's one of the good examples of how documentation could be
badly written.  I have no intention of improving it at the moment since I'm
having troubles myself understanding RequireJS to use with my own project.
Besides, I don't trust projects that are not user-friendly documented.
Perhaps I'd document right here in my blog only for new struggling users like
me.

Here are some quick notes:

* I tried first [Homepage](http://requirejs.org/).  Actually it's a good short
  description, helping people understand what RequireJS is immediately:

  > RequireJS is a JavaScript file and module loader. It is optimized for
  > in-browser use, but it can be used in other JavaScript environments, like
  > Rhino and Node. Using a modular script loader like RequireJS will improve
  > the speed and quality of your code.

* Then I follow the link and go to
  [getting started page](http://requirejs.org/docs/start.html), a quick look
  points me to the [jQuery tutorial](http://requirejs.org/docs/jquery.html):

  > Note: If you are using jQuery, there is a targeted jQuery tutorial

  This is where things get interesting:

  > jQuery registers itself as the global variables "$" and "jQuery", even
  > when it detects AMD/RequireJS

  What's AMD?  I used to read about JavaScript asynchronous module definition
  so but it's **not** obvious it's the AMD the documentation mentions.

  > jQuery defines named AMD module 'jquery' (all lower case) when it detects
  > AMD/RequireJS. To reduce confusion, we recommend using 'jquery' as the
  > module name in your require.config.

  What's `require.config`?  They don't even use monospace font to write inline
  variables?

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

  Interesting but:

  * Where do I put this code?  Do I need to read RequireJS's original tutorial
    then come back?

  * What does `require.config` do?

  * The comments provided are detailed, but what's that *module ID* and why do
    we need it?  My humble guess is that jQuery is loaded and assigned to the
    variable `jquery` but the whole function still doesn't make sense.

    It talks about jQuery using global variable and how to load jQuery, so why
    not something like:

    ```javascript
    jquery = require.config(...);
    // or
    $ = require.config(...);
    ```

  Then, it said the following example doesn't work:

  ```javascript
  // THIS WILL NOT WORK
  define(['lib/jquery'], function ($) {...});
  ```

  I don't even know what it does, not to mention how it works and why it
  doesn't work in this case.

  > Example using shim config

  What's shim config?  Why don't they take a bit a of time and write one
  sentence or two to explain?  Instead of making me go to API reference, where
  things are not even more clear?

  > Example loading jquery from a CDN

  Right, I think I found what I need.

  > This example requires all your jQuery plugins to call define() to properly
  > express their dependencies. Shim config does not work after optimization
  > builds with CDN resources.

  Again, messing with their own jargon for new users.  I have no idea whatever
  what `define` does and I start to get the feeling I don't want to, no more.
  Anyway, let's
  [follow their example](https://github.com/requirejs/example-jquery-cdn)

  > This example shows one way to load jQuery and jQuery plugins with
  > require.js

  Inconsistency in naming: *RequireJS* vs *require.js*.  Structure of project
  in `README.md` and paths aren't carefully formatted.  Again I don't know
  what `r.js` is.  Though there's explanation, I don't bother reading it
  anymore.  Source code is fragmented and overly-complicated.

  Back to jQuery tutorial, the next 2 sections are worse.  Code is formatted
  inconsistently compared to previous sections of the same page:

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

* Back to original tutorial, I no longer expected I could find something
  useful.  The code example is extremely brief and it explains nothing how I
  could make use of RequireJS (or require.js?) in a web page full of
  JavaScript modules.

  I gave up.

Take more time to write docs.  Documentation is a way to communicate with
people.  Give clear explanation, give examples, lots of examples with good
comments.

Writing is hard, good writing is even harder; but it shows how much you care
for your users.  Don't ever take it lightly.

P.S. Please note that this entry is valid at this point it's written.  It
might be improved anytime and all my points might no longer be relevant.
