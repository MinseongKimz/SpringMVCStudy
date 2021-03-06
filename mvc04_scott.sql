SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 실습 테이블 생성 (지역: REGION)
CREATE TABLE REGION
( REGIONID   NUMBER
, REGIONNAME VARCHAR2(30)
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION이(가) 생성되었습니다.

--○ 지역 시퀀스 생성
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ이(가) 생성되었습니다.

--○ 데이터 입력(지역 데이터 입력)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES (REGIONSEQ.NEXTVAL, '서울');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES (REGIONSEQ.NEXTVAL, '경기');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES (REGIONSEQ.NEXTVAL, '인천');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES (REGIONSEQ.NEXTVAL, '대전');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES (REGIONSEQ.NEXTVAL, '광주');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES (REGIONSEQ.NEXTVAL, '대구');
--==>> 1 행 이(가) 삽입되었습니다. * 6

--지역 리스트 확인
SELECT REGIONID , REGIONNAME FROM REGION
;
/*
1	서울
2	경기
3	인천
4	대전
5	광주
6	대구
*/

--커밋
COMMIT;
--==>>커밋 완료.

--○ 실습 테이블 생성(직위 : POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER
, POSITIONNAME  VARCHAR2(30)
, MINBASICPAY   NUMBER
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION이(가) 생성되었습니다.


--○ 시퀀스 생성 (직위 : POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;

-- 데이터 입력
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '사원', 1000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '대리', 2000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '과장', 3000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '부장', 4000000);
--==>> 1 행 이(가) 삽입되었습니다.*4

--○ 직위 리스트 확인
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
/*
1	사원	1000000
2	대리	2000000
3	과장	3000000
4	부장	4000000
*/

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- 실습 테이블 생성 (부서: DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID NUMBER
, DEPARTMENTNAME VARCHAR2(30)
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--Table DEPARTMENT이(가) 생성되었습니다.


-- 시퀀스 생성 DEPARTMENTSEQ
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ이(가) 생성되었습니다.


--○ 데이터 입력
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '개발부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '기획부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '영업부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '자재부');
--==>> 1 행 이(가) 삽입되었습니다.

-- 부서 리스트 확인
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
/*
1	개발부
2	기획부
3	영업부
4	자재부
*/

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- 실습 테이블 생성 (직원: EMPLOYEE)
-- 사원번호, 사원명, 주민번호, 생년월일, 양음력, 전화번호, 부서, 직위, 지역, 기본급, 수당
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER              --  사원 번호 PK
, NAME          VARCHAR2(30)        --  사원 명 
, SSN           VARCHAR2(30)        --  주민번호 → 암호화 적용
, BIRTHDAY      DATE                -- 생년월일
, LUNAR         NUMBER(1) DEFAULT 0 -- 양음력 CK 양 0 음 1
, TELEPHONE     VARCHAR2(40)        -- 전화번호
, DEPARTMENTID  NUMBER              -- 부서아이디 FK
, POSITIONID    NUMBER              -- 직위 ID FK
, REGIONID      NUMBER              -- 지역 ID FK
, BASICPAY      NUMBER              -- 기본급
, EXTRAPAY      NUMBER              -- 수당
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID) 
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE이(가) 생성되었습니다.

-- 시퀀스 생성(직원 EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES (EMPLOYEESEQ.NEXTVAL, '김상기', CRYPTPACK.ENCRYPT('9610041234567', '9610041234567')
      , TO_DATE('1996-10-04', 'YYYY-MM-DD'), 0, '010-5693-4223', 1, 2, 1
      , 2500000, 1500000);
--==>> 1 행 이(가) 삽입되었습니다.

-- 세션 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

SELECT *
FROM EMPLOYEE;
--==>> 1	김상기	???X?-w??	1996-10-04	0	010-5693-4223	1	2	1	2500000	1500000

COMMIT;
--==>> 커밋 완료.

DESC EMPLOYEE;
/*
이름           널?       유형           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
SSN                   VARCHAR2(30) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER       
*/

-- 직원 데이터 조회 커리문 구성

SELECT E.EMPLOYEEID
    , E.NAME
    , E.SSN
    , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
    , E.LUNAR
    , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
    , E.TELEPHONE
    , E.DEPARTMENTID
    , (SELECT DEPARTMENTNAME
       FROM DEPARTMENT
       WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
    , E.POSITIONID
    , (SELECT POSITIONNAME
       FROM POSITION
       WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
    , E.REGIONID
    , (SELECT REGIONNAME
       FROM REGION
       WHERE REGIONID=E.REGIONID) AS REGIONNAME
    , E.BASICPAY
    , E.EXTRAPAY
    , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;

--==>> 1	김상기	???X?-w??	1996-10-04	0	양력	010-5693-4223	1	개발부	2	대리	1	서울	2500000	1500000	4000000

-- 뷰 생성
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
    , E.NAME
    , E.SSN
    , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
    , E.LUNAR
    , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
    , E.TELEPHONE
    , E.DEPARTMENTID
    , (SELECT DEPARTMENTNAME
       FROM DEPARTMENT
       WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
    , E.POSITIONID
    , (SELECT POSITIONNAME
       FROM POSITION
       WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
    , E.REGIONID
    , (SELECT REGIONNAME
       FROM REGION
       WHERE REGIONID=E.REGIONID) AS REGIONNAME
    , E.BASICPAY
    , E.EXTRAPAY
    , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEW이(가) 생성되었습니다.

--○ 지역 데이터 조회 쿼리문 구성 (지역 데이터 삭제 가능 여부 확인 포함)

SELECT R.REGIONID, R.REGIONNAME
    ,(SELECT COUNT(*)
      FROM EMPLOYEE
      WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
/*
1	서울	1  → 삭제 불가
2	경기	0
3	인천	0
4	대전	0
5	광주	0
6	대구	0
*/
--> 『서울』 의 지역 데이터는 삭제가 불가능한 상황이며
--  『경기』, 『인천』, 『대전』, 『광주』, 『대구』의 지역 데이터는 
--  삭제가 가능함을 판별할 수 있는 쿼리문
-- 뷰 생성
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT R.REGIONID, R.REGIONNAME
    ,(SELECT COUNT(*)
      FROM EMPLOYEE
      WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
--==>> View REGIONVIEW이(가) 생성되었습니다.

--○ 직위 데이터 테이블 조회(직우이 데이터 삭제 가능여부 확인 포함)
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID=P.POSITIONID) AS DELCHECK
FROM POSITION P;
/*
1	사원	1000000	0
2	대리	2000000	1
3	과장	3000000	0
4	부장	4000000	0
*/

-- 뷰 생성
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID=P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW이(가) 생성되었습니다.


--○ 부서 데이터 테이블 조회(부서 데이터 삭제 가능여부 확인 포함)
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME 
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID=D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
/*
1	개발부	1
2	기획부	0
3	영업부	0
4	자재부	0
*/
-- 뷰 생성
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME 
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID=D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW이(가) 생성되었습니다.


--○ 직위별 최소 기본급 조회 쿼리문 구성
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;
-- 한줄 구성
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000

--------------------------------------------------------------------------------

--○ 로그인, 로그아웃 과정 추가

-- ID 와 PW 컬럼 데이터를 담고 있는 테이블이 별도로 존재하지 않는 상황이다,.
-- 이와 관련하여 EMPLOYEEID(사원 아이디), SSN(주민번호) 뒷 7자리 숫자를
-- 이용할 수 있도록 구성한다.

--※ 기존 테이블  구조 변경
--① 
-- EMPLOYEE(직원 테이블)의 SSN(주민번호) 컬럼을 분리한다.
-- SSN → SSN1(주민번호 앞자리), SSN2(주민번호 뒷자리, 암호화 적용)


--②
--EMPLOYEE(직원 테이블)의 GRADE(등급) 컬럼 추가
-- GRADE → 0 관리자, 1 일반 사원

-- 컬럼 분할 SSN → SSN1 SSN2

-- 컬럼 추가
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE이(가) 변경되었습니다.

SELECT *
FROM EMPLOYEE;


UPDATE EMPLOYEE
SET SSN1 = SUBSTR( CRYPTPACK.DECRYPT(SSN,'9610041234567'), 1, 6)
  , SSN2 = CRYPTPACK.ENCRYPT(SUBSTR( CRYPTPACK.DECRYPT(SSN,'9610041234567'),7,7)
                           , SUBSTR( CRYPTPACK.DECRYPT(SSN,'9610041234567'),7,7));
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM EMPLOYEE;
--==>>1	김상기	???X?-w??	1996-10-04	0	010-5693-4223	1	2	1	2500000	1500000	961004	=o???


COMMIT;


-- 기존 주민번호 컬럼(SSN) 제거
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE이(가) 변경되었습니다.

DESC EMPLOYEE;
/*
이름           널?       유형           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER       
SSN1                  CHAR(6)      
SSN2                  VARCHAR2(50) 
*/


-- 컬럼 추가 → GRADE → 기본값 1 을 일반 사원으로 구성
--                              0 은 관리자로 구성
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE이(가) 변경되었습니다.
--==>> 1	김상기	1996-10-04	0	010-5693-4223	1	2	1	2500000	1500000	961004	=o???	1

-- 김상기 대리 관리자로 임명
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;


SELECT *
FROM EMPLOYEE;
--==>> 1	김상기	1996-10-04	0	010-5693-4223	1	2	1	2500000	1500000	961004	=o???	0

COMMIT;
--==>> 커밋 완료

--※ 테이블의 구조를 변경했기 때문에
--   이를 기반으로 생성한 뷰 수정

CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
    , E.NAME AS NAME
    , E.SSN1 AS SSN
    , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
    , E.LUNAR AS LUNAR
    , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
    , E.TELEPHONE AS TELEPHONE
    , E.DEPARTMENTID AS DEPARTMENTID
    , (SELECT DEPARTMENTNAME
       FROM DEPARTMENT
       WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
    , E.POSITIONID AS POSITIONID
    , (SELECT POSITIONNAME
       FROM POSITION
       WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
    , E.REGIONID AS REGIONID
    , (SELECT REGIONNAME
       FROM REGION
       WHERE REGIONID=E.REGIONID) AS REGIONNAME
    , E.BASICPAY AS BASICPAY
    , E.EXTRAPAY AS EXTRAPAY
    , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
    , E.GRADE AS GRADE
FROM EMPLOYEE E;


SELECT *
FROM EMPLOYEEVIEW;
/*
1	김상기	961004	1996-10-04	0	양력	010-5693-4223	1	개발부	2	대리	1	서울	2500000	1500000	4000000	0
*/

DESC EMPLOYEEVIEW;
/*
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEEID     NOT NULL NUMBER       
NAME                    VARCHAR2(30) 
SSN                     CHAR(6)      
BIRTHDAY                VARCHAR2(10) 
LUNAR                   NUMBER(1)    
LUNARNAME               VARCHAR2(6)  
TELEPHONE               VARCHAR2(40) 
DEPARTMENTID            NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
POSITIONID              NUMBER       
POSITIONNAME            VARCHAR2(30) 
REGIONID                NUMBER       
REGIONNAME              VARCHAR2(30) 
BASICPAY                NUMBER       
EXTRAPAY                NUMBER       
PAY                     NUMBER       
GRADE                   NUMBER(1) 
*/


--○ 직원 데이터 입력 쿼리문 구성 (수정된 내용)
INSERT INTO EMPLOYEE (EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '이연주', '950816', CRYPTPACK.ENCRYPT('2234567', '2234567')
     , TO_DATE('1995-08-16', 'YYYY-MM-DD'), 0, '010-4423-0463', 1, 1, 1
     , 1500000, 1500000);                    

INSERT INTO EMPLOYEE (EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) VALUES(EMPLOYEESEQ.NEXTVAL, '이연주', '950816', CRYPTPACK.ENCRYPT('2234567', '2234567'), TO_DATE('1995-08-16', 'YYYY-MM-DD'), 0, '010-4423-0463', 1, 1, 1, 1500000, 1500000)
;
--==>> 2	이연주	950816	1995-08-16	0	양력	010-4423-0463	1	개발부	1	사원	1	서울	1500000	1500000	3000000	1

COMMIT;


--○ 일반 사원 로그인 쿼리문 구성(ID → EMPLOYEEID, PW▶ SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID='사용자 입력값'
  AND SSN2=(
            SELECT SSN2
            FROM EMPLOYEE
            WHERE EMPLOYEEID='사용자 입력값'
            );

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2=(SELECT SSN2
            FROM EMPLOYEE
            WHERE EMPLOYEEID=2);
--==>> 이연주


SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('2234562', '2234562');
-- 조회결과 X 로그인 실패



SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('2234567', '2234567');
--==>> 이연주 
--> 일반 사원 로그인 쿼리문 한 줄 구성

SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=2 AND (SELECT SSN2 FROM EMPLOYEE WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('2234567', '2234567')
;
--> 치환
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID='ID문자열' AND (SELECT SSN2 FROM EMPLOYEE WHERE EMPLOYEEID='ID문자열') = CRYPTPACK.ENCRYPT('PW문자열', 'PW문자열')
;
---> 위쿼리에서 AND로 SSN2 를 암호화된 입력값과 비교하는데 굳이 중복해서
--   SSN2 를 또 찾을 필요가 없다. 
-->  재치환
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID='ID문자열' AND SSN2 = CRYPTPACK.ENCRYPT('PW문자열', 'PW문자열')
;



--○ 관리자 사원 로그인 쿼리문 구성(ID → EMPLOYEEID, PW▶ SSN2, GRADE=0)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567', '2234567')
  AND GRADE=0;
--==>> 조회 결과 없음... (이연주 사원 관리자 권한 없음.)

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE=0;
--==>> 김상기 관리자 권한 있기때문에 로그인 성공!
--> 한줄 구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567') AND GRADE=0
;
--> 치환 (CHECK~!!)
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID='ID문자열' AND SSN2 = CRYPTPACK.ENCRYPT('PW문자열', 'PW문자열') AND GRADE=0
;


--○ 직원 데이터 삭제 쿼리문 구성
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> 한줄 구성
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;
--==>> 1 행 이(가) 삭제되었습니다.

--롤백
ROLLBACK;
-->> 롤백 완료


--○ 직원 데이터 수정 쿼리문
UPDATE EMPLOYEE
SET NAME='김상기'
   , BIRTHDAY=TO_DATE('1996-10-04','YYYY-MM-DD')
   , LUNAR=0
   , TELEPHONE='010-5693-4223'
   , DEPARTMENTID=1
   , POSITIONID=2
   , REGIONID=1
   , BASICPAY=2500000
   , EXTRAPAY=1500000
   , SSN1='961004'
   , SSN2=CRYPTPACK.ENCRYPT('1234567','1234567')
   , GRADE=0
WHERE EMPLOYEEID=1;
--> 한줄 구성
UPDATE EMPLOYEE SET NAME='김상기', BIRTHDAY=TO_DATE('1996-10-04','YYYY-MM-DD'), LUNAR=0, TELEPHONE='010-5693-4223', DEPARTMENTID=1, POSITIONID=1, REGIONID=1 , BASICPAY=2500000 , EXTRAPAY=1500000, SSN1='961004', SSN2=CRYPTPACK.ENCRYPT('1234567','1234567'), GRADE=0 WHERE EMPLOYEEID=1
;


--커밋
COMMIT;
--==>> 커밋 완료.

--○ 부서 리스트 조회 쿼리문 구성
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK
FROM DEPARTMENTVIEW
ORDER BY DEPARTMENTID; 
-- 한줄 구성
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;
/*
1	개발부	2
2	기획부	0
3	영업부	0
4	자재부	0
*/

-- 부서 데이터 입력 쿼리문 구성
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '총무부')
;

COMMIT;


--부서 데이터 삭제 쿼리문
DELETE
FROM DEPARTMENT
WHERE DEPARTMENTID=1;
-- 한줄 구성]
DELETE FROM DEPARTMENT WHERE DEPARTMENTID=3
;

--롤백
ROLLBACK;

-- 부서 데이터 수정 쿼리문
UPDATE DEPARTMENT
SET DEPARTMENTNAME='자원부'
WHERE DEPARTMENTID=2;
-- 한줄 구성
UPDATE DEPARTMENT SET DEPARTMENTNAME='자원부' WHERE DEPARTMENTID=2
;
--==>> 1 행 이(가) 업데이트되었습니다.

-- 롤백
ROLLBACK;
--==>> 롤백 완료


-- 지역 리스트 조회 쿼리문
SELECT REGIONID, REGIONNAME, DELCHECK
FROM REGIONVIEW
ORDER BY REGIONID;

SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW ORDER BY REGIONID
;
/*
1	서울	2
2	경기	0
3	인천	0
4	대전	0
5	광주	0
6	대구	0
*/


--○ 지역 데이터 등록 쿼리문
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '강원')
;
--==>> 1 행 이(가) 삽입되었습니다.

-- 커밋
COMMIT;
--==>> 커밋 완료.

--○ 지역 데이터 삭제 쿼리문
DELETE FROM REGION WHERE REGIONID = 2
;
--==>> 1 행 이(가) 삭제되었습니다.

-- 롤 백
ROLLBACK;
--==>> 롤백 완료.

--○ 지역 데이터 수정 쿼리문
UPDATE REGION
SET REGIONNAME='제주'
WHERE REGIONID=4;
-- 한줄 구성
UPDATE REGION SET REGIONNAME='제주' WHERE REGIONID=4
;
--==>> 1 행 이(가) 업데이트되었습니다.

COMMIT;
--==>> 커밋 완료.

-- 직위 리스트 조회 쿼리문 구성
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK
FROM POSITIONVIEW
ORDER BY POSITIONID;
-- 한줄 구성
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;
/*
1	사원	1000000	2
2	대리	2000000	0
3	과장	3000000	0
4	부장	4000000	0
*/

-- 직위 데이터 입력 쿼리
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '상무', 5000000)
;
--==>> 1 행 이(가) 삽입되었습니다.

-- 커밋
COMMIT;
--==>> 커밋 완료.

--직위 데이터 삭제 쿼리
DELETE 
FROM POSITION
WHERE POSITIONID=2
;
-- 한줄 구성
DELETE FROM POSITION WHERE POSITIONID=2
;
--==>> 1 행 이(가) 삭제되었습니다.

-- 롤백
ROLLBACK;
--==>> 롤백 완료.

-- 직위 데이터 수정 쿼리문
UPDATE POSITION
SET POSITIONNAME= '주임'
  , MINBASICPAY=3000000
WHERE POSITIONID=2
;
--한줄 구성
UPDATE POSITION SET POSITIONNAME= '주임', MINBASICPAY=3000000 WHERE POSITIONID=2
;
--==>> 1 행 이(가) 업데이트되었습니다.

-- 롤백
ROLLBACK;
--==>> 롤백 완료.


--직원 검색 쿼리문 구성

SELECT EMPLOYEEID, NAME, SSN1
     , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY
FROM EMPLOYEE
WHERE EMPLOYEEID=2
;

SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=1
;
--==> 1	김상기	961004	1996-10-04	0	010-5693-4223	1	2	1	2500000	1500000



SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY FROM EMPLOYEEVIEW
;




desc employeeview;



























































































































