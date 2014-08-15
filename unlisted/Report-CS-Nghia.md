---
layout: page_without_comments
title: Tình hình học tập - Nghĩa
group: navigation
listed: false
permalink: /report-cs-nghia/
---
{% include JB/setup %}

# Buổi 15 - 2014/08/15

* (Hoàn thành) Bài toán: Dãy ngoặc đúng (Stack)

* (Hoàn thành) Thuật toán Bellman-Moore
  - Giải pháp cho cả Dijkstra (loại đồ thị) và Floyd (độ phức tập thuật toán):
    Tìm đường đi ngắn nhất trên đồ thị vô hướng, không có chu trình âm.
  - Kỹ thuật tự sinh test.
  - Kiểm tra chương trình bằng thuật toán đúng đã biết (Dijkstra).
  - Áp dụng nâng cao: Bài toán: Tìm 2 đường đi có tổng ngắn nhất.

* (Chưa hoàn thành) Bài toán: Dãy quân bài
  - Xét thiếu trường hợp.

* Yêu cầu: Đọc lại kiến thức tổ hợp và chỉnh hợp.

# Buổi 14 - 2014/08/14

* (Hoàn thành) Bài toán (buổi trước): Hai đường thẳng song song
  - Viết lại chương trình từ đầu khi không debug được nữa.

* (Hoàn thành) Bài toán (tồn đọng): Cắt gỗ
  - Chú ý đọc thật kỹ đề bài về giới hạn.

* (Hoàn thành) Thuật toán Modified Dijkstra
  - Cần đọc kỹ đề bài.

# Buổi 13 - 2014/08/13

* Không test khi chương trình sai.

* Kỹ năng chạy và phân tích test còn yếu:
  - Tiết kiệm trước mắt để lãng phí lâu dài: Ngại tạo file test mà nhập dữ
    liệu bằng tay.

* Chưa tận dụng tất cả các công cụ sẵn có (giấy bút - phân tích bài toán **và
  dữ liệu**).

* Demo giải bài toán Hai đường thẳng song song
  - Phân tích từng bước.
  - Cô lập đoạn chương trình nghi vấn là sai.
  - Test từng phần.
  - Làm chủ toàn bộ mã nguồn.
  - Refactor, trau chuốt lại logic và ngữ nghĩa.

* Bài toán: Dãy ngoặc đúng
  - Giới thiệu lại cấu trúc dữ liệu Stack

* Bài toán: Dãy quân bài.

# Buổi 12 - 2014/08/08

* Thảo luận: Thuật toán Dijsktra và Modified Dijkstra:
  - Phân tích và so sánh thuật toán.
  - Thử chạy với các bộ dữ liệu có sẵn.
  - Còn hiểu sai thuật toán.
  - Không lấy ví dụ để thử và kiểm chứng.

* (Hoàn thành) Bài toán: Figurate Numbers

* Ôn tập: Heap - Heap Max và Heap Min

* Ôn tâp: Các loại cây nhị phân
  - Cách thức lưu trữ cây nhị phân.

# Buổi 11 - 2014/08/07

* (Chưa hoàn thành) Cắt gỗ.

* (Chưa hoàn thành) Bài toán: Mê cung
  - Dùng nhầm thuật toán duyệt theo chiều sâu.
  - Ôn lại lý thuyết cây.

* Bài toán: Hai đường thẳng song song.

# Buổi 10 - 2014/08/06

* (Chưa hoàn thành) Figurate Number
  - Bỏ chương trình duyệt.
  - Phân tích phép thử chọn số vào mỗi loại.

* (Chưa hoàn thành) Bài toán: Mê cung

* Bài toán: Cắt gỗ
  - Cấu trúc dữ liệu Heap cơ bản.

# Buổi 09 - 2014/07/31

* Có tiến bộ trong cách thức tổ chức đơn vị logic khi xây dựng chương trình.

* (Hoàn thành) Bài toán: Tìm một số trong dãy
  - Giới hạn nhỏ (không quá 5,000 phần tử): duyệt.
  - Giới hạn lớn (không quá 50,000 phần tử): sắp xếp và tìm kiếm nhị phân.
  - Kết hợp với quy vấn kết quả.

* Ôn tập - Tìm kiếm nhị phân.

# Buổi 08 - 2014/07/30

* (Chưa hoàn thành) Bài toán Figurate Numbers
  - Chương trình duyệt vẫn sai.
  - Giảm độ phức tạp.
  - Sử dụng hàm first-class trong phép kiểm tra.

* (Chưa hoàn thành) Bài toán: Mê cung
  - Duyệt theo chiều rộng cơ bản.
  - Kết hợp nhận xét về đỉnh xuất phát.

# Buổi 07 - 2014/07/25

* (Chưa hoàn thành) Thuật toán Modified Dijkstra
  - Hiểu sai thuật toán.
  - Chưa có thói quen comment mã nguồn.
  - Cách viết chương trình chưa nhất quán, lủng củng, logic trúc trắc.

* (Chưa hoàn thành) Bài toán: Figurate Numbers
  - Duyệt không hiệu quả.
  - Sai điều kiện.

