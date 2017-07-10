--Cấp quyền cho user DOAN--
GRANT DBA, RESOURCE TO DOAN WITH ADMIN OPTION;
GRANT CREATE SESSION TO DOAN;
GRANT ALL PRIVILEGES TO DOAN;
GRANT EXEMPT ACCESS POLICY TO DOAN;

--CREATE TABLE--
CREATE TABLE NHANVIEN (
  MANV VARCHAR (20),
  HONV VARCHAR (20),
  TENLOT VARCHAR (20),
  TENNV VARCHAR (20),
  PHAI VARCHAR (5),
  LUONG NUMBER,
  DIACHI VARCHAR (50),
  NGAYSINH VARCHAR(20),
  MANQL VARCHAR (20),
  PHG VARCHAR (20),
  SDT NUMBER,
  PHUCAP NUMBER,
  GHICHU NUMBER,
  PRIMARY KEY (MANV)
);
CREATE TABLE MAHOA_LUONG
(
  MANV VARCHAR (20),
  HONV VARCHAR (20),
  TENLOT VARCHAR (20),
  TENNV VARCHAR (20),
  LUONG NUMBER,
  HASHLUONG VARCHAR2(50)
);

CREATE TABLE PHONGBAN(
  MAPB VARCHAR (20),
  TENPB VARCHAR (20),
  TRPHG VARCHAR (20),
  NGAYBD date,
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
  NGAYBD date,
  PHONG VARCHAR (20),
  DIADIEM_DA VARCHAR (50),
  PRIMARY KEY (MADA)
);

CREATE TABLE PHANCONG (
  MANV VARCHAR (20),
  MADA VARCHAR (20),
  THOIGIAN date,
  PRIMARY KEY (MANV, MADA)
);

--KHOA NGOAI--
ALTER TABLE PHONGBAN ADD CONSTRAINT  FK_PHGBAN_NHANVIEN FOREIGN KEY (TRPHG) REFERENCES NHANVIEN(MANV);

ALTER TABLE MAHOA_LUONG ADD CONSTRAINT  FK_MAHOA_LUONG_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
 
ALTER TABLE NHANVIEN ADD CONSTRAINT  FK_NHANVIEN_PHONGBAN FOREIGN KEY (PHG) REFERENCES PHONGBAN(MAPB);
ALTER TABLE NHANVIEN ADD CONSTRAINT  FK_NHANVIEN_NHANVIEN FOREIGN KEY (MANQL) REFERENCES NHANVIEN(MANV);
 
ALTER TABLE DIADIEM_PHG ADD CONSTRAINT  FK_DIADIEMPHG_PHONGBAN FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB);
 
ALTER TABLE DEAN ADD CONSTRAINT  FK_DEAN_PHONGBAN FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPB);
 
ALTER TABLE PHANCONG ADD CONSTRAINT  FK_PHANCONG_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
ALTER TABLE PHANCONG ADD CONSTRAINT  FK_PHANCONG_DEAN FOREIGN KEY (MADA) REFERENCES DEAN(MADA);
 -----------------------------------------------------------------------------------------------
 
 
--insert data--
--PHONG BAN--
insert into PHONGBAN values ('PNS', 'Phòng nhân sự', '', '01/01/2000','DD/MM/YYYY'));
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

--TABLE MÃ HÓA LƯƠNG--
insert into MAHOA_LUONG VALUES ('GD00000', 'Nguyễn', 'Thanh', 'Trà',1000, '');
--NHAN VIEN PHONG NHAN SU---
insert into MAHOA_LUONG VALUES ('PNS00000', 'Trần', 'Văn', 'Nam',9000,'');
insert into MAHOA_LUONG VALUES ('PNS00001', 'Trần', 'Văn', 'Lượng', 5000,'');
insert into MAHOA_LUONG VALUES ('PNS00002', 'Nguyễn', 'Huy', 'Long', 6000,'');
insert into MAHOA_LUONG VALUES ('PNS00003', 'Hà', 'Huy', 'Tập', 5000, '');
insert into MAHOA_LUONG VALUES ('PNS00004', 'Chu', 'Huy', 'Huỳnh', 6000, '');
insert into MAHOA_LUONG VALUES ('PNS00005', 'Nguyễn', 'Huy', 'Tú', 6000, '');

