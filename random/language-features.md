---
layout: page
title: Language Features
tagline: "#!/usr/bin/env"
description: Features that I want to have/implement in all languages I use
tags: [random, programming_language, feature, functional_programming]
permalink: /prog-lang/
last_updated: Wed, 04 Dec 2013 14:10:19 +0700
---
{% include JB/setup %}

This page is under heavy construction.

## Infinite Data Structure

Existed in: Clojure, Haskell

```clojure
(println (take 15 (cycle 1 2 3 4)))
```

```haskell
```

## Immutable Data Structure

Existed in: Clojure, Haskell, Racket

Immutable: Data can't be changed.
Persistent: Old data are preserved, using linked lists, ...

Has better performance in most cases, same objects are not created twice
(particularly useful for strings and hash access).

## Getting Rid of Assignments

http://docs.racket-lang.org/guide/set_.html
