-- a 회원 테이블 만들기
CREATE TABLE MOVIEMEMBER(
   SEQ NUMBER NOT NULL,
   ID VARCHAR2(10) NOT NULL, -- PK
   PW VARCHAR2(100) NOT NULL,
   NAME VARCHAR2(10) NOT NULL,
   NICKNAME VARCHAR2(50) NOT NULL,
   BIRTHDAY NUMBER(6) NOT NULL,
   PHONE NUMBER(11) NOT NULL,
   ADDRESS VARCHAR2(50) NOT NULL,
   EMAIL VARCHAR2(50) NOT NULL,
   AUTH VARCHAR2 (10),
   REGDATE DATE NOT NULL,
   THEATER_NO VARCHAR2 (7)
  );
 
CREATE TABLE TICKETING( -- 영화예매
   TICKETING_NO VARCHAR2(7) NOT NULL, -- 티켓번호 PK
   MOVIE_PLAY_NO VARCHAR2(7) NOT NULL, -- 상영영화번호
   ID VARCHAR2(10) NOT NULL,
   SEAT_NO VARCHAR2(100) NOT NULL -- 좌석번호
);

CREATE TABLE MOVIE_PLAY( -- 상영중인 영화
   MOVIE_PLAY_NO VARCHAR2(7) NOT NULL, --상영영화번호PK 
   MOVIE_NO VARCHAR2(7), -- 영화 번호FK
   THEATER_NO VARCHAR2(7), -- 영화관 번호FK
   MOVIE_THEATER_NO VARCHAR2(7),
   MOVIE_PLAY_TIME VARCHAR2(30),
   TIMES VARCHAR2(3)
   );

CREATE TABLE THEATER( -- 영화관
   THEATER_NO VARCHAR2(7) NOT NULL, -- 영화관 번호 PK
   THEATER_NAME VARCHAR2(20),-- 영화관 이름
   THEATER_LOCAL VARCHAR2(100) -- 영화관 위치
   );

CREATE TABLE MOVIE_THEATER( -- 상영관
	MOVIE_THEATER_NO VARCHAR2(7) NOT NULL, -- 상영관 번호PK
	THEATER_NO VARCHAR2(7), -- 영화관 번호FK
	MOVIE_THEATER_NAME VARCHAR2(20) -- 상영관 이름
	);
  
CREATE TABLE MOVIE( -- 영화
   MOVIE_NO VARCHAR2(7) NOT NULL, -- 영화 번호PK
   MOVIE_NAME VARCHAR2(100), -- 영화 이름
   MOVIE_FOREMAN VARCHAR2(100), -- 영화 감독
   MOVIE_GENRE VARCHAR2(100), -- 영화 장르
   MOVIE_OPENDAY VARCHAR2(10), -- 개봉일
   MOVIE_COUNTRY VARCHAR2(50), -- 개봉국가
   MOVIE_TIME VARCHAR2(30) -- 영화 시간
   );

CREATE TABLE BOARD( -- 게시판
   SEQ NUMBER, -- 게시글 번호
   ID VARCHAR2(10),--PK FK
   TITLE VARCHAR2(100), -- 제목
   CONTENT VARCHAR2(1000), -- 내용
   REGDATE DATE -- 등록일
);

CREATE TABLE MILEAGEMANAGER( -- 마일리지 관리....
	MILEAGE_SEQ VARCHAR2(7),--PK
	ID VARCHAR2(10),--FK
	MILEAGE NUMBER
);

CREATE TABLE PAYMENT( -- 결제
   PAYMENT_NO VARCHAR2(7) NOT NULL, -- 결제번호 PK
   TICKETING_NO VARCHAR2(7), -- 티켓번호FK
   ID VARCHAR2(10), --FK
   MILEAGE NUMBER, -- 마일리지 사용양
   PRICE NUMBER,-- 가격
   MILEAGE_TIME DATE -- 결제 시간
);



CREATE TABLE SEATMANAGER( -- 좌석 관리
	SEAT_NO VARCHAR2(7),
	MOVIE_THEATER_NO VARCHAR2(7), -- 상영관번호FK
	SEAT_MONEY NUMBER, -- 가격
	ROWSEAT VARCHAR2(10), -- 세로 좌석 번호
	COLSEAT VARCHAR2(10) -- 가로 좌석 번호
);


CREATE TABLE MOVIEPOSTER ( --파일 업로드
	FILESEQ VARCHAR2(20) NOT NULL,
	PREMOVIE VARCHAR2(100),
	BESTMOVIE VARCHAR2(100)
);



CREATE SEQUENCE MOVIEMEMBER_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE BOARD_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE MOVIE_NO_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE TICKETING_NO_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE THEATER_NO_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE MOVIE_PLAY_NO_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE MOVIE_THEATER_NO_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE PAYMENT_NO_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE MILEAGE_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SEAT_NO_SEQ START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE MOVIEPOSTER_SEQ START WITH 1 INCREMENT BY 1;


-- ==============================================================================================================================

ALTER TABLE MOVIEMEMBER ADD CONSTRAINT MOVIEMEMBER_PK PRIMARY KEY (ID);

ALTER TABLE TICKETING ADD CONSTRAINT TICKETING_PK PRIMARY KEY(TICKETING_NO);

ALTER TABLE THEATER ADD CONSTRAINT THEATER_PK PRIMARY KEY (THEATER_NO);

ALTER TABLE MOVIE_THEATER ADD CONSTRAINT MOVIE_THEATER_PK PRIMARY KEY (MOVIE_THEATER_NO);