insert into MAHOA_LUONG VALUES ('PNS00006', 'Nguyễn', 'Huy', 'Tina', 6000, '');
insert into MAHOA_LUONG VALUES ('PNS00007', 'Lê', 'Hùng', 'Tion', 6600, '');
insert into MAHOA_LUONG VALUES ('PNS00008', 'Dương', 'Hào', 'Nauy', 6200, '');
insert into MAHOA_LUONG VALUES ('PNS00009', 'Gia', 'Lê', 'Peter', 6200, '');
insert into MAHOA_LUONG VALUES ('PNS00010', 'Huấn', 'Tuấn', 'Crist', 6300, '');
insert into MAHOA_LUONG VALUES ('PNS00011', 'Nguyễn', 'Gia', 'Duy', 6090, '');

---PHONG KINH DOANH---
insert into MAHOA_LUONG VALUES ('PKD10000', 'Huỳnh', 'Bảo', 'Tú', 9500, '');
insert into MAHOA_LUONG VALUES ('PKD10001', 'Huỳnh', 'Bảo', 'Nhi', 5500, '');
insert into MAHOA_LUONG VALUES ('PKD10002', 'Mai', 'Văn', 'Nghị', 7000, '');
insert into MAHOA_LUONG VALUES ('PKD10003', 'Tạ', 'Văn', 'Nghị', 7000, '');
insert into MAHOA_LUONG VALUES ('PKD10004', 'Chu', 'Văn', 'Nghị', 7000,'');
insert into MAHOA_LUONG VALUES ('PKD10005', 'Hứa', 'Văn', 'Nghị', 7000, '');

insert into MAHOA_LUONG VALUES ('PKD10006', 'Huỳnh', 'Văn', 'Thế', 7000, '');
insert into MAHOA_LUONG VALUES ('PKD10007', 'Mai', 'Chu', 'Tuấn', 7000, '');
insert into MAHOA_LUONG VALUES ('PKD10008', 'Mai', 'Thế', 'Hào', 7000, '');
insert into MAHOA_LUONG VALUES ('PKD10009', 'Nguyễn', 'Hòa', 'Huấn', 7000, '');
insert into MAHOA_LUONG VALUES ('PKD10010', 'Nguyễn', 'Ngữ', 'Huy', 7000, '');
insert into MAHOA_LUONG VALUES ('PKD10011', 'Nguyễn', 'Hung', 'Chung', 7000, '');

---PHONG KE HOACH---
insert into MAHOA_LUONG VALUES ('PKH20000', 'Chu', 'Bá', 'Thông', 9500, '');
insert into MAHOA_LUONG VALUES ('PKH20001', 'Chu', 'Văn', 'Nghị', 6500, '');
insert into MAHOA_LUONG VALUES ('PKH20002', 'Lê', 'Tú', 'Uyên', 7000, '');
insert into MAHOA_LUONG VALUES ('PKH20003', 'Lê', 'Nguyễn', 'Hoài', 7000, '');
insert into MAHOA_LUONG VALUES ('PKH20004', 'Hà', 'Huy', 'Vũ', 7000, '');
insert into MAHOA_LUONG VALUES ('PKH20005', 'Hà', 'Chung', 'Uy', 7000, '');

