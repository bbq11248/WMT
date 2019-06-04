<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/content.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript">
	function theater(movie_no) {
		$.ajax({
			type:"GET",
			url:"./theaterChk.do",
			data : {"movie_no" : movie_no},
			dataType : "json",
			success: function(theater){
				document.getElementById("theaterButton").innerHTML = "";
				document.getElementById("sessionInfo1").innerHTML = "";
				$.each(theater,function(key, value){
					var htmlInput = "";
// 					if(key == "theater"){
// 						htmlInput += "<div><input type='button' onclick='movieTheater('')'></div>";
// 					}
						document.getElementById("sessionInfo1").innerHTML += "<input type='hidden' value='"+movie_no+"' name='movie_no'>";
					for(var i = 0; i < value.length ;i++){
						document.getElementById("theaterButton").innerHTML += "<input type='button' value='"+value[i].theater_name+"' onclick='movieTheater(\""+value[i].theater_no+"\",\""+value[i].movie_no+"\")'> ";
						
// 						onclick='movieTheater('value.theater_name')
					}
				});
			},
			error: function() {
				alert("에러");
			}	
		});
	}
	function movieTheater(theater_no,movie_no) {
		//var theater = theater_no;
		//var movie = movie_no;
		$.ajax({
			type:"GET",
			url:"./movieTheaterChk.do",
			data : {"movie_no" : movie_no , "theater_no":theater_no },
			dataType : "json",
			success: function(theater){
					document.getElementById("movieTheaterButton").innerHTML = "";
					document.getElementById("sessionInfo2").innerHTML = "";
					var date = new Date();
					var nowYear = date.getFullYear();
					var nowMonth = date.getMonth();
					var nowDay = date.getDate() + "";
					var nowHour = date.getHours() + "";
					var nowMin = date.getMinutes() + "";
					nowMonth = nowMonth + 1 + "";
					if(nowMonth.length == 1){
						nowMonth = "0" + nowMonth;
					}
					if (nowDay.length == 1) {
						nowDay = "0" + nowDay;
					}
					if(nowHour.length == 1){
						nowHour = "0" + nowHour;
					}
					if(nowMin.length == 1){
						nowMin = "0" + nowMin;
					}
					var nowDays = nowYear + nowMonth + nowDay + nowHour + nowMin;
					var nowTime = Number(nowDays);
							document.getElementById("sessionInfo2").innerHTML += "<input type='hidden' value='"+theater_no+"' name='theater_no'>";
							var htmlView = document.getElementById("movieTheaterButton");
							var obj = "";
						for(var i = 0; i < theater.movieTheater.length; i++){ // 0 1 < 1 = 0
							var movieTime = theater.movieTheater[i].movie_start_time;
							var year = movieTime.substring(0, 4);
							var month = movieTime.substring(4, 6);
							var day = movieTime.substring(6, 8);
							var hour = movieTime.substring(9, 11);
							var min = movieTime.substring(12, 14);
							var movieStart = "" + year + month + day + hour + min;
							var intMovieTime = Number(movieStart);
							var intDays = Number(nowDays);
							alert(intMovieTime - intDays);
							if(intMovieTime - intDays >= -10){
								obj += "<div><span id=\"movie_theater_name"+i+"\">"+theater.movieTheater[i].movie_theater_name+"</span>"
									+ "<input type='button' onclick='seatChk(\""+theater.movieTheater[i].movie_play_no+"\",\""+theater.movieTheater[i].movie_start_time+"\")' value='"+theater.movieTheater[i].movie_start_time+"'></div>";
							}
							}
						htmlView.innerHTML = obj;
						
			},
			error : function() {
				alert("에러");
			}
		});
			
	}
	
	function seatChk(movie_play_no, movie_start_time) {
		$.ajax({type:"GET",
			url:"./seatChk.do",
			data : {"movie_play_no" : movie_play_no, "movie_start_time" : movie_start_time},
			dataType : "json",
			success: function(theater){
				alert("성공");
				document.getElementById("seatList").innerHTML = "";
				document.getElementById("sessionInfo3").innerHTML = "";
				alert(theater.seat.length+"----");
				document.getElementById("sessionInfo3").innerHTML += "<input id='movie_play_no' type='hidden' value='"+movie_play_no+"' name='movie_play_no'>";
				theater.seat.length
					for(var i = 0; i < theater.seat.length; i++){
						if(theater.beforSeat.indexOf(theater.seat[i].rowcol+",") == -1){
// 							alert(theater.beforSeat[j].seat_no);
							document.getElementById("seatList").innerHTML += "<input type='button' onclick='seatprice(\""+theater.seat[i].rowcol+"\",\""+theater.seat[i].movie_theater_no+"\",\""+movie_play_no+"\")' value='"+theater.seat[i].rowcol+"'>"
						}
				}
				
			},
			error : function() {
				alert("에러");
			}
		});
	}
	
	function seatprice(rowcol, movie_theater_no) {
		$.ajax({type:"GET",
			url:"./seatMoneyChk.do",
			data : {"rowcol" : rowcol, "movie_theater_no" : movie_theater_no},
			dataType : "json",
			success: function(theater){
				alert("성공");
				document.getElementById("seatMoney").innerHTML = "";
				document.getElementById("sessionInfo4").innerHTML = "";
				document.getElementById("sessionInfo5").innerHTML = "";
				var movie_play_no = document.getElementById("movie_play_no").value;
				alert(theater.seatMoney);
					document.getElementById("sessionInfo4").innerHTML += "<input type='hidden' value='"+movie_theater_no+"' name='movie_theater_no'>";
					document.getElementById("sessionInfo5").innerHTML += "<input type='hidden' value='"+rowcol+"' name='rowcol'>";
					document.getElementById("seatMoney").innerHTML += theater.seatMoney + "원"
																	+ "<input type='button'onclick='ticketpay(\""+rowcol+"\",\""+movie_play_no+"\",\""+theater.seatMoney+"\")' value='예매'>";
			},
			error : function() {
				alert("에러");
			}
		});
		
	}
	function ticketpay(rowcol, movie_play_no, price) {
// 		var movie_theater_no = document.getElementsByName("movie_theater_no").value;
// 		var rowcol = document.getElementsByName("rowcol").value;
		location.href="./ticketing.do?movie_play_no="+movie_play_no+"&id=wlstnr7833&rowcol="+rowcol+"&price="+price;
	}
	
	function main() {
		location.href = "./main.do"
	}
	
</script>
<body>
	<div class="body">
		<div class="main">
			<div class="main_header">
				<h1>
					<a><img onclick="main()" src="./image/logo.png"></a> WMT
				</h1>
			</div>
			<div class="main_info"></div>
		</div>
		<c:forEach items="${movielist}" var="dto">
			<input type="button" onclick="theater('${dto.movie_no}')"
				value="${dto.movie_name}">
		</c:forEach>
		<div class="content">
		<div id="sessionInfo1"></div>

		<div id="sessionInfo2"></div>

		<div id="sessionInfo3"></div>

		<div id="sessionInfo4"></div>

		<div id="sessionInfo5"></div>

		<div id="theaterButton"></div>

		<div id="movieTheaterButton"></div>

		<div id="seatButton"></div>

		<div id="seatList"></div>

		<div id="seatMoney"></div>
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