<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"></style>
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

</script>
</head>
<body>
	${milage}
	<div class="main">
		<div class="main_header">
			<h1><a><img onclick="main()" src="./image/logo.png"></a> WMT</h1>
		</div>
		<div class="main_info">
		</div>
	</div>
	<div>
		<h2>WMT</h2>
		<input type="button" value="마일리지 충전" onclick="mileageCG()">
		<input type="button" value="마일리지 확인" onclick="mileageChk()">
		<input type="button" value="결제 내역 확인" onclick="paymentList()">
	</div>


<input type="button" value="예매 내역 보기" onclick="ticketChk()">
<input type="button" value="예매 내역 상세 보기" onclick="ticketDitail()">
<input type="button" value="예매" onclick="ticketing()">
<input type="button" value="예매 취소" onclick="ticketCancel()">


<input type="button" value="상영중인 영화 보기" onclick="playMovieList()">


<input type="button" value="영화관 관리" onclick="theaterManager()">
<input type="button" value="상영관 관리" onclick="movieTheaterManager()">
<input type="button" value="영화 관리" onclick="movieManager()">
<input type="button" value="상영중이 영화 관리" onclick="moviePlayManager()">

<input type="button" value="전체글조회" onclick="boardList()">

<a href="./beforSeat.do?">예매 좌석 확인</a>
</body>
</html>