insert into MAHOA_LUONG VALUES ('PKH20006', 'Hà', 'Phú', 'Chung', 7000, '');
insert into MAHOA_LUONG VALUES ('PKH20007', 'Nguyễn', 'Trần', 'Đan', 7000, '');
insert into MAHOA_LUONG VALUES ('PKH20008', 'Nguyễn', 'Lữ', 'Coco', 7000, '');
insert into MAHOA_LUONG VALUES ('PKH20009', 'Nguyễn', 'Chung', 'Tina', 7000, '');
insert into MAHOA_LUONG VALUES ('PKH20010', 'Tuấn', 'Nguyễn', 'Hà', 7000, '');
insert into MAHOA_LUONG VALUES ('PKH20011', 'Lựu', 'Huy', 'Tùng', 7000, '');
--PHONG THUC DIEN DE AN---
insert into MAHOA_LUONG VALUES ('PTHDA30000', 'Trần', 'Hữu', 'Nam',9800, '');
insert into MAHOA_LUONG VALUES ('PTHDA30001', 'Trần', 'Hà', 'Anh', 6800, '');
insert into MAHOA_LUONG VALUES ('PTHDA30002', 'Trần', 'Trung', 'Quân', 6900, '');
insert into MAHOA_LUONG VALUES ('PTHDA30003', 'Nguyễn', 'Trung', 'Quân', 6900, '');
insert into MAHOA_LUONG VALUES ('PTHDA30004', 'Nguyễn', 'Quốc', 'Quân', 6900, '');
insert into MAHOA_LUONG VALUES ('PTHDA30005', 'Nguyễn', 'Lữ', 'Hà', 6900, '');

insert into MAHOA_LUONG VALUES ('PTHDA30006', 'Nguyễn', 'Trung', 'Tính', 6900, '');
insert into MAHOA_LUONG VALUES ('PTHDA30007', 'Nguyễn', 'Trung', 'Chung', 6900, '');
insert into MAHOA_LUONG VALUES ('PTHDA30008', 'Lê', 'Trung', 'Hiếu', 6900, '');
insert into MAHOA_LUONG VALUES ('PTHDA30009', 'Lê', 'Trung', 'Hải', 6900, '');
insert into MAHOA_LUONG VALUES ('PTHDA30010', 'Lê', 'Trung', 'Tuấn', 6900, '');
insert into MAHOA_LUONG VALUES ('PTHDA30011', 'Dương', 'Trung', 'Quân', 6900, '');

---NHAN VIEN BINH THUONG---
insert into MAHOA_LUONG VALUES ('NV40000', 'Nguyễn', 'Hà', 'Ly', 7000, '');
insert into MAHOA_LUONG VALUES ('NV40001', 'Nguyễn', 'Tuấn', 'Nam', 6000, '');
insert into MAHOA_LUONG VALUES ('NV40002', 'Nguyễn', 'Thị', 'Tuấn', 5000, '');
insert into MAHOA_LUONG VALUES ('NV40003', 'Lê', 'Hòa', 'Hữu', 4000, '');
insert into MAHOA_LUONG VALUES ('NV40004', 'Lê', 'Hào', 'Nghị', 5400, '');
insert into MAHOA_LUONG VALUES ('NV40005', 'Lê', 'Huy', 'Đức', 4300, '');
insert into MAHOA_LUONG VALUES ('NV40006', 'Lê', 'Đức', 'Thành', 4000, '');
insert into MAHOA_LUONG VALUES ('NV40007', 'Trần', 'Minh', 'Lâm', 6000, '');
insert into MAHOA_LUONG VALUES ('NV40008', 'Trần', 'Chu', 'Đức', 7700, '');
insert into MAHOA_LUONG VALUES ('NV40009', 'Trần', 'Hữu', 'Minh', 7800, '');
insert into MAHOA_LUONG VALUES ('NV40010', 'Trần', 'Mã', 'Dương', 7200, '');
--NHANVIEN--
--GIAM DOC--
insert into NHANVIEN VALUES ('GD00000', 'Nguyễn', 'Thanh', 'Trà', 50000, 'Bình Định', '2/12/1995', '', '', '0979797979', 30000, 1);
--NHAN VIEN PHONG NHAN SU---
insert into NHANVIEN VALUES ('PNS00000', 'Trần', 'Văn', 9000, 'Nam Định', '12/11/1990', '', 'PNS', '0969696969', 12000, NULL);
insert into NHANVIEN VALUES ('PNS00001', 'Trần', 'Văn', 'Lượng', 5000, 'Nam Định', '23/11/1990', '', 'PNS', '0905713647', 10000, NULL);
insert into NHANVIEN VALUES ('PNS00002', 'Nguyễn', 'Huy', 'Long', 6000, 'Bình Định', '2/12/1989', 'PSN00001', 'PNS', '01237646853', 2000, NULL);
insert into NHANVIEN VALUES ('PNS00003', 'Hà', 'Huy', 'Tập', 5000, 'Bình Định', '2/10/1990', 'PSN00001', 'PNS', '01234567891', 3000, NULL);
insert into NHANVIEN VALUES ('PNS00004', 'Chu', 'Huy', 'Huỳnh', 6000, 'Quảng Trị', '02/02/1988', 'PSN00001', 'PNS', '01232346853', 2500, NULL);
insert into NHANVIEN VALUES ('PNS00005', 'Nguyễn', 'Huy', 'Tú', 6000, 'Bình Định', '2/12/1981', 'PSN00001', 'PNS', '01986646853', 2400, NULL);

