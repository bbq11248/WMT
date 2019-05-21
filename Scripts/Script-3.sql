--회원가입
INSERT INTO MOVIEMEMBER
(SEQ, ID, PW, NAME, NICKNAME, BIRTHDAY, PHONE, ADDRESS, EMAIL, AUTH, REGDATE)
VALUES(MOVIEMEMBER_SEQ.NEXTVAL, 'JINSOOK', 'C', '양진숙', '규동이엄마', 951230, 01012341234, '수지구', 'WLSTNR7833@NAVER.COM', 'A', SYSDATE);

INSERT INTO MILEAGEMANAGER
(MILEAGE_SEQ, ID, MILEAGE)
VALUES('MG'||MILEAGE_SEQ.NEXTVAL, 'JINSOOK', 0);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--정보 수정 
UPDATE MOVIEMEMBER SET PW = 'A', NICKNAME = '변경', PHONE = 01012345678, ADDRESS = '구로구'
	WHERE ID = 'JINSOOK' AND BIRTHDAY = 951230;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--전체 회원 보기 (관리자)
SELECT SEQ,ID,NAME,NICKNAME,BIRTHDAY,PHONE,ADDRESS,EMAIL,AUTH,REGDATE FROM MOVIEMEMBER;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--중복 체크
SELECT COUNT(ID) ID FROM MOVIEMEMBER WHERE ID = 'A';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--아이디 찾기
SELECT ID FROM MOVIEMEMBER WHERE NAME = '양진숙' AND PHONE = 01012345678;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--비밀번호 찾기
UPDATE MOVIEMEMBER SET PW = '' WHERE ID = 'JINSOOK';
SELECT PW FROM MOVIEMEMBER WHERE ID = 'JINSOOK';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--회원정보 조회
SELECT ID, NAME, NICKNAME, BIRTHDAY, PHONE, ADDRESS, EMAIL, AUTH, REGDATE
	FROM MOVIEMEMBER WHERE ID = 'JINSOOK';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시판------게시판-------게시판--------게시판-------게시판
--게시판------게시판-------게시판--------게시판-------게시판
--게시판------게시판-------게시판--------게시판-------게시판
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--전체글 보기
SELECT SEQ, ID, TITLE, REGDATE FROM BOARD;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--상세조회
SELECT SEQ, ID, TITLE, CONTENT, REGDATE FROM BOARD WHERE SEQ='';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--글입력
INSERT INTO BOARD (SEQ, ID, TITLE, CONTENT, REGDATE)
	VALUES ('BS'||BOARD_SEQ.NEXTVAL, 'JINSOOK', '사이트 방문 감사 안내', '저희 싸이트에 오신걸 환열 합니다. 감사에 의미로 첫 예매는 3000원 할인 !', SYSDATE);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--글수정
UPDATE BOARD SET TITLE = '', CONTENT = ''
	WHERE ID = '' AND SEQ = 'BS1';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--글삭제
DELETE FROM BOARD WHERE SEQ = '';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지--마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지
--마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지--마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지
--마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지--마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지-----마일리지
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 마일리지 충전(CG)
UPDATE MILEAGEMANAGER SET MILEAGE = MILEAGE + 10000 WHERE ID = 'JINSOOK';

INSERT INTO PAYMENT
(PAYMENT_NO, ID, MILEAGE, PRICE, MILEAGE_TIME)
VALUES('CG'||PAYMENT_NO_SEQ.NEXTVAL, 'JINSOOK', (SELECT MILEAGE FROM MILEAGEMANAGER WHERE ID = 'JINSOOK'), 10000, SYSDATE);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--마일리지 조회
SELECT MILEAGE FROM MILEAGEMANAGER WHERE ID = 'JINSOOK';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--결제 내역
SELECT PAYMENT_NO, TICKETING_NO, ID, MILEAGE, PRICE, MILEAGE_TIME FROM PAYMENT
WHERE ID = 'JINSOOK'
ORDER BY MILEAGE_TIME DESC;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매
------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매
------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매------영화 예매
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--영화 조회
SELECT MOVIE_NAME
	FROM MOVIE;
SELECT MOVIE_NAME, MOVIE_FOREMAN, MOVIE_GENRE, MOVIE_OPENDAY, MOVIE_COUNTRY, MOVIE_TIME 
	FROM MOVIE 
		WHERE MOVIE_NO = 'MN2';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	
--영화 예매
--전체 영화 보기
SELECT DISTINCT MOVIE_NO, MOVIE_NAME 영화이름
	FROM MOVIE_PLAY 
		JOIN MOVIE
			USING(MOVIE_NO);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--영화 선택
