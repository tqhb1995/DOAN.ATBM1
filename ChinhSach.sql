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