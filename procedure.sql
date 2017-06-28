--------------PROC INSERT, UPDATE, DELETE trên DEAN cho nhân viên phòng kế hoạch----------

---PROC INSERT DEAN---
CREATE OR REPLACE PROCEDURE INSERT_DEAN(  
p_mada DEAN.MADA%TYPE,  
p_tenda DEAN.TENDA%TYPE,  
p_ngaybd DEAN.NGAYBD%TYPE,
p_phong DEAN.PHONG%TYPE,
p_diadiem_da DEAN.DIADIEM_DA%TYPE)
IS  
BEGIN  
INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG, DIADIEM_DA)
      VALUES (p_mada, p_tenda, p_ngaybd, p_phong, p_diadiem_da);
COMMIT;  
END; 



---UPDATE PROC DEAN---
CREATE OR REPLACE PROCEDURE UPDATE_DEAN 
(   
  p_mada DEAN.MADA%TYPE,  
  p_tenda DEAN.TENDA%TYPE,  
  p_ngaybd DEAN.NGAYBD%TYPE,
  p_phong DEAN.PHONG%TYPE,
  p_diadiem_da DEAN.DIADIEM_DA%TYPE
)
is
BEGIN  
  
  UPDATE DEAN 
  SET MADA = p_mada, TENDA = p_tenda, NGAYBD = p_ngaybd, PHONG = p_phong, DIADIEM_DA = p_diadiem_da 
  WHERE MADA = p_mada;  
  COMMIT; 
END; 

---DELETE PROC DEAN--
CREATE OR REPLACE PROCEDURE DELETE_DEAN 
(   
  p_mada IN DEAN.MADA%TYPE
)  
IS  
BEGIN  
  DELETE FROM DEAN WHERE MADA = p_mada;  
END;