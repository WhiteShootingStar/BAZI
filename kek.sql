DROP TABLE SERVICE_ONE_OPER;
DROP TABLE SERVICE;
DROP TABLE ANIMM;
DROP TABLE OPERATION;
DROP TABLE VISIT;
DROP TABLE ANIMAL;
DROP TABLE OWNER;
DROP TABLE DOCTOR;



CREATE TABLE OWNER
(IDOWN NUMBER (4)PRIMARY KEY,
FNAME VARCHAR2(15),
SURNAME VARCHAR2(20),
CITY VARCHAR2(30),
HOUSE NUMBER(5));

INSERT INTO OWNER VALUES (1, 'KEK','SHREK','BOLOTO',228);
INSERT INTO OWNER VALUES (2, 'PUDGE','LOTARIST','FOUNTAIN',322);
INSERT INTO OWNER VALUES (3, 'VATALIY','����','�������',27);
INSERT INTO OWNER VALUES (4, 'AMURO','RAY','SIDE',7);
INSERT INTO OWNER VALUES (5, 'KAMILL','BIDAN','SIDE',3);
INSERT INTO OWNER VALUES (6, 'VITYIA','LOX','HOHL',8);
SELECT *
FROM OWNER;



CREATE TABLE ANIMAL 
(IDA NUMBER(4) PRIMARY KEY,
ANAME VARCHAR2(15),
TYPE_ANIM VARCHAR2(15),
DATE_OF_BIRTH DATE,
HIS_OWNER NUMBER(4),
FOREIGN KEY (HIS_OWNER)
REFERENCES OWNER (IDOWN));

INSERT INTO ANIMAL VALUES (11, 'HARO','DOG',TO_DATE('20.1.2016', 'DD.MM.YYYY'),1);
INSERT INTO ANIMAL VALUES (12, 'PANGO','CAT',TO_DATE('15.02.2017', 'DD.MM.YYYY'),2);
INSERT INTO ANIMAL VALUES (13, 'BALLON','DOG',TO_DATE('25.2.2013', 'DD.MM.YYYY'),2);
INSERT INTO ANIMAL VALUES (14, 'DUSHA','LIZARD',TO_DATE('20.1.2013', 'DD.MM.YYYY'),3);
INSERT INTO ANIMAL VALUES (15, 'NYA','CAT',TO_DATE('24.12.2013', 'DD.MM.YYYY'),4);
INSERT INTO ANIMAL VALUES (16, 'BARSIK','CAT',TO_DATE('12.1.2015',' DD.MM.YYYY'),5);
INSERT INTO ANIMAL VALUES (17, 'LALKA','HAMSTER',TO_DATE('30.1.2016', 'DD.MM.YYYY'),1);
INSERT INTO ANIMAL VALUES (18, 'SHARKI','GOLDFISH',TO_DATE('17.9.2015', 'DD.MM.YYYY'),1);
SELECT *
FROM ANIMAL;


CREATE TABLE ANIMM(
IDMM NUMBER(4) PRIMARY KEY,
HEIGTH FLOAT(5),
WEIGTH FLOAT(5),
AN NUMBER(4),
FOREIGN KEY (AN)
REFERENCES ANIMAL(IDA));
INSERT INTO ANIMM VALUES (200,0.24,12,11);
INSERT INTO ANIMM VALUES (201,0.235,12.1,12);
INSERT INTO ANIMM VALUES (202,0.34,16.7,13);
INSERT INTO ANIMM VALUES (203,0.56,21.8,14);
INSERT INTO ANIMM VALUES (204,0.21,26.3,15);
INSERT INTO ANIMM VALUES (205,0.43,12.8,16);
INSERT INTO ANIMM VALUES (206,2366,1.7,17);
INSERT INTO ANIMM VALUES (207,0.38,18.7,18);

