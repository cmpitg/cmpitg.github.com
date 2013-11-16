---
layout: page
title: Hướng dẫn Emacs
tagline: "#!/usr/bin/env emacs24"
category: Text_Editor
tags: [emacs, guide]
permalink: /emacs/
last_updated: Sat, 16 Nov 2013 10:40:39 +0700
---
{% include JB/setup %}

**Phiên bản hỗ trợ:** [GNU Emacs](http://www.gnu.org/software/emacs/) 24+

## Các khái niệm

* Emacs là một loại trình soạn thảo văn bản thô (plain text editor) và hơn thế
  nữa
* GNU Emacs là một implementation của Emacs
* Emacs Lisp là ngôn ngữ được sử dụng để lập trình (cùng với C) và tùy biến
  Emacs

## Lưu ý

Emacs Lisp là một
[ngôn ngữ rất tồi tệ](http://emacswiki.org/emacs/WhyDoesElispSuck).  Tuy nhiên
luôn có cách thức để sử dụng bất kỳ một dialect của
[Lisp](http://en.wikipedia.org/wiki/Lisp_programming_language) một cách
[đẹp đẽ](http://www.paulgraham.com/onlisptext.html).  Điểm khác biệt giữa Lisp
và các ngôn ngữ khác này nói một cách ngắn gọn:

* Mức độ mô tả chương trình của *hầu hết* các ngôn ngữ non-Lisp đều bị giới
  hạn bởi cú pháp.  Do đó khi giải quyết một bài toán, người giải luôn phải
  phân tích bài toán xuống mức độ chi tiết cần thiết, thậm chí đưa vào những
  thông tin làm *xấu* lời giải mới có thể lập trình được.

* [Các tính năng của Lisp](http://www.paulgraham.com/lisp.html) giúp Lisp trở
  thành một loại ngôn ngữ "tự lập trình chính nó" (programmable programming
  language).  Người viết chương trình bằng Lisp không những không cần thêm
  những bước chi tiết hóa không cần thiết mà còn có thể *biến đổi Lisp* để
  Lisp phù hợp với vấn đề cần được giải.  Đọc thêm
  [On Lisp](http://www.paulgraham.com/onlisptext.html) của
  [Paul Graham](http://www.paulgraham.com) để biết thêm chi tiết.

Tuy nhiên, trong hàng trăm loại Lisp dialect, tôi thấy có

* [Scheme](http://en.wikipedia.org/wiki/Scheme_%28programming_language%29) (và các dialect của Scheme)
* [Racket](http://en.wikipedia.org/wiki/Racket_%28programming_language%29)
* [Clojure](http://en.wikipedia.org/wiki/Clojure)
* [Arc Lisp](http://en.wikipedia.org/wiki/Arc_%28programming_language%29)
* [PicoLisp](http://en.wikipedia.org/wiki/Picolisp)

là *đẹp đẽ*.  Các Lisp khác (đặc biệt là Common Lisp và Emacs Lisp) đều gặp
phải vấn đề liên quan đến thiết kế ngôn ngữ, rất dễ để viết mã không trong
sáng và rất khó để viết mã đẹp.  Giá kể
[newLISP](http://en.wikipedia.org/wiki/Newlisp) được thiết kế khéo hơn một
chút (hỗ trợ cấu trúc dữ liệu kiểu hashtable-like, paradigm rõ ràng, ...) thì
newLISP cũng là một Lisp đẹp.

Trang này sẽ liệt kê các kỹ thuật giúp các bạn dùng và tùy biến Emacs tốt hơn.

## Tư duy khi viết Emacs Lisp

* API mặc định của Emacs Lisp rất tồi tệ và khó hiểu.  Chẳng hạn:
  - Khi muốn *mở tệp*, bạn phải dùng hàm `find-file`.  Ồ, tôi có muốn tìm tệp
    đâu mà lại bảo tôi dùng `find`?
  - Các hàm trả lại giá trị `t` hoặc `f` (`true`/`false`) lúc thì máy móc theo
    Common Lisp convention với hậu tố `-p`, lúc thì lại không.  Trong khi đó
    dấu `?` đẹp và dễ hiểu thế thì lại không dùng. So sánh: `installed-p` với
    `installed?` hoặc `is-installed?`

* Các hàm tự định nghĩa nên:
  - Đặt tên thật dễ hiểu
  - Mỗi hàm làm đúng một công việc duy nhất
  - Có documentation chi tiết
  - Có ký tự riêng để tránh tranh chấp với tên sẵn có (built-in hoặc do gói
    khác định nghĩa).  Chẳng hạn tất cả các nên do tôi đặt đều có `$` làm tiền
    tố.

## Emacs Package Manager

Emacs package manager là tính năng quản lý gói của Emacs, có sẵn từ Emacs 24 trở đi.

* Xác định xem một gói đã được cài hay chưa: Dùng hàm `(package-installed-p
  package-name)`.  Tôi thì lại thích đặt alias thành `($package-installed?
  package-name)`.

## Các kỹ thuật

Cách tốt nhất để bắt đầu là đọc các hướng dẫn tuyệt vời và cẩn thận của của
[Xah Lee](http://xahlee.org/):

* [Emacs Lisp Tutorial by Example](http://ergoemacs.org/emacs/elisp_basics.html)
* [Common Emacs Lisp Functions](http://ergoemacs.org/emacs/elisp_common_functions.html)
* [Emacs Lisp Idioms for Text_Editor Processing in Batch Style](http://ergoemacs.org/emacs/elisp_idioms_batch.html)
* [Emacs Lisp Idioms for Writing Interactive Commands](http://ergoemacs.org/emacs/elisp_idioms.html)

### Remap lại key dựa trên tên function

Theo
[GNU Emacs Lisp Reference](http://www.gnu.org/software/emacs/manual/html_node/elisp/Remapping-Commands.html):

* Khi bạn set:

  ```elisp
  (global-set-key (kbd "C-c") 'a-function)
  ```

  Điều này tương đương với:

  ```elisp
  (define-key (current-global-map) (kbd "C-c") 'a-function)
  ```

  Nghĩa là bất kỳ keybinding global nào được set bằng `global-set-key` cũng có
  thể được set bằng `define-key`.

* Remap hoạt động theo mode, để remap key thực hiện function `kill-line` sang
  function `my-kill-line`, dùng:

  ```elisp
  (define-key some-mode-map [remap kill-line] 'my-kill-line)
  ```

* Remap chỉ hoạt động ở *một mức*, tức là nếu bạn dùng:

  ```elisp
  (define-key some-mode-map [remap kill-line] 'my-kill-line)
  (define-key some-mode-map [remap my-kill-line] 'my-other-kill-line)
  ```

  Thì dòng remap thứ hai **không có tác dụng***, nghĩa là `kill-line` chỉ được
  remap thành `my-kill-line`.

* Để undo một remap, remap lại key thành nil:

  ```elisp
  (define-key some-mode-map [remap kill-line] nil)
  ```

### Thi hành shell command, đưa output ra temp buffer

Tham số thứ hai của `shell-command` định rõ output buffer, nếu là `t` thì
output sẽ được đưa ra buffer hiện tại:

```elisp
(with-temp-buffer
  (shell-command "cat ~/.emacs.d/init.el" t))
```

### Dùng `interactive` với giá trị mặc định

Hiểu cách thức `interactive`
[hoạt động](http://www.gnu.org/software/emacs/manual/html_node/elisp/Using-Interactive.html).

```elisp
(interactive (list ($read-string "File name (~/bin/): "
                           :initial-input "~/bin/")))
```

### Sử dụng keyword argument giống Common Lisp

http://curiousprogrammer.wordpress.com/2009/08/16/elisp-keyword-params/