SELECT MOVIE_NAME FROM MOVIE WHERE MOVIE_NO = 'MN2';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--영화관 선택
SELECT DISTINCT THEATER_NO, THEATER_NAME
	FROM THEATER JOIN MOVIE_PLAY
		USING (THEATER_NO)
			JOIN MOVIE
				USING(MOVIE_NO)
		WHERE MOVIE_NO = 'MN2';

SELECT THEATER_NO, THEATER_NAME
	FROM THEATER JOIN MOVIE_PLAY
		USING (THEATER_NO)
			JOIN MOVIE
				USING(MOVIE_NO)
		WHERE MOVIE_NO = 'MN2' AND THEATER_NO = 'TN1';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--상영관 시간 
SELECT MP.MOVIE_PLAY_NO, TH.THEATER_NAME||MOVIE_THEATER_NAME, MOVIE_START_TIME, MT.MOVIE_THEATER_NO, MP.MOVIE_PLAY_NO
        FROM MOVIE_PLAY MP        
			JOIN MOVIE_THEATER MT
                ON  MP.MOVIE_THEATER_NO = MT.MOVIE_THEATER_NO
                                JOIN THEATER TH
                                        ON MT.THEATER_NO = TH.THEATER_NO
                WHERE MOVIE_NO = 'MN7' AND MP.THEATER_NO = 'TN5';
SELECT MOVIE_PLAY_NO, TH.THEATER_NAME||MOVIE_THEATER_NAME, MOVIE_START_TIME, MT.MOVIE_THEATER_NO, MP.MOVIE_PLAY_NO
	FROM MOVIE_PLAY MP	JOIN MOVIE_THEATER MT
		ON  MP.MOVIE_THEATER_NO = MT.MOVIE_THEATER_NO
				JOIN THEATER TH
					ON MT.THEATER_NO = TH.THEATER_NO
		WHERE MOVIE_NO = 'MN7' AND MP.THEATER_NO = 'TN5' AND MT.MOVIE_PLAY_NO = 'MPN20';

--좌석 선택
SELECT ROWSEAT||COLSEAT 좌석번호, SEAT_MONEY
	FROM SEATMANAGER SM JOIN MOVIE_THEATER MT
		ON SM.MOVIE_THEATER_NO = MT.MOVIE_THEATER_NO
			JOIN MOVIE_PLAY MP
				ON MT.MOVIE_THEATER_NO = MP.MOVIE_THEATER_NO
		WHERE MP.MOVIE_PLAY_NO = 'MPN20';

SELECT SEAT_MONEY FROM SEATMANAGER 
	WHERE ROWSEAT||COLSEAT = 'A1' AND MOVIE_THEATER_NO = 'MTN4';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관
-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관
-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관-------상영관
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 등록
INSERT INTO MOVIE_THEATER
	(MOVIE_THEATER_NO, THEATER_NO, MOVIE_THEATER_NAME)
		VALUES('MTN'||MOVIE_THEATER_NO_SEQ.NEXTVAL, 'TN5', '5관');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--수정
UPDATE MOVIE_THEATER
	SET MOVIE_THEATER_NAME=''
		WHERE MOVIE_THEATER_NO='';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--상영관 전체 보기 보기
SELECT DISTINCT MOVIE_THEATER_NO, THEATER_NAME||MOVIE_THEATER_NAME
	FROM MOVIE_THEATER 
		JOIN THEATER TH
			USING(THEATER_NO)
				ORDER BY THEATER_NAME||MOVIE_THEATER_NAME;

SELECT  DISTINCT THEATER_NAME, MOVIE_THEATER_NAME, SEAT
	FROM MOVIE_THEATER JOIN THEATER
		USING(THEATER_NO)
			JOIN SEATMANAGER
				USING(MOVIE_THEATER_NO)
		WHERE MOVIE_THEATER_NO = 'MTN4';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	
-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석
-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석
-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석-------좌석