insert into NHANVIEN VALUES ('PNS00006', 'Nguyễn', 'Huy', 'Tina', 6000, 'Bình Định', '04/10/1992', '', 'PNS', '0909090909', 8000, NULL);
insert into NHANVIEN VALUES ('PNS00007', 'Lê', 'Hùng', 'Tion', 6600, 'Quảng Bình', '2/01/1989', 'PNS00006', 'PNS', '01237612253', 2000, NULL);
insert into NHANVIEN VALUES ('PNS00008', 'Dương', 'Hào', 'Nauy', 6200, 'Quảng Ngãi', '2/02/1989', 'PNS00006', 'PNS', '01200046853', 2000, NULL);
insert into NHANVIEN VALUES ('PNS00009', 'Gia', 'Lê', 'Peter', 6200, 'Quảng Nam', '2/03/1989', 'PNS00006', 'PNS', '01237693853', 2000, NULL);
insert into NHANVIEN VALUES ('PNS00010', 'Huấn', 'Tuấn', 'Crist', 6300, 'Bình Định', '2/04/1989', 'PNS00006', 'PNS', '0197246853', 2000, NULL);
insert into NHANVIEN VALUES ('PNS00011', 'Nguyễn', 'Gia', 'Duy', 6090, 'Bình Định', '2/05/1989', 'PNS00006', 'PNS', '0123145853', 2000, NULL);

---PHONG KINH DOANH---
insert into NHANVIEN VALUES ('PKD10000', 'Huỳnh', 'Bảo', 'Tú', 9500, 'Khánh Hòa', '01/04/1991', '', 'PKD', '01211175832', 3227, NULL);
insert into NHANVIEN VALUES ('PKD10001', 'Huỳnh', 'Bảo', 'Nhi', 5500, 'Khánh Hòa', '21/04/1991', '', 'PKD', '01239275832', 2227, NULL);
insert into NHANVIEN VALUES ('PKD10002', 'Mai', 'Văn', 'Nghị', 7000, 'Quảng Ngãi', '23/04/1992', 'PKD10001', 'PKD', '0907584934', 6000, NULL);
insert into NHANVIEN VALUES ('PKD10003', 'Tạ', 'Văn', 'Nghị', 7000, 'Quảng Ngãi', '23/04/1992', 'PKD10001', 'PKD', '0907584934', 6000, NULL);
insert into NHANVIEN VALUES ('PKD10004', 'Chu', 'Văn', 'Nghị', 7000, 'Quảng Ngãi', '23/04/1992','DD/MM/YYYY'), 'PKD10001', 'PKD', '0907584934', 6000, NULL);
insert into NHANVIEN VALUES ('PKD10005', 'Hứa', 'Văn', 'Nghị', 7000, 'Quảng Ngãi', '23/04/1992', 'PKD10001', 'PKD', '0907584934', 6000, NULL);

