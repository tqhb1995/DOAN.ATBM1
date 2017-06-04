--CREATE TABKE--
CREATE TABLE NHANVIEN (
  MANV VARCHAR (20),
  HONV VARCHAR (20),
  TENLOT VARCHAR (20),
  TENNV VARCHAR (20),
  PHAI VARCHAR (5),
  LUONG NUMBER,
  DIACHI VARCHAR (50),
  NGAYSINH VARCHAR (20),
  MANQL VARCHAR (20),
  PHG VARCHAR (20),
  SDT VARCHAR (11),
  PHUCAP NUMBER,
  PRIMARY KEY (MANV)
)
;CREATE TABLE PHONGBAN(
  MAPB VARCHAR (20),
  TENPB VARCHAR (20),
  TRPHG VARCHAR (20),
  NGAYBD VARCHAR (20),
  PRIMARY KEY (MAPB)
);

CREATE TABLE DIADIEM_PHG (
  MAPB VARCHAR (20),
  DIADIEM VARCHAR (50),
  PRIMARY KEY (MAPB, DIADIEM)
);

CREATE TABLE DEAN (
  MADA VARCHAR (20),
  TENDA VARCHAR (20),
  NGAYBD VARCHAR (20),
  PHONG VARCHAR (20),
  DIADIEM_DA VARCHAR (50),
  PRIMARY KEY (MADA)
);

CREATE TABLE PHANCONG (
  MANV VARCHAR (20),
  MADA VARCHAR (20),
  THOIGIAN VARCHAR (20),
  PRIMARY KEY (MANV, MADA)
);


--KHOA NGOAI--
ALTER TABLE PHONGBAN ADD CONSTRAINT  FK_PHGBAN_NHANVIEN FOREIGN KEY (TRPHG) REFERENCES NHANVIEN(MANV);
 
ALTER TABLE NHANVIEN ADD CONSTRAINT  FK_NHANVIEN_PHONGBAN FOREIGN KEY (PHG) REFERENCES PHONGBAN(MAPB);
ALTER TABLE NHANVIEN ADD CONSTRAINT  FK_NHANVIEN_NHANVIEN FOREIGN KEY (MANQL) REFERENCES NHANVIEN(MANV);
 
ALTER TABLE DIADIEM_PHG ADD CONSTRAINT  FK_DIADIEMPHG_PHONGBAN FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB);
 
ALTER TABLE DEAN ADD CONSTRAINT  FK_DEAN_PHONGBAN FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPB);
 
ALTER TABLE PHANCONG ADD CONSTRAINT  FK_PHANCONG_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
ALTER TABLE PHANCONG ADD CONSTRAINT  FK_PHANCONG_DEAN FOREIGN KEY (MADA) REFERENCES DEAN(MADA);
 -----------------------------------------------------------------------------------------------
 
 
--insert data--
--PHONG BAN--
insert into PHONGBAN values ('PNS', 'Phòng nhân sự', '', '01/01/2000');
insert into PHONGBAN values ('PKH', 'Phòng kế hoạch', '', '01/01/2000');
insert into PHONGBAN values ('PKD', 'Phòng Kinh Doanh', '', '01/01/2000');
insert into PHONGBAN values ('PTHDA', 'Phòng TH đề án', '', '01/01/2000');

select * from PHONGBAN;

--DIADIEM_PHG--
insert into DIADIEM_PHG values ('PNS', 'Tòa nhà I, lầu 1, Phòng 104');
insert into DIADIEM_PHG values ('PKH', 'Tòa nhà I, lầu 2, Phòng 204');
insert into DIADIEM_PHG values ('PKD', 'Tòa nhà I, lầu 3, Phòng 304');
insert into DIADIEM_PHG values ('PTHDA', 'Tòa nhà I, lầu 4, Phòng 404');

select * from DIADIEM_PHG;

--select * from phongban p, diadiem_phg dd where p.mapb = dd.mapb; 

--DEAN--
insert into DEAN values ('DA01', 'Đề án 01', '03/04/2014', 'PKD', 'Trung tâm thương mại Nguyễn Kim');
insert into DEAN values ('DA02', 'Đề án 02', '05/01/2016', 'PKH', 'Trung tâm thương mại Quốc tế');
insert into DEAN values ('DA03', 'Đề án 03', '02/09/2017', 'PTHDA', 'Toàn nhà hành chính hành Dinh A');

select * from DEAN;

