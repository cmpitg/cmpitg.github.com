---
layout: page
title: My Ideal System
tagline: "#!/usr/bin/env"
tags: [random, system]
permalink: /ideal-system/
last_updated: Thu, 30 Jan 2014 12:30:58 +0700
---
{% include JB/setup %}

* Shell: Racket

  - Smart autocompletion:
    * Automatically trigger in-place, e.g. when there being at argument that
      takes file path, a popup automagically appears for users to choose the file path
    * Searchable

  - Pipelines.

  - Human-readable command names and syntax.

  - Arguments are either *subcommands* or *modifiers*.  *Subcommands* and
    *modifiers* may take further arguments.

  - Smart job management with task killer and all.

* Main programming languages:
  - Compiled: Golang.
  - Interpreted: Racket.

* Inter-program communication:

  - There is a server that collects and dispatches messages:
    * Like DBus or Plan 9's plumber.
    * Message format? JSON or REST?

  - Each program implements the same IPC protocol.  TODO: make a graphics.

* GUI programming:
  - Scriptable.
  - Declarative style.
  - GUI server allows all languages to construct widgets.