insert into NHANVIEN VALUES ('PKD10006', 'Huỳnh', 'Văn', 'Thế', 7000, 'Quảng Ngãi', '23/04/1992', '', 'PKD', '0907999934', 6000, NULL);
insert into NHANVIEN VALUES ('PKD10007', 'Mai', 'Chu', 'Tuấn', 7000, 'Quảng Nam', '22/11/1993', 'PKD10006', 'PKD', '0934584934', 5000), NULL);
insert into NHANVIEN VALUES ('PKD10008', 'Mai', 'Thế', 'Hào', 7000, 'Quảng Ngãi', '21/12/1993', 'PKD10006', 'PKD', '0900084934', 4000, NULL);
insert into NHANVIEN VALUES ('PKD10009', 'Nguyễn', 'Hòa', 'Huấn', 7000, 'Quảng Trị', '20/10/1991', 'PKD10006', 'PKD', '0907585534', 5500, NULL);
insert into NHANVIEN VALUES ('PKD10010', 'Nguyễn', 'Ngữ', 'Huy', 7000, 'Quảng Ngãi', '19/09/1991', 'PKD10006', 'PKD', '0907599934', 6000, NULL);
insert into NHANVIEN VALUES ('PKD10011', 'Nguyễn', 'Hung', 'Chung', 7000, 'Quảng Ngãi', '23/04/1991', 'PKD10006', 'PKD', '0900084934', 6000, NULL);

---PHONG KE HOACH---
insert into NHANVIEN VALUES ('PKH20000', 'Chu', 'Bá', 'Thông', 9500, 'Bình Định', '01/01/1994', '', 'PKH', '0698888454', 8000, NULL);
insert into NHANVIEN VALUES ('PKH20001', 'Chu', 'Văn', 'Nghị', 6500, 'Bình Định', '31/1/1994', '', 'PKH', '0695358454', 4000, NULL);
insert into NHANVIEN VALUES ('PKH20002', 'Lê', 'Tú', 'Uyên', 7000, 'Khánh Hòa', '01/02/1988', 'PKH20001', 'PKH', '07834345335', 2000, NULL);
insert into NHANVIEN VALUES ('PKH20003', 'Lê', 'Nguyễn', 'Hoài', 7000, 'Khánh Hòa', '02/02/1988', 'PKH20001', 'PKH', '07114345335', 2000, NULL);
insert into NHANVIEN VALUES ('PKH20004', 'Hà', 'Huy', 'Vũ', 7000, 'Vinh', '03/02/1988', 'PKH20001', 'PKH', '01114345335', 2000, NULL);
insert into NHANVIEN VALUES ('PKH20005', 'Hà', 'Chung', 'Uy', 7000, 'Vinh', '04/02/1988', 'PKH20001', 'PKH', '07832315335', 2000, NULL);

