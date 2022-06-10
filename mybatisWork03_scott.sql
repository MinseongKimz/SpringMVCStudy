/*
   - 테이블 : TBL_STUDENT
     · 테이블 구조 : SID	NUMBER		-- pk
                    , NAME	VARCHAR2(30)
                    , TEL	VARCAHR2(40)

   - 테이블 : TBL_GRADE
     · 테이블 구조 : SID	NUMBER		-- pk/fk
                    , SUB1	NUMBER(3)
                    , SUB2	NUMBER(3)
                    , SUB3	NUMBER(3)



   - 뷰 : STUDENTVIEW
     · 뷰 구조 : SID, NAME, TEL, SUB
	                          ---  참조 레코드 수

   - 뷰 : GRADEVIEW
     · 뷰 구조 : SID, NAME, SUB1, SUB2, SUB3, TOT, AVG, CH
	                          	       ------------- 총점 평균 등급 (합, 불합, 과락)
*/

SELECT USER 
FROM DUAL;
--==>> SCOTT


CREATE TABLE TBL_STUDENT
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT STUDENT_SID_PK PRIMARY KEY (SID)
);

--==>> Table TBL_STUDENT이(가) 생성되었습니다.

-- 샘플 데이터 입력

INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES (1, '이호석', '010-1111-1111');

INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES (2, '최선하', '010-2222-2222');
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES (3, '임소민', '010-3333-3333');
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES (4, '홍은혜', '010-4444-4444');


--○ 실습 테이블 생성
CREATE TABLE TBL_GRADE
( SID NUMBER
, SUB1 NUMBER(3)
, SUB2 NUMBER(3)
, SUB3 NUMBER(3)
, CONSTRAINT GRADE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT GRADE_SID_FK FOREIGN KEY(SID)
        REFERENCES TBL_STUDENT(SID)
, CONSTRAINT GRADE_SUB1_CK CHECK(SUB1 BETWEEN 0 AND 100)
, CONSTRAINT GRADE_SUB2_CK CHECK(SUB2 BETWEEN 0 AND 100)
, CONSTRAINT GRADE_SUB3_CK CHECK(SUB3 BETWEEN 0 AND 100)
);
--==>> Table TBL_GRADE이(가) 생성되었습니다.

-- 샘플 데이터 입력
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(1, 90, 80, 70);
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(2, 92, 82, 72);
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(3, 70, 60, 50);
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(4, 74, 64, 54);



-- 확인
SELECT * FROM TBL_STUDENT;

SELECT * FROM TBL_GRADE;

-- 커밋
COMMIT;


CREATE OR REPLACE VIEW STUDENTVIEW
AS
SELECT S.SID, S.NAME, S.TEL ,(SELECT COUNT(*) FROM TBL_GRADE WHERE SID=S.SID) AS SUB
FROM TBL_STUDENT S
ORDER BY S.SID;
--==>> View STUDENTVIEW이(가) 생성되었습니다.



CREATE OR REPLACE VIEW GRADEVIEW
AS
SELECT G.SID, S.NAME, SUB1, SUB2, SUB3
     , (SUB1+SUB2+SUB3) AS TOT
     , (SUB1+SUB2+SUB3)/3 AS AVG
     , CASE WHEN ((SUB1+SUB2+SUB3)/3) < 60 THEN '불합격'
            WHEN (SUB1<=40 OR SUB2<=40 OR SUB3<=40) THEN '과락'
       ELSE '합격'
       END AS CH
FROM TBL_GRADE G JOIN TBL_STUDENT S
ON G.SID = S.SID
ORDER BY G.SID;
--==>> View GRADEVIEW이(가) 생성되었습니다.



SELECT *
FROM STUDENTVIEW;

SELECT *
FROM GRADEVIEW;


-- 인원수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_STUDENT