--좌석 등록
INSERT INTO SEATMANAGER
(SEAT_NO, MOVIE_THEATER_NO, SEAT_MONEY, ROWSEAT, COLSEAT, SEAT)
VALUES('SN'||SEAT_NO_SEQ.NEXTVAL, 'MTN1', 1000, 'C', '16', 'ST1');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관
-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관
-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관-------영화관
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--등록 
INSERT INTO THEATER
(THEATER_NO, THEATER_NAME, THEATER_LOCAL)
VALUES('TN'||THEATER_NO_SEQ.NEXTVAL, '명동CGV', '서울특별시 중구 명동2가 명동길 14 눈스퀘어 8층');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--수정
UPDATE THEATER
SET THEATER_NAME='', THEATER_LOCAL=''
WHERE THEATER_NO='';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--조회
SELECT THEATER_NO, THEATER_NAME, THEATER_LOCAL FROM THEATER;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화
-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화
-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화-------영화
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--등록
INSERT INTO MOVIE
(MOVIE_NO, MOVIE_NAME, MOVIE_FOREMAN, MOVIE_GENRE, MOVIE_OPENDAY, MOVIE_COUNTRY, MOVIE_TIME)
VALUES('MN'||MOVIE_NO_SEQ.NEXTVAL, '나의특별한형제', '육상호', '드라마, 코미디', '20190510', 'KOR', '01:54');
--수정
UPDATE MOVIE
SET MOVIE_NAME='', MOVIE_FOREMAN='', MOVIE_GENRE='', MOVIE_OPENDAY='', MOVIE_COUNTRY='', MOVIE_TIME=''
WHERE MOVIE_NO='';
--조회
SELECT MOVIE_NO, MOVIE_NAME, MOVIE_FOREMAN, MOVIE_GENRE, MOVIE_OPENDAY, MOVIE_COUNTRY, MOVIE_TIME
FROM MOVIE;





--충전 (CG)
UPDATE MILEAGEMANAGER SET MILEAGE = MILEAGE + 10000 WHERE ID = 'JINSOOK';

INSERT INTO PAYMENT
(PAYMENT_NO, ID, MILEAGE, PRICE, MILEAGE_TIME)
VALUES('CG'||PAYMENT_NO_SEQ.NEXTVAL, 'JINSOOK', (SELECT MILEAGE FROM MILEAGEMANAGER WHERE ID = 'JINSOOK'), 10000, SYSDATE);

--결제(PM)
UPDATE MILEAGEMANAGER SET MILEAGE = MILEAGE - 10000 WHERE ID = 'JINSOOK';

INSERT INTO PAYMENT
(PAYMENT_NO, TICKETING_NO, ID, MILEAGE, PRICE, MILEAGE_TIME)
VALUES('CG'||PAYMENT_NO_SEQ.NEXTVAL, '', 'JINSOOK', (SELECT MILEAGE FROM MILEAGEMANAGER WHERE ID = 'JINSOOK'), 10000, SYSDATE);

--영화관=========================================================================
--등록 
INSERT INTO THEATER
(THEATER_NO, THEATER_NAME, THEATER_LOCAL)
VALUES('TN'||THEATER_NO_SEQ.NEXTVAL, '명동CGV', '서울특별시 중구 명동2가 명동길 14 눈스퀘어 8층');
--수정
UPDATE THEATER
SET THEATER_NAME='', THEATER_LOCAL=''
WHERE THEATER_NO='';
--조회
SELECT * FROM THEATER;
--==================================================================================
--------------------------------------------------------------------------------------------------------------------------
--상영관--------------------------------------------------------------------------
-- 등록
INSERT INTO MOVIE_THEATER
(MOVIE_THEATER_NO, THEATER_NO, MOVIE_THEATER_NAME)
VALUES('MTN'||MOVIE_THEATER_NO_SEQ.NEXTVAL, 'TN5', '5관');

--수정
UPDATE MOVIE_THEATER
SET MOVIE_THEATER_NO='', MOVIE_THEATER_NAME=''
WHERE THEATER_NO='';

--상세
SELECT THEATER_NAME 영화관이름, MOVIE_THEATER_NAME 상여관이름, ROWSEAT||COLSEAT
	FROM MOVIE_THEATER JOIN THEATER 
		USING(THEATER_NO) 
			JOIN SEATMANAGER
				USING(MOVIE_THEATER_NO)
		WHERE MOVIE_THEATER_NO = 'MTN1';

--리스트
SELECT MOVIE_THEATER_NO, THEATER_NAME, MOVIE_THEATER_NAME
	FROM MOVIE_THEATER JOIN THEATER 
		USING(THEATER_NO);