insert into NHANVIEN VALUES ('PKH20006', 'Hà', 'Phú', 'Chung', 7000, 'Vinh', '05/02/1988', '', 'PKH', '07856345335', 2000, NULL);
insert into NHANVIEN VALUES ('PKH20007', 'Nguyễn', 'Trần', 'Đan', 7000, 'Lâm Đồng', '06/02/1988', 'PKH20006', 'PKH', '07444345335', 2000, NULL);
insert into NHANVIEN VALUES ('PKH20008', 'Nguyễn', 'Lữ', 'Coco', 7000, 'Vinh', '07/02/1988', 'PKH20006', 'PKH', '07222345335', 2000, NULL);
insert into NHANVIEN VALUES ('PKH20009', 'Nguyễn', 'Chung', 'Tina', 7000, 'Lâm Đồng', '08/02/1988', 'PKH20006', 'PKH', '07884345335', 2000, NULL);
insert into NHANVIEN VALUES ('PKH20010', 'Tuấn', 'Nguyễn', 'Hà', 7000, 'Lâm Đồng', '12/02/1988', 'PKH20006', 'PKH', '07833345335', 2000, NULL);
insert into NHANVIEN VALUES ('PKH20011', 'Lựu', 'Huy', 'Tùng', 7000, 'Khánh Hòa', '11/02/1988', 'PKH20006', 'PKH', '07835545335', 2000, NULL);
--PHONG THUC DIEN DE AN---
insert into NHANVIEN VALUES ('PTHDA30000', 'Trần', 'Hữu', 9800, 'Đà Nẵng', '29/04/1992', '', 'PTHDA', '0980063723', 9000, NULL);
insert into NHANVIEN VALUES ('PTHDA30001', 'Trần', 'Hà', 'Anh', 6800, 'Đà Nẵng', '04/04/1992', '', 'PTHDA', '0987563723', 1000, NULL);
insert into NHANVIEN VALUES ('PTHDA30002', 'Trần', 'Trung', 'Quân', 6900, 'Quảng Nam', '03/01/1992', 'PTHDA30001', 'PTHDA', '0955679563', 5000, NULL);
insert into NHANVIEN VALUES ('PTHDA30003', 'Nguyễn', 'Trung', 'Quân', 6900, 'Quảng Nam', '03/02/1992', 'PTHDA30001', 'PTHDA', '0920549563', 5000, NULL);
insert into NHANVIEN VALUES ('PTHDA30004', 'Nguyễn', 'Quốc', 'Quân', 6900, 'Quảng Ngãi','03/03/1992', 'PTHDA30001', 'PTHDA', '092119563', 5000, NULL);
insert into NHANVIEN VALUES ('PTHDA30005', 'Nguyễn', 'Lữ', 'Hà', 6900, 'Quảng Ngãi', '03/04/1992', 'PTHDA30001', 'PTHDA', '0920555563', 5000, NULL);

insert into NHANVIEN VALUES ('PTHDA30006', 'Nguyễn', 'Trung', 'Tính', 6900, 'Quảng Ngãi', '03/04/1992', '', 'PTHDA', '0922429563', 5000, NULL);
insert into NHANVIEN VALUES ('PTHDA30007', 'Nguyễn', 'Trung', 'Chung', 6900, 'Quảng Ngãi', '03/05/1992', 'PTHDA30006', 'PTHDA', '0900019563', 5000, NULL);
insert into NHANVIEN VALUES ('PTHDA30008', 'Lê', 'Trung', 'Hiếu', 6900, 'Quảng Trị', '03/05/1993', 'PTHDA30006', 'PTHDA', '0920222263', 5000, NULL);
insert into NHANVIEN VALUES ('PTHDA30009', 'Lê', 'Trung', 'Hải', 6900, 'Quảng Trị', '03/05/1994', 'PTHDA30006', 'PTHDA', '0928888563', 5000, NULL);
insert into NHANVIEN VALUES ('PTHDA30010', 'Lê', 'Trung', 'Tuấn', 6900, 'Quảng Trị', '03/05/1995', 'PTHDA30006', 'PTHDA', '0977779563', 5000, NULL);
insert into NHANVIEN VALUES ('PTHDA30011', 'Dương', 'Trung', 'Quân', 6900, 'Quảng Trị', '03/05/1996', 'PTHDA30006', 'PTHDA', '0666619563', 5000, NULL);