--NHANVIEN--
--GIAM DOC--
insert into NHANVIEN VALUES ('GD00000', 'Nguyễn', 'Thanh', 'Trà', 'Nam', 50000, 'Bình Định', '2/12/1995', '', '', '0979797979', 30000);
--NHAN VIEN PHONG NHAN SU---
insert into NHANVIEN VALUES ('PNS00001', 'Trần', 'Văn', 'Lượng', 'Nam', 5000, 'Nam Định', '23/11/1990', '', 'PNS', '0905713647', 10000);
insert into NHANVIEN VALUES ('PNS00002', 'Nguyễn', 'Huy', 'Long', 'Nam', 6000, 'Bình Định', '2/12/1989', 'PSN00001', 'PNS', '01237646853', 2000);
insert into NHANVIEN VALUES ('PNS00003', 'Hà', 'Huy', 'Tập', 'Nam', 5000, 'Bình Định', '2/010/1990', 'PSN00001', 'PNS', '01234567891', 3000);
insert into NHANVIEN VALUES ('PNS00004', 'Chu', 'Huy', 'Huỳnh', 'Nam', 6000, 'Quảng Trị', '02/02/1988', 'PSN00001', 'PNS', '01232346853', 2500);
insert into NHANVIEN VALUES ('PNS00005', 'Nguyễn', 'Huy', 'Tú', 'Nam', 6000, 'Bình Định', '2/12/1981', 'PSN00001', 'PNS', '01986646853', 2400);

insert into NHANVIEN VALUES ('PNS00006', 'Nguyễn', 'Huy', 'Tina', 'Nữ', 6000, 'Bình Định', '04/10/1992', '', 'PNS', '0909090909', 8000);
insert into NHANVIEN VALUES ('PNS00007', 'Lê', 'Hùng', 'Tion', 'Nam', 6600, 'Quảng Bình', '2/01/1989', 'PNS00006', 'PNS', '01237612253', 2000);
insert into NHANVIEN VALUES ('PNS00008', 'Dương', 'Hào', 'Nauy', 'Nữ', 6200, 'Quảng Ngãi', '2/02/1989', 'PNS00006', 'PNS', '01200046853', 2000);
insert into NHANVIEN VALUES ('PNS00009', 'Gia', 'Lê', 'Peter', 'Nam', 6200, 'Quảng Nam', '2/03/1989', 'PNS00006', 'PNS', '01237693853', 2000);
insert into NHANVIEN VALUES ('PNS00010', 'Huấn', 'Tuấn', 'Crist', 'Nam', 6300, 'Bình Định', '2/04/1989', 'PNS00006', 'PNS', '0197246853', 2000);
insert into NHANVIEN VALUES ('PNS00011', 'Nguyễn', 'Gia', 'Duy', 'Nam', 6090, 'Bình Định', '2/05/1989', 'PNS00006', 'PNS', '0123145853', 2000);

---PHONG KINH DOANH---
insert into NHANVIEN VALUES ('PKD10001', 'Huỳnh', 'Bảo', 'Nhi', 'Nữ', 5500, 'Khánh Hòa', '21/04/1991', '', 'PKD', '01239275832', 2227);
insert into NHANVIEN VALUES ('PKD10002', 'Mai', 'Văn', 'Nghị', 'Nam', 7000, 'Quảng Ngãi', '23/04/1992', 'PKD10001', 'PKD', '0907584934', 6000);
insert into NHANVIEN VALUES ('PKD10003', 'Tạ', 'Văn', 'Nghị', 'Nam', 7000, 'Quảng Ngãi', '23/04/1992', 'PKD10001', 'PKD', '0907584934', 6000);
insert into NHANVIEN VALUES ('PKD10004', 'Chu', 'Văn', 'Nghị', 'Nam', 7000, 'Quảng Ngãi', '23/04/1992', 'PKD10001', 'PKD', '0907584934', 6000);
insert into NHANVIEN VALUES ('PKD10005', 'Hứa', 'Văn', 'Nghị', 'Nam', 7000, 'Quảng Ngãi', '23/04/1992', 'PKD10001', 'PKD', '0907584934', 6000);