SELECT * FROM MOVIE_THEATER ORDER BY THEATER_NO;
---------------------------------------------------------------------------
---------------------------------------------------------------------------
--좌석 등록
INSERT INTO SEATMANAGER
(SEAT_NO, MOVIE_THEATER_NO, SEAT_MONEY, ROWSEAT, COLSEAT)
VALUES('SN'||SEAT_NO_SEQ.NEXTVAL, 'MTN1', 1000, 'C', '16');
---------------------------------------------------------------------------
--영화=======================================================================================
--등록
INSERT INTO MOVIE
(MOVIE_NO, MOVIE_NAME, MOVIE_FOREMAN, MOVIE_GENRE, MOVIE_OPENDAY, MOVIE_COUNTRY, MOVIE_TIME)
VALUES('MN'||MOVIE_NO_SEQ.NEXTVAL, '나의특별한형제', '육상호', '드라마, 코미디', '20190510', 'KOR', '01:54');
--수정
UPDATE MOVIE
SET MOVIE_NAME='', MOVIE_FOREMAN='', MOVIE_GENRE='', MOVIE_OPENDAY='', MOVIE_COUNTRY='', MOVIE_TIME=''
WHERE MOVIE_NO='';
--조회
SELECT * FROM MOVIE;
--==========================================================================================
--------------------------------------------------------------------------------------------------------------------------------------
--상영중인 영화
INSERT INTO MOVIE_PLAY
(MOVIE_PLAY_NO, MOVIE_NO, THEATER_NO, MOVIE_THEATER_NO, MOVIE_PLAY_TIME, TIMES)
VALUES('MPN'||MOVIE_PLAY_NO_SEQ.NEXTVAL, 'MN7', 'TN1', 'MTN4', '190515 19:21' '1회');

SELECT * 
	FROM MOVIE_PLAY
		WHERE MOVIE_THEATER_NO = 'MTN4';
--수정
UPDATE MOVIE.MOVIE_PLAY
SET MOVIE_NO='', THEATER_NO='', MOVIE_THEATER_NO='', MOVIE_PLAY_TIME='', TIMES=''
WHERE MOVIE_PLAY_NO='';

--삭제
DELETE FROM MOVIE.MOVIE_PLAY
WHERE MOVIE_PLAY_NO='MPN18';

------------------------------------------------------------------------------------------------------------------------------------------
--1) 영화 전체 보여주기
SELECT MOVIE_NO, MOVIE_NAME 영화이름, MOVIE_OPENDAY 개봉일,
       MOVIE_GENRE 장르, MOVIE_TIME 영화시간
	FROM MOVIE;

--1-1)
--1) 영화관 영화선택
SELECT MOVIE_NO, MOVIE_NAME 영화이름, MOVIE_OPENDAY 개봉일,
       MOVIE_GENRE 장르, MOVIE_TIME 영화시작
	FROM MOVIE
		WHERE MOVIE_NO = 'MN2';

	
--2) 영화관 선택
SELECT MOVIE_PLAY_NO, MOVIE_THEATER_NO, THEATER_NAME, THEATER_LOCAL, MOVIE_THEATER_NAME
	FROM MOVIE_PLAY JOIN THEATER
		USING(THEATER_NO)
			JOIN MOVIE_THEATER
				USING(MOVIE_THEATER_NO)
		WHERE MOVIE_NO ='MN2';
--3)


-- 3) 영화>영화관>상관 -> 좌석 선택
--> Check box -> [A1,A2] -> Arrays.toString() -> [A1,A2] -> [] 제거 -> A1,A2
SELECT ROWSEAT||COLSEAT, SEAT_MONEY
 	FROM SEATMANAGER 
		WHERE MOVIE_THEATER_NO = 'MTN1';
	
INSERT INTO TICKETING(TICKETING_NO, MOVIE_PLAY_NO, ID, SEAT_NO)
	VALUES('TKN'||TICKETING_NO_SEQ.NEXTVAL,'MPN0001', 'JOUNGHYU','A1,A2');



--예매,결제
INSERT INTO TICKETING
(TICKETING_NO, MOVIE_PLAY_NO, ID, SEAT_NO, TICKETING_TIME)
VALUES('TN'||TICKETING_NO_SEQ.NEXTVAL, 'MPN1', 'JINSOOK', (SELECT ROWSEAT||COLSEAT FROM SEATMANAGER WHERE ROWSEAT||COLSEAT = 'A1')||(SELECT ROWSEAT||COLSEAT FROM SEATMANAGER WHERE ROWSEAT||COLSEAT = 'A2'), SYSDATE);

UPDATE MILEAGEMANAGER SET MILEAGE = MILEAGE - 2000 WHERE ID = 'JINSOOK';

INSERT INTO PAYMENT
(PAYMENT_NO, ID, MILEAGE, PRICE, MILEAGE_TIME)
VALUES('PM'||PAYMENT_NO_SEQ.NEXTVAL, 'JINSOOK', (SELECT MILEAGE FROM MILEAGEMANAGER WHERE ID = 'JINSOOK'), 2000, SYSDATE);

