---
layout: page
title: My Ideal System
tagline: "#!/usr/bin/env"
tags: [random, system]
permalink: /ideal-system/
last_updated: Fri, 31 Jan 2014 07:41:29 +0700
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

    Main arguments go first.  Optional modifiers take keyword forms:

    Some commands in Racket style:

    ```racket
    (list-dirs "./")
    (list-dirs "./" #:n-columns 1)
    (list-dirs "./" #:colorize #t)
    (copy {/tmp/file-a.rkt} {/tmp/file-b.rkt} {/tmp/new/})
    (copy {/tmp/new} {/tmp/new.backup} #:mode 'backup)      ; Recursively, keep permission, ...
    (copy (glob "/tmp/*") "/mnt/backup/tmp" #:recursive #t)
    ```

    Outer-most brackets maybe ignored.

    And how its settings look like:

    ```racket
    (colorize-list-dirs  #t)
    (colorize-everything #t)
    (alias 'copy (copy #:recursive #t))
    ```

    Note the use of `{}` for raw string.

    --> Clear and human-readable, could be understood fairly easily.  Be
    visually pleased is much more important than being stupidly short

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

  - Message format: JSON or BSON or YAML?
    * JSON doesn't support binary data by default.
    * YAML has [anchor](http://www.yaml.org/spec/1.2/spec.html#id2765878),
      particular useful to define reletional structure:
      - Do I really need it?
    * YAML is a superset of JSON --> No reason to not use YAML if JSON is good
    * YAML supports binary data with base64
      - A bit of overhead, but seem fine since it's mostly small and offline though

* GUI programming:
  - Scriptable.
  - Declarative style.
  - GUI server allows all languages to construct widgets.
