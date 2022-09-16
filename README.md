<<<<<<< HEAD
## Preload
 - Thực hiện từng câu query riêng biệt để lấy data từ DB.
 - Preload luôn sinh ra 2 câu lệnh riêng rẽ để load data.
## Includes
 - includes() cũng tương tự với preload() nhưng có thể sử dụng where() với các bảng quan hệ.
 - Nếu có câu lệnh where() ở bảng quan hệ thì câu lệnh includes() sẽ gộp thành 1 câu query, còn nếu không thì sẽ tách thành 2 câu query.
## Eager_load
 - eager_load() giống với include(), điểm khác biệt là eager_load() luôn luôn sử dụng chỉ một câu lệnh query cho dù không có câu lệnh where() hay order() ở bảng quan hệ đi chăng nữa.
=======
## presence
Thuộc tính phải có giá trị, không được để trống
## allow_nil
Cho phép bỏ qua validation khi giá trị là nil
## allow_blank
Cho phép bỏ qua validation khi giá trị là nil hoặc chuỗi rỗng
## on
Chỉ định thời điểm cụ thể validation xảy ra, mặc định cho tất cả các built-in validators là khi tạo mới record và update record
Sử dụng on: :create hoặc on: :update khi muốn validate xảy ra chỉ một trong hai trường hợp
## context: 
tùy chỉnh validate trong một điều kiện cụ thể ngoài on: :create và on: :update
>>>>>>> learning_rails_dat_Validations
