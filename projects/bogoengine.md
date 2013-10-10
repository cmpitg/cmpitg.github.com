---
layout: page
title: bogoengine
description: A Vietnamese input method for GNU/Linux systems
permalink: /bogoengine/
last_updated: Fri, 11 Oct 2013 02:41:31 +0700
---
{% include JB/setup %}

## Tình hình các bộ gõ tiếng Việt

Tính đến thời điểm tháng 03 năm 2012, Việt Nam có 04 bộ gõ tiếng Việt trên
GNU/Linux được biết đến và sử dụng phổ biến nhất:

* **x-unikey** của tác giả *Phạm Kim Long*, lần phát hành cuối cùng là vào năm
  **2006**, giấy phép GPL v2.

* **xvnkb** của tác giả *Dao Hai Lam* <lam [at] visc-network [dot] com>, lần
  phát hành cuối cùng vào năm **2004**, giấy phép GPL v2.

* **scim-unikey** và **ibus-unikey** là 2 input method (IM) dùng cho SCIM và
  IBus, phát triển bởi *Lê Quốc Tuấn* <mr [dot] lequoctuan [at] gmail [dot]
  com> và *Lê Kiến Trúc* <afterlastangel [at] ubuntu-vn [dot] org>, với engine
  Unikey trích xuất từ x-unikey, giấy phép GPL v2. ibus-unikey được sử dụng
  phổ biến nhất, có mặt mặc định trên hầu hết tất cả các bản phân phối
  GNU/Linux. scim-unikey phát hành lần cuối cùng vào tháng
  08/2009. ibus-unikey phát hành bản 0.6 vào tháng 01/2012 và hiện nay vẫn
  đang tiếp tục được phát triển.

## Vấn đề

Tất cả 4 bộ gõ nói trên đều còn nhiều hạn chế, gây khó khăn cho người sử dụng,
đặc biệt với người sử dụng phổ thông. Cụ thể, bộ gõ tiếng Việt trên GNU/Linux
cần đảm bảo các yếu tố sau:

1. Là Phần mềm Tự do Nguồn mở
   ([FOSS](http://en.wikipedia.org/wiki/Free_and_open_source_software))

2. Sẵn có trên hầu hết các bản phân phối GNU/Linux, đặc biệt là các
   bản phân phối phổ biến: Ubuntu, Fedora, Debian, ...

3. Có IM cho các IM platform/framework mặc định phổ biến nhất hiện nay: SCIM
   và IBus.

4. Tài liệu cho người sử dụng và người phát triển rõ ràng, chăm sóc cẩn thận.

5. Mã nguồn trong sáng, có convention, guideline.

6. Chạy ổn định, dễ dùng.

7. Hỗ trợ các bảng mã (UTF-8, UTF-16, TCVN 3, VNI, VIQR, ...) và cách gõ phổ
   biến nhât (Telex, Simple Telex, VNI).

8. Hỗ trợ tính năng chuyển mã.

9. Khả năng mở rộng, bảo trì, tái sử dụng cao.

Không có một bộ gõ tiếng Việt nào trong số 4 bộ gõ nói trên đáp ứng được đầy
đủ cả 9 yêu cầu này tính đến thời điểm tháng 03 năm 2012.

## Giải pháp

Nhằm đáp ứng 9 yêu cầu kể trên, tôi
([**@cmpitg**](https://github.com/cmpitg/)) đã cho ra đời engine xử lý nhập
liệu tiếng Việt [*bogoengine*](https://github.com/cmpitg/bogoengine) vào tháng
04 năm 2012.  *bogoengine* đã được viết lại bằng Python bởi tác giả *Ngô
"Chin" Trung* ([**@lewtds**](https://github.com/lewtds/)) và tích hợp vào IBus
với cái tên
[**ibus-bogo-python**](https://github.com/BoGoEngine/ibus-bogo-python) như một
giải pháp tạm thời chạy trên GNU/Linux.  **ibus-bogo-python** đã có gói cài
đặt cho Fedora và Ubuntu, trang web chính thức tại
[http://bogoengine.github.io/](http://bogoengine.github.io/).

## Tình hình hiện tại

* Sau 9 tháng phát triển, dự án *bogoengine* tạm thời dừng lại do chứng
  [RSI](/rsi/) của tôi tái phát.  Giữa năm 2013, tôi quyết định viết lại toàn
  bộ *bogoengine* dựa trên các bài học thu được từ phiên bản cũ, sử dụng hoàn
  toàn C nhưng một lần nữa lại phải trì hoãn do RSI.  Đến đầu tháng 10/2013,
  khi các vấn đề liên quan đến sức khỏe đã dần dần được cải thiện, tôi bắt đầu
  thử nghiệm *bogoengine* với [Chicken Scheme](http://call-cc.org) thay vì C.

* Tại thời điểm đầu tháng 10/2013, ibus-bogo-python vẫn đang được Chin bảo trì
  và cập nhật.  Dự án còn rất nhiều
  [bug](https://github.com/BoGoEngine/ibus-bogo-python/issues).  Chin cũng
  đang có ý định viết lại bộ gõ song song với tôi.

### Vì sao dùng Chicken Scheme?

* Scheme là ngôn ngữ rất tuyệt.

* Chicken Scheme biên dịch Scheme ra C, và từ C có thể build tĩnh thành thư
  viện, link với input method hoặc implement dưới dạng server.

* Trình biên dịch Chicken Scheme dễ dùng, dễ mở rộng, cộng đồng tốt.

### Vì sao không dùng Chicken Scheme?

* Một trong những nền tảng *bogoengine* hỗ trợ là
  [Firefox OS](http://www.mozilla.org/en-US/firefox/os/), hiện tại quá trình
  biên dịch C thành JavaScript sử dụng
  [Emscripten](https://github.com/kripken/emscripten)
  [gặp một vài vấn đề](https://github.com/kripken/emscripten) liên quan đến mã
  nguồn C được sinh ra và tốc độ, chưa thể giải quyết được.
