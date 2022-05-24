select user from dual;
--==>> SCOTT

DESC TBL_MEMBERLIST;
/*
이름    널?       유형            
----- -------- ------------- 
ID    NOT NULL VARCHAR2(30)  
PW    NOT NULL VARCHAR2(50)  
NAME  NOT NULL VARCHAR2(50)  
TEL   NOT NULL VARCHAR2(50)  
EMAIL          VARCHAR2(100) 
*/
DROP TABLE TBL_MEMBERLIST;
--==>> Table TBL_MEMBERLIST이(가) 삭제되었습니다.


--○ 실습 테이블 생성(TBL_MEBERLIST)
CREATE TABLE TBL_MEMBERLIST
( MID       NUMBER
, NAME      VARCHAR2(30)
, TELEPHONE VARCHAR2(50)
, CONSTRAINT MEMBERLIST_MID_PK PRIMARY KEY(MID)
);
--==>> Table TBL_MEMBERLIST이(가) 생성되었습니다.

--○ 시퀸스 생성
CREATE SEQUENCE MEMBERLISTSEQ
NOCACHE;
---==>> Sequence MEMBERLISTSEQ이(가) 생성되었습니다.

--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) VALUES (MEMBERLISTSEQ.NEXTVAL, '정은정', '010-1111-1111')
;
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) VALUES (MEMBERLISTSEQ.NEXTVAL, '박현지', '010-2222-2222')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_MEMBERLIST;
/*
1	정은정	010-1111-1111
2	박현지	010-2222-2222
*/

--○ 커밋
COMMIT;
-- 커밋 완료.

--○ 리스트 조회 쿼리문 구성
SELECT MID, NAME, TELEPHONE
FROM TBL_MEMBERLIST
ORDER BY MID;
-- 한줄 구성
SELECT MID, NAME, TELEPHONE FROM TBL_MEMBERLIST ORDER BY MID
;
/*
1	정은정	010-1111-1111
2	박현지	010-2222-2222
*/

--○ 인원수 조회 쿼리 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST
;
--==>> 2





















