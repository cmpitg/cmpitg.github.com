---
layout: post
title: Ruby lambda and Proc
tagline: "#!/usr/bin/env ruby"
description: "Ruby lambda and Proc differences"
category: Ruby
tags: [ruby, proc, lambda, programming]
last_updated: Mon, 21 Oct 2013 15:11:09 +0700
---
{% include JB/setup %}

Some (most) important differences:

* A `lambda` is conceptually a method (though it's different from a `Method`):
  - It checks for the number of arguments
  - `return` from a `lambda` means, well, returning from a method
* A `Proc` is a control flow:
  - A code block is essentially a `Proc`
  - It doesn't check for the number of arguments
  - `return` from a `Proc` mean returning from its *enclosing block*

```ruby
def using_lambda
  my_lambda = lambda { return 'Return from a lambda' }
  my_lambda.call
  return 'End of using_lambda reached'
end

def using_proc
  my_proc = -> { return 'Return from a Proc' }
  my_proc.call
  return 'End of using_proc reached'
end

puts using_lambda       # => 'End of using_lambda reached'
puts using_proc         # => 'Return from a Proc'
```

So when to use `Proc`, and when to use `lambda`?  In my opinion, `Proc`'s
behavior is [leaky](http://en.wikipedia.org/wiki/Leaky_abstraction) and
unexpected, especially with the `return` statement.  Thus I would avoid `Proc`
and use `lambda` whenever possible.

For detailed examples and explanation, follow
[this excellent read](http://www.robertsosinski.com/2008/12/21/understanding-ruby-blocks-procs-and-lambdas/)
by [Robert Sosinski](https://github.com/robertsosinski).
