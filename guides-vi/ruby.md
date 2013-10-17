---
layout: page
title: Hướng dẫn Ruby
tagline: "#!/usr/bin/env ruby1.9"
category: Programming_Language
tags: [ruby, guide]
permalink: /ruby/
last_updated: Thu, 17 Oct 2013 22:56:39 +0700
---
{% include JB/setup %}

**Phiên bản hỗ trợ:** [Ruby 1.9+](http://www.ruby-lang.org/en/)

## Các khái niệm

* [Ruby](http://en.wikipedia.org/wiki/Ruby_programming_language) là một ngôn
  ngữ lập trình
  [hướng đối tượng](http://en.wikipedia.org/wiki/Object-oriented_programming)
  *hoàn chỉnh*, ra đời vào năm 1995, thiết kế và implement bởi
  [松本行弘](http://en.wikipedia.org/wiki/Yukihiro_Matsumoto) (Matsumoto
  Yukihiro - hay *Matz*).

## Lưu ý

* Khác với
  [Java](http://en.wikipedia.org/wiki/Java_%28programming_language%29) đi bốc
  phét "Everything is an object" (mà thực tế thì chẳng phải vậy).  Ruby là
  ngôn ngữ hướng đối tượng "*hoàn chỉnh*".  Trong Java bạn không thể (và chắc
  là sẽ không bao giờ có cách) để làm được trò: `123.toString()`, mà trong
  Ruby và
  [Smalltalk](http://en.wikipedia.org/wiki/Smalltalk_programming_language) thì
  cú pháp tương ứng là `123.to_s` và `123 printString`.  Bạn có thể tranh cãi
  rằng `123` là một giá trị `primitive type` nên không gọi được method; và
  điều bạn nói không sai.  Thế nhưng `primitive type` của Java không phải là
  class, và giá trị `123` không phải là object; vì vậy khẩu hiệu *đáng tự hào*
  "Everything is an object" của Java là **bốc phét nặng**.

* Ruby là một trong số 3 ngôn ngữ tôi đề xuất bạn tìm hiểu, nếu bạn *thực sự
  nghiêm túc* muốn học & sử dụng *lập trình hướng đối tượng* (OOP).  Hai ngôn
  ngữ còn lại là
  [Smalltalk](http://en.wikipedia.org/wiki/Smalltalk_programming_language) và
  [Common Lisp](http://en.wikipedia.org/wiki/Common_Lisp).

* Rất nhiều người nói Ruby giống và chịu ảnh hưởng của
  [Perl](http://en.wikipedia.org/wiki/Perl).  Điều này là hoàn toàn chuẩn xác!
  Tuy nhiên nếu là tôi thì tôi sẽ bổ sung thêm: *Ruby là ngôn ngữ chịu ảnh
  hưởng tốt từ Smalltalk (cú pháp) và Perl (cách tư duy).*

## Môi trường

* Bạn có thể sử dụng bất kỳ môi trường lập trình nào để chơi với Ruby.
  [Netbeans](https://netbeans.org/),
  [Eclipse](http://en.wikipedia.org/wiki/Netbeans),
  [SCITE](http://en.wikipedia.org/wiki/Scite),
  [Notepad++](http://en.wikipedia.org/wiki/Notepad%2B%2B),
  [Geany](http://en.wikipedia.org/wiki/Geany),
  [Gedit](http://en.wikipedia.org/wiki/Gedit),
  [Vim](http://en.wikipedia.org/wiki/Vim_%28text_editor%29), ...  Tôi thì
  chuộng Vim và [GNU Emacs](http://en.wikipedia.org/wiki/Emacs#GNU_Emacs).
  Đến thời điểm viết guide này, tôi sử dụng Emacs cho Ruby hàng ngày.

## Các kỹ thuật

### Khi nào dùng `.`, khi nào dùng `::`?

Về bản chất, `.` là message operator và `::` là scope operator.  `::` cho phép
truy cập đến scope của một class hoặc object, trong khi `.` chỉ đơn thuần là
gọi method mà thôi.

Ví dụ sau đây trích dẫn từ
[Wikipedia](http://en.wikipedia.org/wiki/Scope_resolution_operator#Ruby)

```ruby
module Example
  Version = 1.0

  class << self # We are accessing the Module's singleton class
    def hello(who = "World")
       "hello #{who}"
    end
  end
end

Example::hello          # => "hello World"
Example.hello "hacker"  # => "hello hacker"

Example::Version        # => 1.0
Example.Version         # NoMethodError

#
# This illustrates the difference between the message (.) operator and the
# scope operator in Ruby (::) We can use both ::hello and .hello, because
# hello is a part of Example's scope and because Example responds to the
# message hello.
#

# We can't do the same with ::Version and .Version, because Version is within
# the scope of Example, but Example can't respond to the message Version,
# since there is no method to respond with.
#
```

### Khi nào dùng `singleton`, khi nào dùng `module`?

Một trong những tình huống tốt sử dụng
[Singleton](http://en.wikipedia.org/wiki/Singleton_pattern) và module là khi
bạn muốn đóng gói state vào trong một thực thể duy nhất.  Điểm khác nhau duy
nhất giữa singleton và module trong trường hợp này là quá trình initialization:
* của singleton được trì hoãn cho đến khi bạn tạo instance
* của module diễn ra ngay khi module được khai báo
