PHẦN 1: HỆ THỐNG DÀNH CHO NGƯỜI QUẢN TRỊ BẢO MẬT 
1.1	Nhận diện người quản trị và hiển thị màn hình cho người quản trị:
1.2	Xem danh sách các đối tượng trên CSDL (role, user, view, table…).
1.3	Thêm mới các đối tượng (role, user, view, table,…).
1.4	Phần quyền và lấy lại quyền của User/Role.
1.5	Xem quyền của một chủ thể cụ thể.
1.6	Các kiến thức cần có để thực hiện các yêu cầu trên.
a.	Xem danh sách các đối tượng hiện có trên CSDL
+ Xem danh sách user: select username from dba_users;
+ Xem danh sách role: select role from dba_roles;
+  Xem danh sách table: select table_name from user_tables;
+ Xem danh sách view: select view_name from user_views;

b.	Xóa đối tượng
+ Xóa user:  drop user username cascade;
+ Xóa role: drop role rolename;
+ Xóa table: drop table table_name cascade constraints;

c.	Thêm đối tượng
+ Thêm user: create user username identified by password;
+ Thêm role: create role role_name;

d.	Phân quyền và lấy lại quyền
i.	Phân quyền
+ Cấp quyền tạo session: grant create session to username;
+ Cấp quyền tạo table: grant create table to username;
+ Cấp quyền tạo view: grant create view to username;
+ Cấp quyền DBA: grant dba to username;
+ Cấp quyền trên một object cụ thể: 
Grant select || insert || update || delete on object to subject 
Object: là table hoặc view
Subect: là user hoặc role
+ Cấp quyền execute procedure cho người dùng: grant execute on procedure to subject;
Procedure: tên procedure
Subject: user hoặc role
ii.	Lấy lại quyền
+ Lấy quyền tạo session: revoke create session from username;
+ Lấy lại quyền tạo table: revoke create table from username;
+ Lấy lại quyền tạo view: revoke create view from username;
+ Lấy lại quyền DBA: revoke dba from username;
+ Lấy lại quyền trên object cụ thể
Revoke select || insert || update || delete on object from subject 
Object: là table hoặc view
Subect: là user hoặc role
e.	Xem quyền của một chủ thể cụ thể
+ Xem quyền của một user: select * from USER_TAB_PRIVS where grantee =  username;
+ Xem quyền của một role: select * from ROLE_TAB_PRIVS where role = rolename;
PHẦN 2: HIỆN THỰC CÁC CHÍNH SÁCH BẢO MẬT
I.	Lược đồ cơ sở dữ liệu được quan hệ được dùng:
•	NHANVIEN  (MANV, HONV, TENLOT, TENNV, PHAI, LUONG, DIACHI, NGAYSINH, MANQL, PHG, GHICHU)
•	PHONGBAN  (MAPB, TENPB, TRPHG, NGAYBD)
•	DIADIEM_PHG (MAPB, DIADIEM)
•	DEAN (MADA, TENDA, NGAYBD, PHONG, DIADIEM_DA)
•	PHANCONG (MANV, MADA, THOIGIAN)
Trong đó: gạch chân nét liền là “khóa chính” và gạch chân nét đứt là “khóa ngoại”.









Lược đồ ER:
 






II.	Các chính sách bảo mật phân loại:
1.	DAC
1.1	Chỉ có giám đốc, các trưởng phòng, những nhân viên Phòng Thực hiện đề án, nhân viên Phòng Kinh doanh và Phòng Kế hoạch mới có thể xem thông tin về đề án và việc phân công vào các đề án.
1.1.1	Mô tả:
•	Các loại nhân viên: Giám đốc, trưởng phòng các phòng ban,  nhân viên các phòng: Thực hiện đề án, kế hoạch, kinh doanh.
•	Các trường được truy suất: bảng đề án, nhân viên tham gia đề án, phòng ban thực hiện, thời gian thực hiện.
1.1.2	Thực hiện:
a.	Tạo các hàm sau để lấy những nhân viên theo chính sách trên và cấp quyền đó cho Role phù hợp, bao gồm các hàm:
•	Lấy nhân viên là giám đốc.
•	Lấy nhân viên là trưởng phòng của các phòng ban.
•	Lấy những nhân viên thuộc các phòng: thực hiện đề án, phòng kế hoạch, phòng kinh doanh.
b.	Tạo View để xem các trường của đề án và phân công đề án.
c.	Cấp View đó cho các Role.

1.2	Những nhân viên Phòng Kế hoạch mới được thêm, xóa, sửa dữ liệu liên quan các đề án.
1.2.1	Mô tả:
•	Các loại nhân viên: nhân viên phòng kế hoạch.
•	Các trường truy suất: dữ liệu liên quan đến đề án.
1.2.2	Thực hiện:
a.	Tạo các procedure
•	Create Or Replace Procedure PKH_UPDATE_DEAN
•	Create Or Replace Procedure PKH_INSERT_DEAN
b.	Cấp quyền “execute” đến role nhân viên phòng kế hoạch
2.	RBAC
2.1	Các role được xây dựng và các quyền trên được cấp trên Role:
•	p_GIAMDOC: VIEW_DEAN
•	p_TRUONGPHONG: VIEW_DEAN
•	p_NHANVIEN_PKH: VIEW_DEAN, quyền execute Procedure PKH_UPDATE_DEAN,  quyền execute Procedure PKH_INSERT_DEAN
•	p_NHANVIEN_PNS
•	p_NHANVIEN_PKD: VIEW_DEAN
•	p_NHANVIEN_PTHDA: VIEW_DEAN
2.2	Các “View" được xây dựng lên để phục vụ các yêu cầu truy suất.
•	VIEW_DEAN.

2.3 Các “USER” được lấy chính là “MANV” của các nhân viên.
Các “USER” được thừa hưởng các Role nêu trên:
	p_GIAMDOC: nhân viên là giám đốc.
	p_TRUONGPHONG: trường phòng các phòng ban.
	p_ NHANVIEN_PKH: nhân viên phòng kế hoạch.
	p_NHANVIEN_PNS: phân viên phòng nhân sự.
	p_NHANVIEN_PKD: nhân viên phòng kinh doanh.
	p_NHANVIEN_PTHDA: nhân viên phòng thực hiện đề án.
3.	VPD
3.1	Nhân viên chỉ được xem các trường lương, phụ cấp của chính nhân viên đó.
3.1.1	Mô tả:
+ Khi nhân viên login vào tài khoản của mình, nhân viên thực hiện xem trên bảng nhân viên, câu truy vấn sẽ trả về các trường lương và phụ cấp của chính nhân viên đang “login” mà không được phép xem các trường lương và phụ cấp của bất kì nhân viên nào khác cả.
3.1.2	Thực hiện:
+ Tạo một function trả về nhân viên đang ‘login’
+ Gắn hàm chính sách chỉ nhân viên được phép xem lương của mình lên bảng nhân viên.
3.2	Trưởng phòng chỉ được phép xem thông tin nhân viên của phòng ban mình.
3.2.1	Mô tả:
3.2.2	Thực hiện:
+ Gắn hàm chính sách vào bảng nhân viên để chi trưởng phòng mới được phép xem lương của bản thân mình.

4.	Mã hóa
4.1	Mã hóa thông tin lương của các nhân viên
4.2	Mã hóa thông tin mật khẩu.
5.	Audit
Ghi lại thông tin “insert” và “update” của nhân viên khi nhân viên đó thực hiện, lưu lại hành dộng của nhân viên đó.
