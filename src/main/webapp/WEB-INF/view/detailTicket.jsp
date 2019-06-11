<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/content.css">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript">
	function cancel(id, price, ticketing_no, movie_start_time) {
// 		$.ajax({
// 			type:"GET",
// 			url:"./cancel.do",
// 			data : {"id" : id, "price" : price, "ticketing_no" : ticketing_no, "movie_start_time" : movie_start_time},
// 			dataType : "json",
// 			success: function(mvDto) {
// 				alert(movie_start_time);
				var year = movie_start_time.substring(2, 4);
				var month = movie_start_time.substring(4, 6);
				var day = movie_start_time.substring(6, 8);
				var hour = movie_start_time.substring(9, 11);
				var min = movie_start_time.substring(12, 14);
// 				alert("" + year + month + day + hour + min);
				var date = new Date();
				var nowYear = date.getFullYear();
				nowYear = nowYear.toString().substring(2, 4);
// 				alert(nowYear);
				var nowMonth = date.getMonth();
				nowMonth = nowMonth + 1 + "";
				alert(nowMonth);
				alert(nowMonth.length);
				if(nowMonth.length == 1){
					nowMonth = "0" + nowMonth;
				}
				alert(nowMonth)
				var nowDay = date.getDate() + "";
				alert(nowDay.length);
				if (nowDay.length == 1) {
					nowDay = "0" + nowDay;
				}
				alert(nowDay);
				var nowHour = date.getHours() + "";
				var nowMin = date.getMinutes() + "";
				alert(nowHour.length);
				if(nowHour.length == 1){
					nowHour = "0" + nowHour;
				}
				alert(nowHour);
				alert(nowMin.length);
				if(nowMin.length == 1){
					nowMin = "0" + nowMin;
				}
				alert(nowMin);
				var strDate = "" + year + month + day + hour + min;
				var nowDate = "" + nowYear + nowMonth + nowDay + nowHour + nowMin;
// 				alert(strDate+":"+nowDate);
				nowDate = Number(nowDate);
				strDate = Number(strDate);
				alert(strDate-nowDate);
				alert(strDate);
				alert(nowDate);
// 					price = (Number(preci) * 0.8).toFixed(0);
				if(strDate - nowDate < 30 && strDate - nowDate > 0){
					if(confirm("영화 시작 30분 전에 취소하시면 결제 금액의 80% 만 환불 받을수 있습니다. \n 정말 취소 하시겠습니까 ?") == true){
						price = Number(price);
						price *= 0.8;
						location.href = "./cancel.do?id="+id+"&price="+price+"&ticketing_no="+ticketing_no;
					}else{
						return false;
						}
				} else if(strDate - nowDate <= 0){
					if(confirm("지금 취소 하시면 금액을 환불 받으실수 없습니다 그래도 하시겠습니까 ?") == true){
						alert(true);
						price = Number(price);
						price = 0;
						location.href = "./cancel.do?id="+id+"&price="+price+"&ticketing_no="+ticketing_no;
					}else{
						return false;
					}
					}else if (strDate - nowDate >= 30){
						if(confirm("정말 취소 하시겠습니까 ?") == true){
							location.href = "./cancel.do?id="+id+"&price="+price+"&ticketing_no="+ticketing_no;
						}else{
							return false;
						}
					}
				}
// 			}
			
// 		});
				function main() {
					location.href = "./main.do"
				}
	
</script>
<body>
<div class="body">
	<div class="main">
		<div class="main_header">
			<h1><a><img onclick="main()" src="./image/logo.png"></a> WMT</h1>
		</div>
	</div>
	
	<div class="content">
	<table>
		<tr>
			<td>티켓 번호</td>
			<td>상영 영화 번호</td>
			<td>영화관 이름</td>
			<td>상영관 이름</td>
			<td>영화 이름</td>
			<td>영화 시작 시간</td>
			<td>좌석 번호</td>
			<td>금액</td>
			<td>결제 아이디</td>
		</tr>
			<tr>
				<td>${mvDto.ticketing_no}</td>
				<td>${mvDto.movie_play_no}</td>
				<td>${mvDto.theater_name}</td>
				<td>${mvDto.movie_theater_name}</td>
				<td>${mvDto.movie_name}</td>
				<td>${mvDto.movie_start_time}</td>
				<td>${mvDto.seat_no}</td>
				<td>${mvDto.price}</td>
				<td>${mvDto.id}</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="예매 취소" onclick="cancel('${mvDto.id}','${mvDto.price}','${mvDto.ticketing_no}','${mvDto.movie_start_time}')">
				</td>
			</tr>
	</table>
	</div>
			<div class="footer">
			<div>
				<table>
					<tr>
						<td>서울특별시 강남구 역삼동 역삼역 3번 출구 신한은행 건물 4층 C Class</td>
					</tr>
					<tr>
						<td>개발자 : 양진숙, 이정휴</td>
						<td>대표 번호 : 010-1234-1234</td>
					</tr>
					<tr>
						<td>개발자 e-mail: WMT001@movie.com</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>