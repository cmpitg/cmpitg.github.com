---
layout: page
title: Slide Maker
description: Yet another tool to make and share web slide
permalink: /slidemaker/
last_updated: Mon, 12 May 2014 01:38:06 +0700
---
{% include JB/setup %}

**Vietnamese version**

## Mô tả ý tưởng

Hiện nay có rất nhiều các công cụ giúp thiết kế bài trình chiếu điện tử trong
đó công cụ phổ biến nhất là Microsoft PowerPoint. PowerPoint (Microsoft),
KeyNote (Apple), hay Prezi là những công cụ hay, hữu dụng, cung cấp nhiều mẫu
đẹp nhưng là sản phẩm đóng, không hỗ trợ đa nền tảng, chi phí cao, không linh
động cho việc mở rộng, ...

Các công cụ như LibreOffice, Calligra Suite, ... là phần mềm tự do nguồn mở,
đa nền tảng, rất linh động nhưng đôi khi hơi khó dùng với người dùng phổ
thông, các mẫu có sẵn ít và chưa được đẹp, ...

Các công cụ tạo slide trên nền Web (impress.js, desk.js, ...) cho phép người
dùng tận dụng công nghệ HTML5/CSS3/JavaScript để tạo nên các bài trình chiếu
đẹp, có tính tương tác cao nhưng khá khó dùng với đối tượng phổ thông - đòi
hỏi trình độ kĩ thuật nhất định, thiếu các giao diện trực quan...

Vì lí do này, SlideMaker là dự án nhằm kết hợp điểm mạnh của 3 loại phần mềm
nói trên:

- Cung cấp công cụ trực quan, dễ sử dụng.
- Tận dụng công nghệ web - bài trình chiếu có thể được chia sẻ, lưu trữ rất dễ
  dàng.
- Đa nền tảng.
- Tính tương tác cao.
- Hoàn toàn là phần mềm tự do nguồn mở.

## Chi tiết giải pháp

Sản phẩm là một web app phân phối theo giấy phép AGPL với các chức năng sau:

- Công cụ tạo bài trình chiếu trực quan:
  * Hỗ trợ kéo thả bằng chuột.
  * Hỗ trợ các page layout phổ biến (một cột, hai cột, một cột với biểu đồ,
    ...).
  * Hỗ trợ các hình minh họa sẵn có trong thư viện OpenClipArt, ...
  * Tạo hiệu ứng cho trang & các đối tượng bên trong.
  * Hỗ trợ multimedia (video, hình ảnh, bản đồ).

- Công cụ lưu trữ trực tuyến:
  * Cho phép trình chiếu online.
  * Cho phép chia sẻ bài trình chiếu qua các mạng xã hội (Facebook, Twitter,
    Zing, ...).
  * Cho phép tải bài trình chiếu về máy dưới dạng HTML.
 
- Thân thiện với các thiết bị máy tính bảng và smartphone.

- Hỗ trợ download về, chạy offline.

- Ngôn ngữ chính: tiếng Việt và tiếng Anh. Có thể mở rộng hơn trong tương lai.

## Kỹ năng yêu cầu

- Thông thạo công nghệ HTML5/CSS3/JavaScript.

- Biết sử dụng công cụ quản lý phiên bản và cách thức cộng tác trên Github:
  * Merging
  * Rebasing
  * Tạo và apply patch
  
- Đọc hiểu tài liệu tiếng Anh tốt.

- Có tinh thần ham học hỏi, kỷ luật tốt.

- Quản trị server cơ bản.

- Có coding convention tốt, code mạch lạc, trong sáng, có cấu trúc hợp lý,
  comment chi tiết đầy đủ.

### Công nghệ

- Ngôn ngữ lập trình: Clojure, ClojureScript, và CSS.

- Nền tảng: GNU/Linux (khuyến khích dùng Debian hoặc Fedora).

- Trình quản lý phiên bản: Git.

## Đánh giá mức độ: Khó

## Mentor

- Mentor chính: Nguyễn Hà Dương (cmpitg[at]gmail[dot]com).

- Co-mentor: Đàm Tiến Long (longdt90[at]gmail[dot]com).
