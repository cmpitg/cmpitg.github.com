---
layout: page
title: Hướng dẫn Urban Terror
category: Games
tags: [games, urt, urban_terror]
permalink: /urt/
last_updated: Sat, 13 Apr 2013 08:23:34 +0700
---
{% include JB/setup %}

*Lưu ý: Trang này chưa được công bố ;-)*

## Thuật ngữ thường gặp

* *ffs*: for f\*\*\* sake

* *rotf*: rolling on the floor

* *lmao*: laughing my ass out

* *gg*: good game/nice shot

* *gh*: good half

* *ns*: nice shot/no scope

* *n1*: nice one

* *gtg*: gotta go/good to go

* *brb*: be right back

* *ty*: thank you

* *thx*: thanks

* *np*: no problem

## `qkey`

Urban Terror server sử dụng file `qkey` (auto-generated) để xác định
ID của một client.  `qkey` được sinh tự động trên client, bản chất là
một file binary chứa nhiều giá trị ngẫu nhiên.  `qkey` luôn luôn được
sinh lại nếu Urban Terror client không tìm thấy file này.  Đường dẫn
đến `qkey` trên GNU/Linux: `~/.q3a/qkey`

## Demo, cách thu và phát demo

* Một demo là một bản capture game.  Giống như khi bạn dùng một chương
  trình quay màn tình (screencaster) quay lại cảnh chơi game.

* Demo khi thu lại sẽ mặc định nằm ở `~/.q3a/q3ut4/demos/` trong
  GNU/Linux.

* Để thu demo, sử dụng lệnh `/recorddemo [file_name]` hoặc nhấn `F12`.
  Nếu không có `[file_name]`, demo sẽ nhận tên mặc định.

* Để dừng thu demo, sử dụng `/stoprecord` hoặc `F12` một lần nữa.

* Để phát lại demo, vào game, chọn **Demos** trên thanh menu và chọn
  tên demo.

* **Chú ý:** Urban Terror client trên Linux gặp vấn đề với tên file,
  vì vậy bạn cần chuyển tên demo sang chữ in hoa mới có thể phát lại
  được trong game.

* Demo nên được đặt tên tốt, chẳng hạn
  `datetime_timezone_player_map.xxx`.  Ví dụ:
  `2013-10-02_15-26-57_UTC7_-_WOOHOO_-_UPTOWN.dm_68`

## Các vấn đề thường gặp với UrT trên GNU/Linux

### Không điều khiển được, hoặc chỉ hiển thị console

Lỗi do UrT được biên dịch với thư viện OpenGL cũ.

## Chạy Urban Terror trên X server khác

Edit `/etc/X11/Xwrapper.config`

```conf
allowed_users=anybody
```

```sh
xinit -- :1
# Go to tty8
urban_terror
```

## Tham chiếu

* Urban Terro page @ Arch Linux wiki: https://wiki.archlinux.org/index.php/Urban_Terror
