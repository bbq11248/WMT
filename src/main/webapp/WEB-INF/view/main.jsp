<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</script>
</head>
<body>
<input type="button" value="마일리지 충전" onclick="mileageCG()">
<input type="button" value="마일리지 확인" onclick="mileageChk()">
<input type="button" value="결제 내역 확인" onclick="paymentList()">


<input type="button" value="예매 내역 보기" onclick="ticketChk()">
<input type="button" value="예매 내역 상세 보기" onclick="ticketDitail()">
<input type="button" value="예매" onclick="ticketing()">
<input type="button" value="예매 취소" onclick="ticketCancel()">


<input type="button" value="상영중인 영화 보기" onclick="playMovieList()">
<input type="button" value="영화관 보기" onclick="playTheaterList()">
<input type="button" value="상영관 보기" onclick="playMovieTheaterList()">
<input type="button" value="좌석 보기" onclick="playSeatList()">
<input type="button" value="좌석 가격 보기" onclick="playSeatPrice()">

</body>
</html>