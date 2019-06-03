<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Test page</title>
</head>
<body>
<script type="text/javascript">
function mileageChk() {
	location.href="./mileageChk.do?id=wlstnr7833"
}
function mileageCG() {
	location.href="./mileageForm.do"
}

function paymentList() {
	location.href="./payList.do"
}

function ticketChk() {
	location.href="./ticketList.do"
}
function ticketDitail() {
	location.href="./detailTicket.do"
}

function playMovieList() {
	location.href="./playMovie.do"
}



function theaterManager() {
	location.href="./theater_manager.do"
}

function movieTheaterManager() {
	location.href="./movie_theater_manager.do"
}

function movieManager() {
	location.href="./movieManager.do"
}

function moviePlayManager() {
	location.href="./moviePlayManager.do"
}

function boardList() {
	location.href = "./board.do";
}

function name() {
	location.href = "./oneBoard.do?seq=BS24";
}

function name() {
	location.href = "./deleteBoard.do?seq=BS24";
}



</script>
</body>
<a href="./loginForm.do">로그인</a>
<a href="jin.jsp">진숙 테스트</a>
<br>
<input type="button" value="마일리지 충전" onclick="mileageCG()">
<!-- <input type="button" value="마일리지 확인" onclick="mileageChk()"> -->
<input type="button" value="결제 내역 확인" onclick="paymentList()">


<input type="button" value="예매 내역 보기" onclick="ticketChk()">
<!-- <input type="button" value="예매 내역 상세 보기" onclick="ticketDitail()"> -->
<input type="button" value="예매" onclick="ticketing()">
<!-- <input type="button" value="예매 취소" onclick="ticketCancel()"> -->

<input type="button" value="상영중인 영화 보기" onclick="playMovieList()">

<input type="button" value="영화관 관리" onclick="theaterManager()">
<input type="button" value="상영관 관리" onclick="movieTheaterManager()">
<input type="button" value="영화 관리" onclick="movieManager()">
<input type="button" value="상영중인 영화 관리" onclick="moviePlayManager()">

<input type="button" value="전체글조회" onclick="boardList()">

<a href="./oneBoard.do?seq=BS24">상세 글조회</a>

<a href="./insertBoard.do?id=wlstnr7833&title=안녕하세요?&content=사이트에 오셔서 감사합니다.">글입력</a>

<a href="./updateBoard.do?seq=BS24&id=wlstnr7833&pw=1234&title=수정합니다.&content=게시글수정완료.">글수정</a>

<a href="./deleteBoard.do?seq=BS24">글삭제</a>

<a href="./beforSeat.do?">예매 좌석 확인</a>
</html>






