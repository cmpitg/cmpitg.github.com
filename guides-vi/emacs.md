---
layout: page
title: Hướng dẫn Emacs
tagline: "#!/usr/bin/env emacs24"
category: Text_Editor
tags: [emacs, guide]
permalink: /emacs/
last_updated: Sat, 28 Dec 2013 21:35:55 +0700
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

## Các vấn đề gặp phải khi sử dụng Emacs

### Lỗi Helm: `Symbol's function definition is void: helm-log-eval-internal`

Theo cách xử lý
[issue đã được report trên Github](https://github.com/emacs-helm/helm/issues/354):
chuyển đến thư mục của Helm (thông thường là `~/.emacs.d/elpa/helm-[version]`
nếu bạn cài Helm từ ELPA), chạy `make` lại hoặc xóa hết các file `.elc` và
load lại `helm.el` là được:

```
# M-x eshell
cd ~/.emacs.d/elpa/helm-*/
rm -rf *.elc
load helm.el
```

## Các kỹ thuật

Cách tốt nhất để bắt đầu là đọc các hướng dẫn tuyệt vời và cẩn thận của
[Xah Lee](http://xahlee.org/):

* [Emacs Lisp Tutorial by Example](http://ergoemacs.org/emacs/elisp_basics.html)
* [Common Emacs Lisp Functions](http://ergoemacs.org/emacs/elisp_common_functions.html)
* [Emacs Lisp Idioms for Text_Editor Processing in Batch Style](http://ergoemacs.org/emacs/elisp_idioms_batch.html)
* [Emacs Lisp Idioms for Writing Interactive Commands](http://ergoemacs.org/emacs/elisp_idioms.html)

Khi cấu hình một thư viện, cách tốt nhất là đặt code cấu hình trong
`eval-after-load` để đảm bảo Emacs vẫn chạy ngay cả khi thư viện ấy chưa được
cài đặt.  Chẳng hạn để kích hoạt `eldoc-mode` trong các mode liên quan đến
Lisp:

```scheme
(eval-after-load 'eldoc
  '(progn
     (add-hook 'emacs-lisp-mode-hook        'turn-on-eldoc-mode)
     (add-hook 'lisp-interaction-mode-hook  'turn-on-eldoc-mode)
     (add-hook 'ielm-mode-hook              'turn-on-eldoc-mode)))
```

### Sử dụng `C-u` và gọi command khi viết Emacs Lisp

Về bản chất, `C-u` gọi hàm `universal-argument`, hàm này sẽ đặt giá trị
`current-prefix-arg` bằng số lần nhấn `C-u` sử dụng
[dynamic binding](http://en.wikipedia.org/wiki/Dynamic_binding) và trả lại giá
trị `nil` sau khi command được thực hiện xong.  Do đó, để viết Emacs Lisp thực
hiện lại quá trình này, mã nguồn sẽ có dạng sau:

```scheme
(let ((current-prefix-arg 1))
  (call-interactively 'some-function))
```

### Luôn sử dụng Sunrise Commander thay cho Dired

Có thể bạn chưa biết,
[Sunrise Commander](http://www.emacswiki.org/emacs/Sunrise_Commander) là một
file browser rất tuyệt cho Emacs.  Tuy nhiên, người dùng Sunrise có thể gặp
vấn đề: khi chuyển thư mục với `j`, mode tự động nhảy sang Dired rất phiền
toái.  Tính năng của Sunrise hoàn toàn có thể thay thế Dired và hơn thế nữa.
Để thay thế Dired bằng Sunrise khi mở thư mục thông thường, dùng:

```scheme
(setq-default find-directory-functions (cons 'sr-dired find-directory-functions))
```

### Kiểm tra dấu ngoặc thừa/thiếu

Sử dụng command/hàm `check-parens`.

### Chèn header vào đầu file

Rất thuận tiện, đặt biệt khi tạo một thư viện Emacs Lisp.  Dùng command/hàm
`auto-insert` để đạt được điều này.

### Tạo global mode cho một minor mode

Sử dụng `define-globalized-minor-mode`.  Chẳng hạn với
[`autopair`](https://github.com/capitaomorte/autopair), global mode được tạo
như sau:

```scheme
(define-globalized-minor-mode
  autopair-global-mode autopair-mode autopair-on)
```

`autopair-on` là hàm không nhận tham số, được gọi khi mode được kích hoạt.
Tham khảo trong documentation của `define-globalized-minor-mode` để biết thêm
chi tiết.

### Đặt docstring cho hàm của Emacs Lisp

Theo
[entry "Programmatically Setting Lisp Docstrings"](http://nullprogram.com/blog/2012/08/02/).

Thông thường, một hàm Emacs Lisp sẽ nhận tham số `docstring` ngay sau khi danh
sách tham số được khai báo:

```scheme
(defun this-is-a-dummy-function (&rest args)
  "And this is its docstring."
  nil)
```

Docstring *của một hàm* được lưu trong thuộc tính `function-documentation` của
symbol tên hàm đó.  Docstring *của một hàm* có thể được truy cập với hàm
`documentation`.

```scheme
(documentation 'this-is-a-dummy-function)
;; => And this is its docstring.

(documentation 'format)
;; => ...
```

Để đặt lại docstring cho một hàm, ta chỉ việc đặt lại thuộc tính
`function-documentation` của symbol tên hàm.

```scheme
(put 'this-is-a-dummy-function 'function-documentation
  "Hola mundo.")
(documentation 'this-is-a-dummy-function)    ;; => Hola mundo.
```

Tuy nhiên cần chú ý: sau khi đặt docstring sử dụng `put`, mỗi lần khai báo lại
hàm cần đặt lại docstring bằng `put` hoặc dùng

```scheme
(put 'name-of-the-function 'function-documentation nil)
```

thì docstring mới mới có hiệu lực.

### Bỏ tính năng tự động nhảy vào thư mục của `helm-find-files`

```scheme
(setq-default helm-ff-auto-update-initial-value nil)
```

### Remap lại key dựa trên tên function

Theo
[GNU Emacs Lisp Reference](http://www.gnu.org/software/emacs/manual/html_node/elisp/Remapping-Commands.html):

* Khi bạn set:

  ```scheme
  (global-set-key (kbd "C-c") 'a-function)
  ```

  Điều này tương đương với:

  ```scheme
  (define-key (current-global-map) (kbd "C-c") 'a-function)
  ```

  Nghĩa là bất kỳ keybinding global nào được set bằng `global-set-key` cũng có
  thể được set bằng `define-key`.

* Để remap key thực hiện function `kill-line` sang
  function `my-kill-line`, dùng:

  ```scheme
  (define-key some-mode-map [remap kill-line] 'my-kill-line)

  ;; or with global keybinding
  (global-set-key [remap kill-line] 'my-kill-line)
  ```

* Remap chỉ hoạt động ở *một mức*, tức là nếu bạn dùng:

  ```scheme
  (define-key some-mode-map [remap kill-line] 'my-kill-line)
  (define-key some-mode-map [remap my-kill-line] 'my-other-kill-line)
  ```

  Thì dòng remap thứ hai **không có tác dụng***, nghĩa là `kill-line` chỉ được
  remap thành `my-kill-line`.

* Để undo một remap, remap lại key thành nil:

  ```scheme
  (define-key some-mode-map [remap kill-line] nil)
  ```

### Thi hành shell command, đưa output ra temp buffer

Tham số thứ hai của `shell-command` định rõ output buffer, nếu là `t` thì
output sẽ được đưa ra buffer hiện tại:

```scheme
(with-temp-buffer
  (shell-command "cat ~/.emacs.d/init.el" t))
```

### Bỏ nonpane buffer (cửa sổ phụ bên dưới) khi khởi động Sunrise Commander

```scheme
(defun sunrise-without-nonpane-buffer ()
  "Open Sunrise Commander without the nonpane buffer."
  (unless sr-running
    (sunrise)
    (sr-setup-windows)  ; Make sure windows are setup properly
    (windmove-down)
    (delete-window)))

(defun sunrise-cd-without-nonpane-buffer ()
  "Open sunrise-cd without the nonpane buffer."
  (unless sr-running
    (sunrise-cd)
    (sr-setup-windows)  ; Make sure windows are setup properly
    (windmove-down)
    (delete-window)))
```

### Dùng `interactive` với giá trị mặc định

Hiểu cách thức `interactive`
[hoạt động](http://www.gnu.org/software/emacs/manual/html_node/elisp/Using-Interactive.html).

```scheme
(interactive (list ($read-string "File name (~/bin/): "
                           :initial-input "~/bin/")))
```

### Đóng Emacs

Sử dụng command/hàm `(kill-emacs)` hoặc `(save-buffers-kill-emacs)`.

### Sử dụng keyword argument giống Common Lisp

http://curiousprogrammer.wordpress.com/2009/08/16/elisp-keyword-params/
