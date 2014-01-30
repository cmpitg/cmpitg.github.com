---
layout: page
title: My Ideal System
tagline: "#!/usr/bin/env"
tags: [random, system]
permalink: /ideal-system/
last_updated: Thu, 30 Jan 2014 13:53:46 +0700
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
  - Interpreted: Racket and TypeScript

* Inter-program communication:

  - There is a server that collects and dispatches messages:
    * Like DBus or Plan 9's plumber.

  - Each program implements the same IPC protocol.  TODO: make a graphics.

  - Server types: Named pipe, or HTTP (lightweight?), or Unix domain socket?
    * Unix domain socket is better (more flexible) than named pipe?
      http://stackoverflow.com/questions/9475442/unix-domain-socket-vs-named-pipes
      - You can use them for more than two processes communicating (eg. a
        server process with potentially multiple client processes connecting);
      - They are bidirectional;
      - They support passing kernel-verified UID / GID credentials between processes;
      - They support passing file descriptors between processes; They support
        packet and sequenced packet modes.
    * Explanation of Unix domain socket and named pipe:
      http://unix.stackexchange.com/questions/75904/are-fifo-pipe-unix-domain-socket-the-same-thing-in-linux-kernel

  - Protocol: RESTful?

  - Message format: JSON or BSON?
    * JSON doesn't support binary data by default.

* GUI programming:
  - Scriptable.
  - Declarative style.
  - GUI server allows all languages to construct widgets.
