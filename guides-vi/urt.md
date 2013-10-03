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

## Ghi chú

Urban Terror server sử dụng file `qkey` (auto-generated) để xác định
ID của một client.  `qkey` được sinh tự động trên client, bản chất là
một file binary chứa nhiều giá trị ngẫu nhiên.  `qkey` luôn luôn được
sinh lại nếu Urban Terror client không tìm thấy file này.  Đường dẫn
đến `qkey` trên GNU/Linux: `~/.q3a/qkey`

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