CREATE TABLE DOCTOR 
(IDD NUMBER(4) PRIMARY KEY,
SNAME VARCHAR2(15),
FIELD VARCHAR2(25),
SALARY NUMBER(5));
INSERT INTO DOCTOR VALUES (25,'BOR', 'DIGESTION TRACT', 1000);
INSERT INTO DOCTOR VALUES (26,'CHLOR', 'SKELETON', 1250);
INSERT INTO DOCTOR VALUES (27,'ROM', 'JAWS', 750);
INSERT INTO DOCTOR VALUES (28,'GROZA', 'EYES', 1500);
INSERT INTO DOCTOR VALUES (29,'CHROM', 'REPRODUCTIVE SYSTEM ', 1500);
SELECT *
FROM DOCTOR;

CREATE TABLE VISIT
(IDV NUMBER(5) PRIMARY KEY,
DOC NUMBER(4),
ANIM NUMBER(4),
DATE_OF_VIS DATE,
FOREIGN KEY (DOC)
REFERENCES DOCTOR(IDD),
FOREIGN KEY (ANIM)
REFERENCES ANIMAL(IDA));

INSERT INTO VISIT VALUES (90,25,11,TO_DATE('20.1.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (91,26,12,TO_DATE('20.1.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (92,27,13,TO_DATE('22.2.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (93,28,14,TO_DATE('23.2.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (94,29,15,TO_DATE('24.3.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (95,25,16,TO_DATE('20.1.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (96,25,11, TO_DATE('24.3.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (97,26,14, TO_DATE('25.3.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (98,26,18, TO_DATE('25.3.2018', 'DD.MM.YYYY'));
INSERT INTO VISIT VALUES (99,27,18, TO_DATE('25.3.2018', 'DD.MM.YYYY'));
SELECT *
FROM VISIT;

CREATE TABLE SERVICE
(IDSERV NUMBER(4) PRIMARY KEY,
SERVICE_NAME VARCHAR2(30),
PRICE NUMBER (5));
INSERT INTO SERVICE VALUES (100,'JAW_FIXING' ,1250);
INSERT INTO SERVICE VALUES (101,'EYES CHEKING AND CURING' ,3500);
INSERT INTO SERVICE VALUES (102,'SKELETON CURING' ,1800);
INSERT INTO SERVICE VALUES (103,'DIGESTION CHEKING' ,2000);
INSERT INTO SERVICE VALUES (104,'REMAINS ANALYSIS' ,1800);
INSERT INTO SERVICE VALUES (105,'REPRODUCTIVE SYSTEM CARE' ,4200);

SELECT *
FROM SERVICE;

CREATE TABLE OPERATION 
(IDOPER NUMBER(4) PRIMARY KEY,
TIME_OF_OPER VARCHAR2(15),

VIS NUMBER(4),
FOREIGN KEY (VIS) REFERENCES VISIT(IDV));

INSERT INTO OPERATION VALUES (80,'12:45'  ,90);
INSERT INTO  OPERATION VALUES (81,'9:00' ,91);
INSERT INTO  OPERATION VALUES (82,'13:00'  ,92);
INSERT INTO OPERATION VALUES (83,'14:50' ,93);
INSERT INTO OPERATION VALUES (84,'9:30'  ,94);
INSERT INTO  OPERATION VALUES (85,'12:20'  ,95);
INSERT INTO  OPERATION VALUES (86,'16:20' ,96);
INSERT INTO  OPERATION VALUES (87, '9:00'  ,97);
INSERT INTO  OPERATION VALUES (88, '14:50' ,97);
INSERT INTO  OPERATION VALUES (89, '13:00' ,98);

SELECT *
FROM OPERATION;

CREATE TABLE SERVICE_ONE_OPER
(IDSOO NUMBER(4) PRIMARY KEY,
SERV NUMBER(4),
OPER NUMBER(4),
FOREIGN KEY (SERV) REFERENCES SERVICE(IDSERV),
FOREIGN KEY (OPER) REFERENCES OPERATION (IDOPER));

INSERT INTO SERVICE_ONE_OPER VALUES (110 , 100 ,80);
INSERT INTO SERVICE_ONE_OPER VALUES (111 , 101 ,81);
INSERT INTO SERVICE_ONE_OPER VALUES (112 , 102 ,82);
INSERT INTO SERVICE_ONE_OPER VALUES (113 , 103 ,83);
INSERT INTO SERVICE_ONE_OPER VALUES (114 , 104 ,84);
INSERT INTO SERVICE_ONE_OPER VALUES (115 , 105 ,85);
INSERT INTO SERVICE_ONE_OPER VALUES (116 , 105 ,86);
INSERT INTO SERVICE_ONE_OPER VALUES (117 , 105 ,87);
INSERT INTO SERVICE_ONE_OPER VALUES (118 , 105 ,88);
INSERT INTO SERVICE_ONE_OPER VALUES (119 , 105 ,89);

SELECT *
FROM SERVICE_ONE_OPER;

-- QUERIES
SELECT SNAME,FIELD,SALARY  -- FINDING DOCTORS, EARNING MORE THAN AVERAGE SALARY 
FROM DOCTOR
WHERE SALARY > (SELECT AVG(SALARY)
                FROM DOCTOR);
                
 SELECT  E.FNAME || ' ' || E.SURNAME || ' HAS AN ANIMAL OF TYPE ' || A.TYPE_ANIM || ' WITH THE DATE OF BIRTH ' ||  A.DATE_OF_BIRTH
 FROM OWNER E,ANIMAL A
WHERE E.IDOWN = A.HIS_OWNER AND A.DATE_OF_BIRTH BETWEEN '12.1.2015' AND  '15.02.2017' ;


SELECT  'IN ' || V.DATE_OF_VIS || ' THERE WILL BE PERFOMED ' ||count (S.SERVICE_NAME) || ' SERVICES' 
FROM SERVICE S, OPERATION O , SERVICE_ONE_OPER SE, VISIT V
WHERE S.IDSERV = SE.SERV AND O.IDOPER = SE.OPER AND V.IDV=O.VIS
GROUP BY V.DATE_OF_VIS;


SELECT  DOCTOR.SNAME,COUNT( ANAME)  -- FIND HOW MANY VISITS EACH DOCTOR GONNDA HAVE
FROM ANIMAL , VISIT , DOCTOR 
WHERE ANIMAL.IDA=VISIT.ANIM AND VISIT.DOC = DOCTOR.IDD
GROUP BY DOCTOR.SNAME;

SELECT ANAME, COUNT (IDOPER), MAX(DATE_OF_VIS) -- COUNTING FOR EACH ANIMAL HIS NUMBER OF OPERATIONS AND THE DATE OF THE CLOSEST visit
FROM ANIMAL, VISIT,OPERATION
WHERE ANIMAL.IDA=VISIT.ANIM AND VISIT.IDV=OPERATION.VIS
GROUP BY ANAME;


SELECT COUNT (IDOPER) || ' OPERATION  WILL COST MORE THAN AVERAGE' -- FINDING HOW MANY OPERATIONS WILL COST MORE THAN AVERAGE 
FROM OPERATION,SERVICE_ONE_OPER,SERVICE
WHERE OPERATION.IDOPER = SERVICE_ONE_OPER.OPER AND SERVICE_ONE_OPER.SERV=SERVICE.IDSERV
AND SERVICE.PRICE > (SELECT  AVG(PRICE)
FROM SERVICE);

SELECT  AVG(PRICE)
FROM SERVICE;

SELECT A.ANAME, A.TYPE_ANIM  --FINDING 3  YOUNGEST ANIMALS 
FROM ANIMAL A
WHERE 3 > (SELECT COUNT(DATE_OF_BIRTH)
FROM ANIMAL
WHERE A.DATE_OF_BIRTH<DATE_OF_BIRTH);
SELECT *
FROM ANIMAL
ORDER BY DATE_OF_BIRTH DESC;

SELECT TYPE_ANIM  ||' ' || IDA ||  ' WITH THE DATE DATE_OF_BIRTH ' || DATE_OF_BIRTH || ' IS THE MOST HEAVY . WITH THE MASS OF ' || WEIGTH -- FINDING THE MOST HEAVIEST AND THE MOST TALLSEST ANIMALS
FROM ANIMAL, ANIMM
WHERE ANIMAL.IDA =ANIMM.AN AND ANIMM.WEIGTH = (SELECT MAX(WEIGTH)
FROM ANIMM)
UNION
SELECT TYPE_ANIM  ||' ' || IDA ||  ' WITH THE DATE DATE_OF_BIRTH ' || DATE_OF_BIRTH || ' IS THE MOST TALLEST . WITH THE HEIGTH OF ' || HEIGTH
FROM ANIMAL, ANIMM
WHERE ANIMAL.IDA =ANIMM.AN AND ANIMM.HEIGTH = (SELECT MAX(HEIGTH)
FROM ANIMM);


Select O.FNAME,COUNT (A.IDA) -- FOR EACH OWNER FIND HOW MANY ANIMALS ARE REQISTERED IN OUR DATABASE
FROM ANIMAL A, OWNER O
WHERE A.HIS_OWNER =O.IDOWN AND A.IDA =  (SELECT IDA FROM ANIMAL  WHERE  A.IDA = IDA) 
group by O.FNAME;

SET SERVEROUTPUT ON; 
CREATE OR  REPLACE TRIGGER OWNERTRIG--1
BEFORE INSERT
ON OWNER
FOR EACH ROW
BEGIN
IF :NEW.FNAME IS NULL OR  :NEW.SURNAME IS NULL
THEN 
--DBMS_OUTPUT.PUT_LINE('NO, PLEASE FULLY PROVIDE NAME AND SURNAME');
Raise_application_error(-20003,'NO, PLEASE FULLY PROVIDE NAME AND SURNAME ');
END IF;
END;

INSERT INTO OWNER(IDOWN,STREET) VALUES (1488,'PUSHKINA');

SELECT    *
FROM OWNER;
DELETE FROM OWNER WHERE IDOWN =1488;

Set serveroutput on 
DROP TRIGGER ANIMTRIG; --2
CREATE OR REPLACE TRIGGER ANIMTRIG
AFTER INSERT
ON ANIMAL
DECLARE
X INTEGER;
Y DATE;
BEGIN
SELECT COUNT( DISTINCT TYPE_ANIM) INTO X 
FROM ANIMAL;
SELECT MAX(DATE_OF_BIRTH) INTO Y
FROM ANIMAL;
DBMS_OUTPUT.PUT_LINE('NOW WE HAVE ' || X || ' DIFFERENT SPECIES REGISTERED. THE LAST DATE OF BIRTH IS ' );
DBMS_OUTPUT.PUT_LINE('lul' );

END;

INSERT INTO ANIMAL VALUES(1337,'PIDGA', 'LILKA', '08.06.2018',1);
SELECT *
FROM ANIMAL;
DELETE FROM ANIMAL WHERE IDA =1337;

CREATE OR REPLACE TRIGGER DOCTRIG--3
BEFORE UPDATE
ON DOCTOR
FOR EACH ROW
BEGIN
IF :NEW.SALARY < 500
THEN
:NEW.SALARY := :OLD.SALARY;
DBMS_OUTPUT.PUT_LINE('YOU PROVIDED TOO LOW SALARY FOR DOCTOR, THINS FOR HIS/HER FAMILY, VALUE RETURNED TO PREVIOUS' );
END IF;
IF :NEW.SALARY >5000
THEN
:NEW.SALARY :=:OLD.SALARY;
DBMS_OUTPUT.PUT_LINE('WOW, YOU ARE DEFINETELY ON THE WAY TO MAKE COMPANY BANKRUPT, OPERATION REVERTED' );
END IF;
END;

UPDATE DOCTOR
SET SALARY =6000
WHERE SNAME ='GROZA';

SELECT *
FROM DOCTOR;


DROP TRIGGER ANIMMTRIG;
CREATE OR REPLACE TRIGGER ANIMMTRIG--4
AFTER UPDATE
ON ANIMM
DECLARE 
X INTEGER;
Y INTEGER;
Z INTEGER;
BEGIN
SELECT AVG(WEIGTH / (HEIGTH*HEIGTH))INTO Z
FROM ANIMM;

SELECT COUNT(IDMM) INTO X 
FROM ANIMM
WHERE WEIGTH / (HEIGTH*HEIGTH)>Z;

SELECT COUNT(IDMM) INTO Y 
FROM ANIMM
WHERE WEIGTH / (HEIGTH*HEIGTH)<Z;

DBMS_OUTPUT.PUT_LINE ('THERE ARE ' || X || ' ANIMALS, WHOSE BMI IS TOO BIG');
DBMS_OUTPUT.PUT_LINE ('THERE ARE ' || Y || ' ANIMALS, WHOSE BMI IS TOO SMALL');
IF
X>Y OR X<Y
THEN
Raise_application_error(-20003,'X IS ' || X || ' AND Y IS ' || Y);
END IF;
END;

SELECT AVG(WEIGTH / (HEIGTH*HEIGTH))
FROM ANIMM
UNION
SELECT (WEIGTH / (HEIGTH*HEIGTH))
FROM ANIMM
WHERE IDMM =206;



SELECT *
FROM ANIMM;

UPDATE ANIMM
SET HEIGTH =10
WHERE IDMM =200;

SELECT *
FROM SERVICE;



CREATE OR REPLACE TRIGGER OPERTRIG --5
BEFORE DELETE
ON OPERATION
FOR EACH ROW
BEGIN
DELETE FROM SERVICE_ONE_OPER A WHERE A.OPER=:OLD.IDOPER;  
END;

SELECT *
FROM OPERATION;
SELECT *
FROM SERVICE_ONE_OPER;
DELETE FROM OPERATION WHERE IDOPER=80;


DROP TRIGGER SERVICETRIG;
drop table SERVICE_HIST;

CREATE TABLE SERVICE_HIST AS  SELECT *
FROM SERVICE;
DELETE FROM SERVICE_HIST;
ALTER TABLE SERVICE_HIST ADD DATE_OF_CHANGE DATE;
SELECT *
FROM SERVICE_HIST;

CREATE OR REPLACE TRIGGER SERVICETRIG --6
AFTER DELETE
ON SERVICE
FOR EACH ROW
BEGIN
DELETE FROM SERVICE_ONE_OPER A WHERE A.SERV =:OLD.IDSERV;
INSERT INTO SERVICE_HIST VALUES   (:OLD.IDSERV, :OLD.SERVICE_NAME,:OLD.PRICE, SYSDATE);
END;
SELECT * FROM SERVICE;
DELETE FROM SERVICE
WHERE IDSERV =105;
SELECT * FROM SERVICE_HIST;

--procedures
Set serveroutput on ;
CREATE OR REPLACE PROCEDURE ANIMS_MES_INCR (ANIMTYPE VARCHAR2, COEFFICIENT FLOAT) AS NO_TYPE EXCEPTION;BAD_COEFF EXCEPTION;
CURSOR CUR1 IS SELECT  IDA FROM ANIMAL WHERE TYPE_ANIM = ANIMTYPE;
B NUMBER(4);
BEGIN
IF  COEFFICIENT<=0 THEN RAISE BAD_COEFF;
ELSE
OPEN CUR1;
LOOP
FETCH CUR1 INTO B;
EXIT WHEN CUR1% NOTFOUND;
IF  CUR1%ROWCOUNT <1 THEN RAISE NO_TYPE;
ELSE UPDATE ANIMM
SET ANIMM.HEIGTH =ANIMM.HEIGTH * COEFFICIENT WHERE ANIMM.AN = B;
END IF;
END LOOP;
END IF;
CLOSE CUR1;
EXCEPTION WHEN NO_TYPE THEN DBMS_OUTPUT.PUT_LINE ('NO SUCH TYPE');
WHEN BAD_COEFF THEN DBMS_OUTPUT.PUT_LINE('BAD COEFF');
END;
EXECUTE ANIMS_MES_INCR('CAT',1);
SELECT * FROM ANIMM;

CREATE OR REPLACE PROCEDURE FOR_CITY ( CIT VARCHAR2, NEWDATE DATE)  AS NO_CITY EXCEPTION; BAD_DATE EXCEPTION;
CURSOR CUR2 IS SELECT IDV FROM VISIT, ANIMAL, OWNER WHERE OWNER.CITY=CIT AND ANIMAL.HIS_OWNER=OWNER.IDOWN AND VISIT.ANIM =ANIMAL.IDA;
B NUMBER(4);
D DATE;
C NUMBER(4);
BEGIN 
SELECT  MIN(DATE_OF_VIS)INTO D FROM VISIT;
IF NEWDATE<D THEN RAISE BAD_DATE;
ELSE
SELECT COUNT(IDOWN) INTO C FROM OWNER WHERE OWNER.CITY =CIT;
IF C=0 THEN RAISE NO_CITY;
ELSE OPEN CUR2;
LOOP FETCH CUR2 INTO B;
EXIT WHEN CUR2% NOTFOUND;
UPDATE VISIT  SET VISIT.DATE_OF_VIS = NEWDATE WHERE VISIT.IDV = B;
END LOOP;
END IF;
END IF;
CLOSE CUR2;
EXCEPTION  WHEN NO_CITY THEN DBMS_OUTPUT.PUT_LINE ('NO SUCH CITY');
WHEN BAD_DATE THEN DBMS_OUTPUT.PUT_LINE('DATE CANNOR BE LIKE THIS');
END;
SELECT * FROM VISIT;
EXECUTE FOR_CITY ('SIDE', SYSDATE);

CREATE OR REPLACE PROCEDURE SERVICE_OPER(OP NUMBER) AS  NO_OPER EXCEPTION;
CURSOR CUR3 IS SELECT IDSERV FROM SERVICE, SERVICE_ONE_OPER, OPERATION WHERE SERVICE_ONE_OPER.OPER=OP AND SERVICE_ONE_OPER.SERV=SERVICE.IDSERV;
B NUMBER(4);
D NUMBER(2);
C NUMBER(4);
BEGIN
SELECT COUNT(IDOPER)INTO D FROM OPERATION WHERE IDOPER=OP;
IF D=0 THEN RAISE NO_OPER;
ELSE
OPEN CUR3;
LOOP FETCH CUR3 INTO B;
EXIT WHEN CUR3% NOTFOUND;
SELECT SUM(NVL(PRICE,0))INTO C FROM SERVICE WHERE IDSERV=B;
END LOOP;
END IF;
CLOSE CUR3;
 DBMS_OUTPUT.PUT_LINE (C);
EXCEPTION WHEN NO_OPER THEN DBMS_OUTPUT.PUT_LINE('NO SUCH OPERATIONS');
END;



CREATE OR REPLACE PROCEDURE Remainings(temp number) AS A number(4); --increase price
CURSOR TEMPCURS IS SELECT IDSERV FROM SERVICE  WHERE IDSERV!=TEMP;
BEGIN 
OPEN TEMPCURS;
LOOP
FETCH TEMPCURS INTO A;
EXIT WHEN TEMPCURS %NOTFOUND;
UPDATE SERVICE SET PRICE =PRICE+500 WHERE IDSERV =A;
END LOOP;
CLOSE TEMPCURS;
COMMIT;
END;

CREATE OR REPLACE TRIGGER SERVICETRIG  -- trigger to call function to increase prices of other services
BEFORE DELETE
ON service
FOR EACH ROW
DECLARE pragma autonomous_transaction;
BEGIN
DELETE FROM SERVICE_ONE_OPER A WHERE A.SERV =:OLD.IDSERV;
REMAININGS(:OLD.IDSERV);
END;

DROP TRIGGER SERVICETRIG;
SELECT * FROM SERVICE;
DELETE FROM SERVICE WHERE IDSERV=102;


 
 
 EXECUTE SERVICE_OPER(87);
 
 CREATE OR REPLACE FUNCTION FUNC (ANIM NUMBER) RETURN  FLOAT AS X FLOAT(4);Y FLOAT(4);Z FLOAT(4);
 BEGIN
 SELECT HEIGTH INTO X FROM ANIMM  WHERE IDMM=ANIM;
 SELECT WEIGTH INTO Y FROM ANIMM WHERE IDMM=ANIM;
 Z:=(X*X)/Y;
 RETURN (Z);
 END; 

 SELECT DISTINCT FUNC(204) FROM ANIMM ;
 SELECT FUNC(12) FROM ANIMM WHERE ANIMM.AN=13; 
EXECUTE DBMS_OUTPUT.PUT_LINE(FUNC(204));
SELECT FUNC(204) FROM dual ; 