insert into NHANVIEN VALUES ('PKD10006', 'Huỳnh', 'Văn', 'Thế', 'Nam', 7000, 'Quảng Ngãi', '23/04/1992', '', 'PKD', '0907999934', 6000);
insert into NHANVIEN VALUES ('PKD10007', 'Mai', 'Chu', 'Tuấn', 'Nam', 7000, 'Quảng Nam', '22/11/1993', 'PKD10006', 'PKD', '0934584934', 5000);
insert into NHANVIEN VALUES ('PKD10008', 'Mai', 'Thế', 'Hào', 'Nam', 7000, 'Quảng Ngãi', '21/12/1993', 'PKD10006', 'PKD', '0900084934', 4000);
insert into NHANVIEN VALUES ('PKD10009', 'Nguyễn', 'Hòa', 'Huấn', 'Nam', 7000, 'Quảng Trị', '20/10/1991', 'PKD10006', 'PKD', '0907585534', 5500);
insert into NHANVIEN VALUES ('PKD10010', 'Nguyễn', 'Ngữ', 'Huy', 'Nam', 7000, 'Quảng Ngãi', '19/09/1991', 'PKD10006', 'PKD', '0907599934', 6000);
insert into NHANVIEN VALUES ('PKD10011', 'Nguyễn', 'Hung', 'Chung', 'Nam', 7000, 'Quảng Ngãi', '23/04/1991', 'PKD10006', 'PKD', '0900084934', 6000);

---PHONG KE HOACH---
insert into NHANVIEN VALUES ('PKH20001', 'Chu', 'Văn', 'Nghị', 'Nam', 6500, 'Bình Định', '31/1/1994', '', 'PKH', '0695358454', 4000);
insert into NHANVIEN VALUES ('PKH20002', 'Lê', 'Tú', 'Uyên', 'Nữ', 7000, 'Khánh Hòa', '01/02/1988', 'PKH20001', 'PKH', '07834345335', 2000);
insert into NHANVIEN VALUES ('PKH20003', 'Lê', 'Nguyễn', 'Hoài', 'Nữ', 7000, 'Khánh Hòa', '02/02/1988', 'PKH20001', 'PKH', '07114345335', 2000);
insert into NHANVIEN VALUES ('PKH20004', 'Hà', 'Huy', 'Vũ', 'Nam', 7000, 'Vinh', '03/02/1988', 'PKH20001', 'PKH', '01114345335', 2000);
insert into NHANVIEN VALUES ('PKH20005', 'Hà', 'Chung', 'Uy', 'Nữ', 7000, 'Vinh', '04/02/1988', 'PKH20001', 'PKH', '07832315335', 2000);

insert into NHANVIEN VALUES ('PKH20006', 'Hà', 'Phú', 'Chung', 'Nam', 7000, 'Vinh', '05/02/1988', '', 'PKH', '07856345335', 2000);
insert into NHANVIEN VALUES ('PKH20007', 'Nguyễn', 'Trần', 'Đan', 'Nữ', 7000, 'Lâm Đồng', '06/02/1988', 'PKH20006', 'PKH', '07444345335', 2000);
insert into NHANVIEN VALUES ('PKH20008', 'Nguyễn', 'Lữ', 'Coco', 'Nữ', 7000, 'Vinh', '07/02/1988', 'PKH20006', 'PKH', '07222345335', 2000);
insert into NHANVIEN VALUES ('PKH20009', 'Nguyễn', 'Chung', 'Tina', 'Nữ', 7000, 'Lâm Đồng', '08/02/1988', 'PKH20006', 'PKH', '07884345335', 2000);
insert into NHANVIEN VALUES ('PKH20010', 'Tuấn', 'Nguyễn', 'Hà', 'Nữ', 7000, 'Lâm Đồng', '12/02/1988', 'PKH20006', 'PKH', '07833345335', 2000);
insert into NHANVIEN VALUES ('PKH20011', 'Lựu', 'Huy', 'Tùng', 'Nam', 7000, 'Khánh Hòa', '11/02/1988', 'PKH20006', 'PKH', '07835545335', 2000);
--PHONG THUC DIEN DE AN---
insert into NHANVIEN VALUES ('PTHDA30001', 'Trần', 'Hà', 'Anh', 'Nữ', 6800, 'Đà Nẵng', '04/04/1992', '', 'PTHDA', '0987563723', 1000);
insert into NHANVIEN VALUES ('PTHDA30002', 'Trần', 'Trung', 'Quân', 'Nam', 6900, 'Quảng Nam', '03/01/1992', 'PTHDA30001', 'PTHDA', '0955679563', 5000);
insert into NHANVIEN VALUES ('PTHDA30003', 'Nguyễn', 'Trung', 'Quân', 'Nam', 6900, 'Quảng Nam', '03/02/1992', 'PTHDA30001', 'PTHDA', '0920549563', 5000);
insert into NHANVIEN VALUES ('PTHDA30004', 'Nguyễn', 'Quốc', 'Quân', 'Nam', 6900, 'Quảng Ngãi', '03/03/1992', 'PTHDA30001', 'PTHDA', '092119563', 5000);
insert into NHANVIEN VALUES ('PTHDA30005', 'Nguyễn', 'Lữ', 'Hà', 'Nữ', 6900, 'Quảng Ngãi', '03/04/1992', 'PTHDA30001', 'PTHDA', '0920555563', 5000);

