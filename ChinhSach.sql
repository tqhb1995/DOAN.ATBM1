--VPD nhân viên chỉ có thể xem lương và phụ cấp của chính họ mà thôi
--Tạo function trả về cái username đã đăng nhập là gì. 
create or replace function XEM_LUONG_PHUCAP_NHANVIEN
(
  object_schema in varchar2, 
  object_name in varchar2
)
return varchar2
as
  USER_NAME varchar2(10);
  TEMP varchar2(100);
begin 
    USER_NAME := sys_context('userenv', 'session_user');
    TEMP :=  'MANV = ''' || USER_NAME || '''';
    return TEMP;
end;
---Tạo hàm chính sách để nhân viên chỉ có thể xem trường lương và phụ cấp của chính họ mà thôi
BEGIN
DBMS_RLS.add_policy
(object_schema => 'DOAN',
object_name => 'NhanVien',
policy_name => 'S_NhanVien',
function_schema => 'DOAN',
policy_function => 'XEM_LUONG_PHUCAP_NHANVIEN',
sec_relevant_cols=>'LUONG, PHUCAP');
--sec_relevant_cols_opt=>dbms_rls.ALL_ROWS);-- hàm này có chắc năng xem hết cac thông tin của nhân viên nhưng trừ trường lương và phụ cấp
END;



--Cách test--
--Tạo views--
CREATE VIEW NHANVIEN_OF_USER AS SELECT * FROM NHANVIEN;
GRANT SELECT ON NHANVIEN_OF_USER to public;--CẤP QUYỀN SELECT
--Truy vấn trên user
SELECT * FROM DOAN.NHANVIEN_OF_USER;

-----------------------
--Những nhân viên Phòng Kế hoạch mới được thêm, xóa, sửa dữ liệu liên quan các
--đề án.
create or replace procedure PKD_UPDATE_DEAN 
(
  p_MADA IN VARCHAR2,
  p_TENDA IN VARCHAR2,
  p_NGAYBD IN date,
  p_PHONG IN VARCHAR2,
  p_DIADIEM_DA IN VARCHAR2
)
AS
  p_MANV varchar2(20);
  num number;
BEGIN
  Select count(*) into num from NHANVIEN where MANV = USER;
  if (num>0) then
  begin
      Select MANV into p_MANV from NHANVIEN where MANV = USER AND PHG = 'PKH';
      update DEAN 
      set MADA = p_MADA, TENDA = p_TENDA, NGAYBD = p_NGAYBD, PHONG = p_PHONG, DIADIEM_DA = p_DIADIEM_DA
      where MADA = p_MADA;
      end;
  end if;
  commit;
END;
--test
EXECUTE DOAN.PKD_UPDATE_DEAN ('DA03', 'Đề án 03', TO_DATE('02/09/2017', 'DD/MM/YYYY'), 'PTHDA', 'Toàn nhà hành chính hành Dinh B');