---NHAN VIEN BINH THUONG---
insert into NHANVIEN VALUES ('NV40000', 'Nguyễn', 'Hà', 'Ly', 7000, 'Vinh', '17/01/1985', 'PTHDA30007', '', '07222311135', 2000, NULL);
insert into NHANVIEN VALUES ('NV40001', 'Nguyễn', 'Tuấn', 6000, 'Vinh', '27/02/1986', 'PTHDA30007', '', '07222245335', 2000, NULL);
insert into NHANVIEN VALUES ('NV40002', 'Nguyễn', 'Thị', 'Tuấn', 5000, 'Vinh', '07/03/1987', 'PTHDA30007', '', '07244445335', 2000, NULL);
insert into NHANVIEN VALUES ('NV40003', 'Lê', 'Hòa', 'Hữu', 4000, 'Phú Yên', '17/04/1988', 'PTHDA30007', '', '07222555335', 2000, NULL);
insert into NHANVIEN VALUES ('NV40004', 'Lê', 'Hào', 'Nghị', 5400, 'Phú Yên', '27/05/1989', 'PTHDA30007', '', '07666645335', 2000, NULL);
insert into NHANVIEN VALUES ('NV40005', 'Lê', 'Huy', 'Đức', 4300, 'Phú Yên', '07/06/1990', 'PTHDA30011', '', '07222225335', 2000, NULL);
insert into NHANVIEN VALUES ('NV40006', 'Lê', 'Đức', 'Thành', 4000, 'Phú Yên', '17/07/1991', 'PTHDA30011', '', '07632345335', 2000, NULL);
insert into NHANVIEN VALUES ('NV40007', 'Trần', 'Minh', 'Lâm', 6000, 'Phú Yên', '27/08/1988', 'PTHDA30011', '', '07214245335', 2000, NULL);
insert into NHANVIEN VALUES ('NV40008', 'Trần', 'Chu', 'Đức', 7700, 'Vinh', '07/09/1990', 'PTHDA30011', '', '07222456335', 2000, NULL);
insert into NHANVIEN VALUES ('NV40009', 'Trần', 'Hữu', 'Minh', 7800, 'Vinh', '17/10/1989', 'PTHDA30011', '', '07221223535', 2000, NULL);
insert into NHANVIEN VALUES ('NV40010', 'Trần', 'Mã', 'Dương', 7200, 'Vinh', '27/11/1987', 'PTHDA30011', '', '07222145335', 2000, NULL);
select * from NHANVIEN;
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


---UPDATE DATA---
UPDATE PHONGBAN
SET TRPHG = 'PNS00000'
WHERE MAPB = 'PNS';

UPDATE PHONGBAN
SET TRPHG = 'PKD10000'
WHERE MAPB = 'PKD';

UPDATE PHONGBAN
SET TRPHG = 'PKH20000'
WHERE MAPB = 'PKH';

UPDATE PHONGBAN
SET TRPHG = 'PTHDA30000'
WHERE MAPB = 'PTHDA';
select * from PHONGBAN;
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
--xóa user từ mã nhân viên
declare
  abc varchar2(200);
begin
for MANV in (select MANV from NHANVIEN)
loop
  abc := 'drop user ' || MANV.MANV;
  execute immediate abc;
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





/*
DROP TABLE NHANVIEN CASCADE CONSTRAINTS;
DROP TABLE PHONGBAN CASCADE CONSTRAINTS;
DROP TABLE DEAN CASCADE CONSTRAINTS;
DROP TABLE DIADIEM_PHG CASCADE CONSTRAINTS;
DROP TABLE PHANCONG CASCADE CONSTRAINTS;
*/





--CREATE ROLE---------------------------------------------------------------------------------
CREATE ROLE p_NHANVIEN;
GRANT UPDATE, SELECT ON NHANVIEN TO p_NHANVIEN;

CREATE ROLE p_GIAMDOC;
GRANT SELECT ON DEAN TO p_GIAMDOC;
GRANT SELECT, UPDATE ON NHANVIEN TO p_GIAMDOC;
GRANT SELECT ON PHONGBAN TO p_GIAMDOC;