insert into NHANVIEN VALUES ('PTHDA30006', 'Nguyễn', 'Trung', 'Tính', 'Nam', 6900, 'Quảng Ngãi', '03/04/1992', '', 'PTHDA', '0922429563', 5000);
insert into NHANVIEN VALUES ('PTHDA30007', 'Nguyễn', 'Trung', 'Chung', 'Nam', 6900, 'Quảng Ngãi', '03/05/1992', 'PTHDA30006', 'PTHDA', '0900019563', 5000);
insert into NHANVIEN VALUES ('PTHDA30008', 'Lê', 'Trung', 'Hiếu', 'Nam', 6900, 'Quảng Trị', '03/05/1993', 'PTHDA30006', 'PTHDA', '0920222263', 5000);
insert into NHANVIEN VALUES ('PTHDA30009', 'Lê', 'Trung', 'Hải', 'Nam', 6900, 'Quảng Trị', '03/05/1994', 'PTHDA30006', 'PTHDA', '0928888563', 5000);
insert into NHANVIEN VALUES ('PTHDA30010', 'Lê', 'Trung', 'Tuấn', 'Nam', 6900, 'Quảng Trị', '03/05/1995', 'PTHDA30006', 'PTHDA', '0977779563', 5000);
insert into NHANVIEN VALUES ('PTHDA30011', 'Dương', 'Trung', 'Quân', 'Nam', 6900, 'Quảng Trị', '03/05/1996', 'PTHDA30006', 'PTHDA', '0666619563', 5000);

---NHAN VIEN BINH THUONG---
insert into NHANVIEN VALUES ('NV40000', 'Nguyễn', 'Hà', 'Ly', 'Nữ', 7000, 'Vinh', '17/01/1985', 'PTHDA30007', '', '07222311135', 2000);
insert into NHANVIEN VALUES ('NV40001', 'Nguyễn', 'Tuấn', 'Nam', 'Nam', 6000, 'Vinh', '27/02/1986', 'PTHDA30007', '', '07222245335', 2000);
insert into NHANVIEN VALUES ('NV40002', 'Nguyễn', 'Thị', 'Tuấn', 'Nam', 5000, 'Vinh', '07/03/1987', 'PTHDA30007', '', '07244445335', 2000);
insert into NHANVIEN VALUES ('NV40003', 'Lê', 'Hòa', 'Hữu', 'Nữ', 4000, 'Phú Yên', '17/04/1988', 'PTHDA30007', '', '07222555335', 2000);
insert into NHANVIEN VALUES ('NV40004', 'Lê', 'Hào', 'Nghị', 'Nam', 5400, 'Phú Yên', '27/05/1989', 'PTHDA30007', '', '07666645335', 2000);
insert into NHANVIEN VALUES ('NV40005', 'Lê', 'Huy', 'Đức', 'Nữ', 4300, 'Phú Yên', '07/06/1990', 'PTHDA30011', '', '07222225335', 2000);
insert into NHANVIEN VALUES ('NV40006', 'Lê', 'Đức', 'Thành', 'Nam', 4000, 'Phú Yên', '17/07/1991', 'PTHDA30011', '', '07632345335', 2000);
insert into NHANVIEN VALUES ('NV40007', 'Trần', 'Minh', 'Lâm', 'Nữ', 6000, 'Phú Yên', '27/08/1988', 'PTHDA30011', '', '07214245335', 2000);
insert into NHANVIEN VALUES ('NV40008', 'Trần', 'Chu', 'Đức', 'Nam', 7700, 'Vinh', '07/09/1990', 'PTHDA30011', '', '07222456335', 2000);
insert into NHANVIEN VALUES ('NV40009', 'Trần', 'Hữu', 'Minh', 'Nam', 7800, 'Vinh', '17/10/1989', 'PTHDA30011', '', '07221223535', 2000);
insert into NHANVIEN VALUES ('NV40010', 'Trần', 'Mã', 'Dương', 'Nam', 7200, 'Vinh', '27/11/1987', 'PTHDA30011', '', '07222145335', 2000);select * from NHANVIEN;
--PHAN CONG---
insert into PHANCONG values ('PKD10006','DA1','12/02/2012');
insert into PHANCONG values ('NV40010','DA1','12/02/2012');
insert into PHANCONG values ('NV40009','DA1','12/02/2012');
insert into PHANCONG values ('NV40008','DA1','12/02/2012');

