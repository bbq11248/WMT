<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				var year = movie_start_time.substring(0, 2);
				var month = movie_start_time.substring(2, 4);
				var day = movie_start_time.substring(4, 6);
				var hour = movie_start_time.substring(7, 9);
				var min = movie_start_time.substring(10, 12);
// 				alert("" + year + month + day + hour + min);
				var date = new Date();
				var nowYear = date.getFullYear();
				nowYear = nowYear.toString().substring(2, 4);
// 				alert(nowYear);
				var nowMonth = date.getMonth();
				nowMonth = nowMonth + 1 + "";
				if(nowMonth.length == 1){
					nowMonth = "0" + nowMonth;
				}
				var nowDay = date.getDate() + "";
				var nowHour = date.getHours();
				var nowMin = date.getMinutes();
				var strDate = "" + year + month + day + hour + min;
				var nowDate = "" + nowYear + nowMonth + nowDay + nowHour + nowMin;
// 				alert(strDate+":"+nowDate);
				nowDate = Number(nowDate);
				strDate = Number(strDate);
				alert(strDate-nowDate);
// 					price = (Number(preci) * 0.8).toFixed(0);
				if(strDate - nowDate < 30 && strDate - nowDate > 0){
					price = Number(price);
					price *= 0.8;
					location.href = "./cancel.do?id="+id+"&price="+price+"&ticketing_no="+ticketing_no;
				} else if(strDate - nowDate <= 0){
					if(confirm("지금 취소 하시면 금액을 환불 받으실수 없습니다 그래도 하시겠습니까 ?") == true){
						alert(true);
						price = Number(price);
						price = 0;
						location.href = "./cancel.do?id="+id+"&price="+price+"&ticketing_no="+ticketing_no;
					}else{
						alert(false);
					}
				}
// 			}
			
// 		});
	}
</script>
<body>
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
</body>
</html>