ALTER TABLE MOVIE_PLAY ADD CONSTRAINT MOVIE_PLAY_PK PRIMARY KEY (MOVIE_PLAY_NO);

ALTER TABLE MOVIE ADD CONSTRAINT MOVIE_PK PRIMARY KEY (MOVIE_NO);

ALTER TABLE BOARD ADD CONSTRAINT BOARD_PK PRIMARY KEY (SEQ);

ALTER TABLE MILEAGEMANAGER ADD CONSTRAINT MILEAGEMANAGER_PK PRIMARY KEY (MILEAGE_SEQ);

ALTER TABLE PAYMENT ADD CONSTRAINT PAYMENT_PK PRIMARY KEY (PAYMENT_NO);

ALTER TABLE SEATMANAGER ADD CONSTRAINT SEATMANAGER_PK PRIMARY KEY (SEAT_NO);

ALTER TABLE MOVIEPOSTER ADD CONSTRAINT MOVIEPOSTER_PK PRIMARY KEY (FILESEQ);


-- ==============================================================================================================================
--영화관 즐겨 찾기
ALTER TABLE MOVIEMEMBER ADD CONSTRAINT MOVIEMEMBER_FK FOREIGN KEY (THEATER_NO) REFERENCES THEATER (THEATER_NO);
-- 예매FK
ALTER TABLE TICKETING ADD CONSTRAINT TICKETING_FK FOREIGN KEY (ID) REFERENCES MOVIEMEMBER (ID);
ALTER TABLE TICKETING ADD CONSTRAINT TICKETING1_FK FOREIGN KEY (MOVIE_PLAY_NO) REFERENCES MOVIE_PLAY (MOVIE_PLAY_NO);

-- 상영관
ALTER TABLE MOVIE_THEATER ADD CONSTRAINT MOVIE_THEATER_FK FOREIGN KEY (THEATER_NO) REFERENCES THEATER (THEATER_NO);

--상영중인 영화
ALTER TABLE MOVIE_PLAY ADD CONSTRAINT MOVIE_PLAY_FK FOREIGN KEY (THEATER_NO) REFERENCES THEATER (THEATER_NO);
ALTER TABLE MOVIE_PLAY ADD CONSTRAINT MOVIE_PLAY1_FK FOREIGN KEY (MOVIE_THEATER_NO) REFERENCES MOVIE_THEATER (MOVIE_THEATER_NO);
ALTER TABLE MOVIE_PLAY ADD CONSTRAINT MOVIE_PLAY2_FK FOREIGN KEY (MOVIE_NO) REFERENCES MOVIE (MOVIE_NO);

-- 좌석 관리 SEATMANAGER MOVIE_THEATER_NO PRICE_NO
ALTER TABLE SEATMANAGER ADD CONSTRAINT SEATMANAGER_FK FOREIGN KEY (MOVIE_THEATER_NO) REFERENCES MOVIE_THEATER (MOVIE_THEATER_NO);

-- 게시판 BOARD ID
ALTER TABLE BOARD ADD CONSTRAINT BOARD_FK FOREIGN KEY (ID) REFERENCES MOVIEMEMBER (ID);

-- 마일리지 관리 MILEAGEMANAGER ID
ALTER TABLE MILEAGEMANAGER ADD CONSTRAINT MILEAGEMANAGER_FK FOREIGN KEY (ID) REFERENCES MOVIEMEMBER (ID);

-- 결제 PAYMENT TICKETING_NO MILEAGE
ALTER TABLE PAYMENT ADD CONSTRAINT PAYMENT_FK FOREIGN KEY (TICKETING_NO) REFERENCES TICKETING (TICKETING_NO) ON DELETE CASCADE;
ALTER TABLE PAYMENT ADD CONSTRAINT PAYMENT_FK2 FOREIGN KEY (ID) REFERENCES MOVIEMEMBER (ID) ON DELETE CASCADE;

ALTER TABLE PAYMENT DROP CONSTRAINT  PAYMENT_FK;



DROP TABLE MOVIEMEMBER;
DROP TABLE TICKETING;
DROP TABLE MOVIE;
DROP TABLE MOVIE_THEATER;
DROP TABLE THEATER;
DROP TABLE MOVIE_PLAY;
DROP TABLE BOARD;
DROP TABLE MILEAGEMANAGER;
DROP TABLE PAYMENT;
DROP TABLE SEATMANAGER;
DROP TABLE MOVIEPOSTER;


DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE MILEAGE_SEQ;
DROP SEQUENCE MOVIEMEMBER_SEQ;
DROP SEQUENCE MOVIE_NO_SEQ;
DROP SEQUENCE MOVIE_THEATER_NO_SEQ;
DROP SEQUENCE PAYMENT_NO_SEQ;
DROP SEQUENCE SEAT_NO_SEQ;
DROP SEQUENCE THEATER_NO_SEQ;
DROP SEQUENCE TICKETING_NO_SEQ;
DROP SEQUENCE SEAT_NO_SEQ;


SELECT TH.THEATER_NAME||MOVIE_THEATER_NAME AS MOVIE_THEATER_NAME, MOVIE_START_TIME, MT.MOVIE_THEATER_NO, MOVIE_PLAY_NO
			FROM MOVIE_PLAY MP        
				JOIN MOVIE_THEATER MT
					ON  MP.MOVIE_THEATER_NO = MT.MOVIE_THEATER_NO
						JOIN THEATER TH
							ON MT.THEATER_NO = TH.THEATER_NO
				WHERE MOVIE_NO = 'MN7' AND MP.THEATER_NO = 'TN5'