--Giam đốc được phép sửa các trường "lương, phụ cấp"
--cần viết ra procudure update dữ liệu trên bảng nhân viên--
---------------------------------------
------------------------------------
CREATE ROLE p_TRUONGPHONG;



----------------------------------------------------------------------------
--Chỉ có giám đốc, các trưởng phòng, những nhân viên Phòng Thực hiện đề án,
--nhân viên Phòng Kinh doanh và Phòng Kế hoạch mới có thể xem thông tin về
--đề án và việc đăng ký tham gia đề án
------------------------------------------------------------------------------
CREATE ROLE p_NHANVIEN_PKD;
CREATE ROLE p_NHANVIEN_PKH;
CREATE ROLE p_NHANVIEN_THDA;
--TẠO VIEW để xem thông tin đề án
CREATE OR REPLACE VIEW VIEW_DEAN
AS
  SELECT PC.MANV, DA.MADA, DA.TENDA, DA.NGAYBD, DA.DIADIEM_DA, DA.PHONG, PB.TENPB, PC.THOIGIAN
  FROM DEAN DA, PHONGBAN PB, PHANCONG PC, NHANVIEN NV
  WHERE DA.PHONG = PB.MAPB
      AND DA.MADA = PC.MADA
      AND NV.MANV = PC.MANV;
------------------------------------------------------
--lẤY NHÂN VIÊN LÀ giám đốc và cấp quyền cho giám đốc đó từ role
begin
for o_GIAMDOC in (select MANV from NHANVIEN where GHICHU BETWEEN 1 AND 99)
loop
  execute immediate 'GRANT p_GIAMDOC TO ' || o_GIAMDOC.MANV; 
end loop;
end;
---Lấy những nhân viên là trưởng phòng ban nào đó, và cấp quyền cho trưởng phòng đó từ ROLE bạn muốn
begin
for o_TRGPHG in (select TRPHG from PHONGBAN where TRPHG NOT IN (SELECT TRPHG
                                                                      FROM PHONGBAN
                                                                      WHERE MAPB = 'PNS'))
loop
  execute immediate 'GRANT p_TRUONGPHONG TO ' || o_TRGPHG.TRPHG; 
end loop;
end;

--Lấy những nhân viên là NHÂN VIÊN thuộc phòng thực hiện đề án và cấp quyền cho nhân viên đó từ ROLE bạn muốn
begin
for o_PHGTHDA in (select MANV 
                    from NHANVIEN NV, PHONGBAN PB 
                    where NV.PHG = PB.MAPB
                        AND PB.MAPB = 'PTHDA'
                  )
loop
  execute immediate 'GRANT p_NHANVIEN_THDA TO ' || o_PHGTHDA.MANV; 
end loop;
end;

----Lấy những nhân viên là NHÂN VIÊN thuộc phòng kế hoạch  và cấp quyền cho nhân viên đó từ ROLE bạn muốn
begin
for o_PHGKH in (select MANV 
                    from NHANVIEN NV, PHONGBAN PB 
                    where NV.PHG = PB.MAPB
                        AND PB.MAPB = 'PKH'
                  )
loop
  execute immediate 'GRANT p_NHANVIEN_PKH TO ' || o_PHGKH.MANV; 
end loop;
end;
--Lấy những nhân viên là NHÂN VIÊN thuộc phòng kinh doanh và cấp quyền cho nhân viên đó từ ROLE bạn muốn
begin
for o_PHGKD in (select MANV 
                    from NHANVIEN NV, PHONGBAN PB 
                    where NV.PHG = PB.MAPB
                        AND PB.MAPB = 'PKD'
                  )
loop
  execute immediate 'GRANT p_NHANVIEN_PKD TO ' || o_PHGKD.MANV; 
end loop;
end;


GRANT SELECT ON VIEW_DEAN TO p_NHANVIEN_PKD, p_NHANVIEN_PKH, p_NHANVIEN_THDA, p_TRUONGPHONG, p_GIAMDOC;





