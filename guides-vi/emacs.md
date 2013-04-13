---
layout: page
title: Hướng dẫn Emacs
tagline: "#!/usr/bin/env emacs24"
category: Text_Editor
tags: [emacs, guide]
permalink: /emacs/
last_updated: Sat, 13 Apr 2013 08:23:34 +0700
---
{% include JB/setup %}

*Lưu ý: Trang này chưa được công bố ;-)*

**Phiên bản hỗ trợ:** [GNU Emacs](http://www.gnu.org/software/emacs/) 24+.

## Các khái niệm

* Emacs là một loại trình soạn thảo văn bản thô (plain text editor) và hơn thế nữa
* GNU Emacs là một implementation của Emacs
* Emacs Lisp là ngôn ngữ được sử dụng để lập trình (cùng với C) và tùy biến Emacs

## Lưu ý

Emacs Lisp là một [ngôn ngữ rất tồi tệ](http://emacswiki.org/emacs/WhyDoesElispSuck).  Tuy nhiên luôn có cách thức để sử dụng bất kỳ một dialect của [Lisp](http://en.wikipedia.org/wiki/Lisp_(programming_language)) một cách [đẹp đẽ](http://www.paulgraham.com/onlisptext.html).  Điểm khác biệt giữa Lisp và các ngôn ngữ khác này nói một cách ngắn gọn:

* Mức độ mô tả chương trình của *hầu hết* các ngôn ngữ non-Lisp đều bị giới hạn bởi cú pháp.  Do đó khi giải quyết một bài toán, người giải luôn phải phân tích bài toán xuống mức độ chi tiết cần thiết, thậm chí đưa vào những thông tin làm *xấu* lời giải mới có thể lập trình được.

* [Các tính năng của Lisp](http://www.paulgraham.com/lisp.html) giúp Lisp trở thành một loại ngôn ngữ "tự lập trình chính nó" (programmable programming language).  Người viết chương trình bằng Lisp không những không cần thêm những bước chi tiết hóa không cần thiết mà còn có thể *biến đổi Lisp* để Lisp phù hợp với vấn đề cần được giải.  Hãy đọc thêm [On Lisp](http://www.paulgraham.com/onlisptext.html) của [Paul Graham](http://www.paulgraham.com) để biết thêm chi tiết.

Tuy nhiên, trên góc nhìn của tôi thì trong hàng trăm loại Lisp dialect, có:

* [Scheme](http://en.wikipedia.org/wiki/Scheme_%28programming_language%29) (và các dialect của Scheme)
* [Racket](http://en.wikipedia.org/wiki/Racket_%28programming_language%29)
* [Clojure](http://en.wikipedia.org/wiki/Clojure)
* [Arc Lisp](http://en.wikipedia.org/wiki/Arc_%28programming_language%29)
* [PicoLisp](http://en.wikipedia.org/wiki/Picolisp)

là *đẹp đẽ*, còn các loại Lisp khác đều xấu điên, trong đó Common Lisp và Emacs Lisp là bẩn nhất.  Giá kể [newLISP](http://en.wikipedia.org/wiki/Newlisp) được thiết kế khéo hơn một chút (hỗ trợ cấu trúc dữ liệu kiểu hash-like, paradigm rõ ràng, ...) cũng cũng thuộc loại đẹp.

Trang này sẽ liệt kê các kỹ thuật giúp các bạn dùng và tùy biến Emacs tốt hơn.

## Tư duy khi viết Emacs Lisp

* API mặc định của Emacs Lisp rất tồi tệ và khó hiểu.  Chẳng hạn:
  - Khi muốn *mở tệp*, bạn phải dùng hàm `find-file`.  Ồ, tôi có muốn tìm tệp đâu mà lại bảo tôi dùng `find`?
  - Các hàm trả lại giá trị `t` hoặc `f` (`true`/`false`) lúc thì máy móc theo Common Lisp convention với hậu tố `-p`, lúc thì lại không.  Trong khi đó dấu `?` đẹp và dễ hiểu thế thì lại không dùng. So sánh: `installed-p` với `installed?` hoặc `is-installed?`

* Các hàm tự định nghĩa nên:
  - Đặt tên thật dễ hiểu
  - Mỗi hàm làm đúng một công việc duy nhất
  - Có documentation ngắn gọn, dễ hiểu
  - Có ký tự riêng để tránh tranh chấp với tên sẵn có (built-in hoặc do gói khác định nghĩa).  Chẳng hạn tất cả các nên do tôi đặt đều có `$` làm tiền tố.

## Emacs Package Manager

Emacs package manager là tính năng quản lý gói của Emacs, có sẵn từ Emacs 24 trở đi.

* Xác định xem một gói đã được cài hay chưa: Dùng hàm `(package-installed-p package-name)`.  Tôi thì lại thích đặt alias thành `($package-installed? package-name)`.