insert into PHANCONG values ('PTHDA30010','DA2','12/02/2010');
insert into PHANCONG values ('PTHDA30008','DA2','12/02/2010');
insert into PHANCONG values ('NV40008','DA2','12/02/2010');
insert into PHANCONG values ('NV40009','DA2','12/02/2010');
insert into PHANCONG values ('NV400010','DA2','12/02/2010');

insert into PHANCONG values ('PKD10010','DA3','12/02/2011');
insert into PHANCONG values ('PKD10011','DA3','12/02/2011');
insert into PHANCONG values ('NV40000','DA3','12/02/2011');
insert into PHANCONG values ('NV40001','DA3','12/02/2011');
insert into PHANCONG values ('NV40002','DA3','12/02/2011');



select * from NHANVIEN;

---UPDATE DATA---
UPDATE PHONGBAN
SET TRPHG = 'PNS00001'
WHERE MAPB = 'PNS';

UPDATE PHONGBAN
SET TRPHG = 'PKD10001'
WHERE MAPB = 'PKD';

UPDATE PHONGBAN
SET TRPHG = 'PKH20001'
WHERE MAPB = 'PKH';

UPDATE PHONGBAN
SET TRPHG = 'PTHDA30001'
WHERE MAPB = 'PTHDA';

select * from NHANVIEN where PHG = 'PTHDA';

--Tạo user từ mã nhân viên--

declare
  TEMP varchar2(200);
begin
for MANV in (select MANV from NHANVIEN)
loop
  TEMP := 'create user ' || MANV.MANV || ' identified by ' || MANV.MANV || ' default tablespace users temporary tablespace temp';
  execute immediate TEMP;
end loop;
end;     

-- Cấp quyền đăng nhập và tạo session
declare
  TEMP varchar2(500);
begin
for USERNAME in (select MANV from NHANVIEN)
loop
  TEMP := 'grant create session to ' || USERNAME.MANV;
  execute immediate TEMP;
end loop;
end;


--CREATE ROLE---------------------------------------------------------------------------------
CREATE ROLE p_NHANVIEN;
GRANT UPDATE, SELECT ON NHANVIEN TO p_NHANVIEN;

CREATE ROLE p_GIAMDOC;
CREATE ROLE p_TRUONGPHONG;

-- CÁC HÀM PHỤC VỤ CÀI ĐẶT CHÍNH SÁCH VPD
create or replace package SET_NHANVIEN_PACKAGE_CONTEXT
as
    procedure SET_PHONGBAN;
    procedure CHECK_TRUONGPHONG;
    procedure CHECK_GIAMDOC;
end;

--CREATE NHANVIEN_CONTEXT
CREATE OR REPLACE CONTEXT NHANVIEN_CONTEXT USING SET_NHANVIEN_PACKAGE_CONTEXT;
-- TẠO NỘI DUNG PACKAGE

create or replace package body SET_NHANVIEN_PACKAGE_CONTEXT
as
  procedure SET_PHONGBAN
  as PHONGBAN varchar2(20);
  begin
    select MAPB into PHONGBAN from DOAN.NHANVIEN where MANV = sys_context('userenv', 'session_user');
    dbms_session.set_context('NHANVIEN_CONTEXT', 'PHONGBAN', PHONGBAN);
  end;
  
  procedure CHECK_TRUONGPHONG
  as MYTRPHG varchar2(5);
  begin
    select case 
        when exists(select MAPB  from DOAN.PHONGBAN where TRPHG = sys_context('userenv', 'session_user'))
        then 'TRUE'
        else 'FALSE'
      end into MYTRPHG
    from dual;
    dbms_session.set_context('NHANVIEN_CONTEXT', 'MYTRPHG', MYTRPHG);
  end;
  
  
  procedure CHECK_GIAMDOC
  as MYGIAMDOC varchar2(5);
  begin
    select case 
        when exists(select MANV  from DOAN.NHANVIEN WHERE MANV = 'GD00000')
        then 'TRUE'
        else 'FALSE'
      end into MYGIAMDOC
    from dual;
    dbms_session.set_context('NHANVIEN_CONTEXT', 'MYGIAMDOC', MYGIAMDOC);
  end;
end;

--tạo logon trigger cho package
create or replace trigger set_NHANVIEN_CONTEXT_TRIGGER after logon on database
begin
    DOAN.SET_NHANVIEN_PACKAGE_CONTEXT.SET_PHONGBAN;
    DOAN.SET_NHANVIEN_PACKAGE_CONTEXT.CHECK_TRUONGPHONG;
    DOAN.SET_NHANVIEN_PACKAGE_CONTEXT.CHECK_GIAMDOC;
end;