--티켓조회
SELECT TICKETING_NO, MOVIE_PLAY_NO, THEATER_NAME, MOVIE_THEATER_NAME, MOVIE_NAME
	FROM TICKETING JOIN MOVIE_PLAY
		USING(MOVIE_PLAY_NO)
			JOIN THEATER
				USING(THEATER_NO)
					JOIN MOVIE_THEATER
						USING(MOVIE_THEATER_NO)
							JOIN MOVIE
								USING(MOVIE_NO)
		WHERE ID = 'JINSOOK'
			ORDER BY TICKETING_TIME;
		
SELECT TICKETING_NO, MOVIE_PLAY_NO, THEATER_NAME, MOVIE_THEATER_NAME, MOVIE_NAME, MOVIE_PLAY_TIME, SEAT_NO
	FROM TICKETING JOIN MOVIE_PLAY
		USING(MOVIE_PLAY_NO)
			JOIN THEATER
				USING(THEATER_NO)
					JOIN MOVIE_THEATER
						USING(MOVIE_THEATER_NO)
							JOIN MOVIE
								USING(MOVIE_NO)
		WHERE ID = 'JINSOOK' AND TICKETING_NO = 'TN1'

--마일리지 조회
SELECT * FROM MILEAGEMANAGER WHERE ID = 'JINSOOK';
--결제내역 조회
SELECT * FROM PAYMENT WHERE ID = 'JINSOOK' ORDER BY MILEAGE_TIME DESC;












UPDATE MILEAGEMANAGER SET MILEAGE = MILEAGE + 2000 WHERE ID = 'JOUNGHYU';

INSERT INTO PAYMENT
(PAYMENT_NO, ID, MILEAGE, PRICE, MILEAGE_TIME)
VALUES('TC'||PAYMENT_NO_SEQ.NEXTVAL, 'JINSOOK', (SELECT MILEAGE FROM MILEAGEMANAGER WHERE ID = 'JINSOOK'), 2000, SYSDATE);

UPDATE PAYMENT SET TICKETING_NO = NULL WHERE TICKETING_NO = 'TN1';
DELETE FROM TICKETING WHERE TICKETING_NO = 'TN1';





SELECT SEAT_NO, MOVIE_THEATER_NO, SEAT_MONEY, ROWSEAT||COLSEAT, SEAT FROM SEATMANAGER WHERE SEAT = 'ST1';

UPDATE SEATMANAGER SET ROWSEAT = '', COLSEAT = '', SEAT_MONEY = 0 WHERE SEAT_NO = '';

SELECT THEATER_NO, THEATER_NAME, THEATER_LOCAL, MOVIE_THEATER_NO, MOVIE_THEATER_NAME
	FROM THEATER JOIN MOVIE_THEATER
		USING(THEATER_NO)
		WHERE THEATER_NO = 'TN1';



































--예매========================================================================================


--결제
UPDATE MILEAGEMANAGER SET MILEAGE = MILEAGE - 6000 WHERE ID = 'JINSOOK';

INSERT INTO PAYMENT
(PAYMENT_NO, TICKETING_NO, ID, MILEAGE, PRICE, MILEAGE_TIME)
VALUES('CG'||PAYMENT_NO_SEQ.NEXTVAL,'TKN1', 'JINSOOK', (SELECT MILEAGE FROM MILEAGEMANAGER WHERE ID = 'JINSOOK'), 6000, SYSDATE);
--조회
SELECT * FROM PAYMENT WHERE ID = 'JINSOOK' ORDER BY MILEAGE_TIME DESC;
SELECT * FROM MILEAGEMANAGER WHERE ID = 'JINSOOK';
--취소
UPDATE MILEAGEMANAGER SET MILEAGE = MILEAGE + 6000 WHERE ID = 'JINSOOK';

INSERT INTO PAYMENT
(PAYMENT_NO, TICKETING_NO, ID, MILEAGE, PRICE, MILEAGE_TIME)
VALUES('PC'||PAYMENT_NO_SEQ.NEXTVAL,'TKN1', 'JINSOOK', (SELECT MILEAGE FROM MILEAGEMANAGER WHERE ID = 'JINSOOK'), 6000, SYSDATE);

UPDATE PAYMENT SET TICKETING_NO = NULL WHERE TICKETING_NO = 'TKN1' AND PAYMENT_NO = 'PC4';
DELETE FROM TICKETING WHERE TICKETING_NO = 'TKN1';
--===================================================================================