* (Hoàn thành) Bài toán: Đổi thẻ
  - Không tự lấy ví dụ để phân tích ⇨ Lấy ví dụ là tìm được luôn lời giải.

# Buổi 06 - 2014/07/23

* Thuật toán: Modified Dijkstra
  - Quản lý trường hợp tràn số
  - Chú ý: Hiểu rõ **từng khái niệm nhỏ** của thuật toán:
    * Mỗi thuật toán đều có giới hạn áp dụng.

* (Chưa hoàn thành) Bài toán: Đổi thẻ
  - Liên hệ với việc tìm ước chung lớn nhất.
  - Thuật toán Euclid.

* Phân tích: Bài 69 của Project Euler - Figurate Numbers
  - Bài dễ nhưng rất phức tạp khi cài đặt.
  - Quản lý mã nguồn hợp lý.
  - Cách thức debug.

# Buổi 05 - 2014/07/18

* (Hoàn thành) Bài toán: Xâu đối xứng
  - Nâng cao: sử dụng quy hoạch động với độ phức tạp O(N^2) (sẽ xét trong
    chuyên đề quy hoạch động).

* Luyện tập: Đánh giá độ phức tập thuật toán.

* Lý thuyết: Toán rời rạc - Cơ bản về tổ hợp và chỉnh hợp.

* Bài toán: Phân tích số để tích lớn nhất
  - Nhận xét về tích của các số nguyên tố.
  - Hàm kiểm tra nguyên tố:
    - Sàng Eratosthenes.
    - Các kỹ thuật tối ưu về tốc độ dựa trên nhận xét Toán học.

# Buổi 04 - 2014/07/09

* Lý thuyết: Độ phức tập thuật toán
  - Các ký pháp O, Theta, Omega.
  - Cách thức đánh giá độ phức tạp cơ bản.

* Lý thuyết: Xử lý bit cơ bản.

* (Hoàn thành) Bài toán Quick Sort
  - Mở rộng:
    * Áp dụng xử lý bit để đổi chỗ 2 phần tử.
  - Đếm số lần đổi chỗ.

* (Chưa hoàn thành) Bài 69 của Project Euler - Figurate Numbers.

# Buổi 03 - 2014/07/03

* (Hoàn thành) Bài toán: Sinh dãy nhị phân độ dài N
  - Sử dụng đệ quy.
  - Không sử dụng đệ quy.

* (Hoàn thành) Bài toán: Sinh tất cả các hoán vị độ dài N.

* (Hoàn thành) Bài buổi trước - Đếm số thành phần liên thông với Disjoint Set.

* Chưa chú ý đến việc format mã nguồn rõ ràng.

* 03 bài toán qua cầu - luyện tư duy logic trong thuật toán:
  - Bố, mẹ, 2 con trai, 2 con gái.
  - Tiểu đội với vận tốc đi khác nhau.
  - 03 nhà sư và 03 con quỷ.

# Buổi 02 - 2014/06/26

* Xét lại bài toán: Đếm số thành phần liên thông với số đỉnh không quá 100,000
  - Giới thiệu cấu trúc dữ liệu Disjoint Set
  - Kỹ thuật xử lý input và output trực tiếp

* Kiến thức toán: Tổ hợp và chỉnh hợp.

* Cần đọc thật kỹ đề bài trước khi làm.

* Giới thiệu sách cần đọc:
  - Cấu trúc dữ liệu và giải thuật - Lê Minh Hoàng
  - Toán rời rạc - Nguyễn Đức Nghĩa, Nguyễn Tô Thành
  - Algorithms - Robert Sedgewick
  - MIT Press's Introduction to Algorithm, 3rd edition

# Buổi 01 - 2014/06/23

* Bài toán: Đếm số thành phần liên thông
  - (Hoàn thành) Với số lượng đỉnh không quá 100.
  - (Hoàn thành) Với số lượng đỉnh không quá 10,000.
  - (Chưa hoàn thành) Với số lượng đỉnh không quá 100,000.

* Mục đích:
  - Thấy được một bài toán cần được xử lý bằng nhiều phương pháp khác nhau chỉ
    với giới hạn input khác nhau.
  - Giới thiệu cấu trúc dữ liệu lưu trữ đồ thị:
    * Ma trận kề.
    * Danh sách kề.
    * Forward-Start.

* Tổ chức mã:
  - Tab và space lẫn lộn.
  - Tên biến lẫn lộn tiếng Anh và tiếng Việt.
  - Chưa làm chủ được cấu trúc dữ liệu: dùng LongInt thay cho Boolean khi xử
    lý logic.
  - Quản lý tài nguyên chưa tốt, còn sợ thừa/thiếu bộ nhớ.
  - Không khởi tạo giá trị trước khi xử lý.
  - Đặt tên bài là `bt1`, chưa có ngữ nghĩa, chưa có phương pháp quản lý tài
    nguyên học tập.
  - Tên biến tối nghĩa.
  - Không có thói quen phân tích bài toán và nháp trên giấy.
  - Cần khai báo hằng dưới dạng `const`.

- Yêu cầu chưa đạt được: Bài cơ bản cần chạy đúng ngay.

- Chưa hiểu về độ phức tập thuật toán.
