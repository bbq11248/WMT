<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Test page</title>
</head>
<body>
</body>
<a href="jin.jsp">진숙 테스트</a>
<br>
<br>
<br>
<a href="./mileageChk.do?id=JINSOOK">mileage확인</a>
<a href="./mileage.do?id=JINSOOK=&price=10000">마일리지 충전</a>
<a href="./payList.do?id=JINSOOK">결재 내역 확인</a>
<br>
<br>
<br>
<a href="./ticketList.do?id=JINSOOK">예매내역 보기</a>
<a href="./detailTicket.do">예매내역 상세 보기</a>
<<<<<<< HEAD
<a href="./ticketing.do?id=JINSOOK&price=1000">예매</a>
<a href="./cancel.do?id=JINSOOK&price=1000&ticketing_no=TN21">예매 취소</a>

=======
<a href="./ticketing.do?id=JINSOOK=&price=1000">예매</a>
<a href="./cancel.do?id=JINSOOK=&price=1000=&ticketing_no=TN42">예매 취소</a>
<br>
<br>
<br>
<a href="./playMovie.do">상영중인 영화 보기</a>
<a href="./theaterChk.do?movie_no=MN7">영화관 보기</a>
<a href="./movieTheaterChk.do?movie_no=MN7=&theater_no=TN5">상영관 보기</a>
<a href="./seatChk.do?movie_play_no=MPN20">좌석 보기</a>
<a href="./seatMoneyChk.do">좌석 가격</a>
<br>
<br>
<br>
<a href="./insertMT.do">상영관 등록</a>
<a href="./updateMT.do">상영관 수정</a>
<a href="./listMT.do">상영관 보기</a>
<a href="./detailMT.do?movie_theater_no=MTN41">상영관 상세 보기</a>
<br>
<br>
<br>
<a href="insertSeat.do?movie_theater_no=MTN41=&seat_money=1000=&rowseat=A=&colseat=1=&seat=ST2">좌석 등록</a>
<a href="selSeat.do?seat=ST2">좌석 보기</a>
<a href="updateSeat.do?seat_no=SN61=&rowseat=A=&colseat=1=&seat_money=2000">좌석 수정</a>
<br>
<br>
<br>
<a href="./insertT.do">영화관 등록</a>
<a href="./updateT.do">영화관 수정</a>
<a href="./selT.do">영화관 보기</a>
<a href="./selOneT.do?theater_no=TN21">영화관 상세 보기</a>
<br>
<br>
<br>
<a href="./insertM.do?movie_name=어린의뢰인&movie_foreman=장규성&movie_genre=드라마&movie_openday=20190522&movie_country=KOR&movie_time=01:54">영화 등록</a>
<a href="./updateM.do?movie_name=어린의뢰인&movie_foreman=장규성&movie_genre=드라마,스릴러&movie_openday=20190522&movie_country=KOR&movie_time=01:54&movie_no=MN21">영화 수정</a>
<a href="./listM.do">영화 조회</a>
<a href="./oneM.do?movie_no=MN21">영화 상세 조회</a>
>>>>>>> branch 'master' of https://github.com/bbq11248/WMT.git
</html>






