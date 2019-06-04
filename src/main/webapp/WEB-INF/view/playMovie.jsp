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
				alert("성공");
					document.getElementById("movieTheaterButton").innerHTML = "";
					document.getElementById("sessionInfo2").innerHTML = "";
					alert(document.getElementsByName("movie_play_no").length);
					if(theater.movieTheater.length > 1){
						document.getElementById("sessionInfo2").innerHTML += "<input type='hidden' value='"+theater_no+"' name='theater_no'>";
					for(var i = 0; i < theater.movieTheater.length; i++){ // 0 1 < 1 = 0 
							if (i+1 < theater.movieTheater.length && theater.movieTheater[i].movie_theater_name == theater.movieTheater[i+1].movie_theater_name) {
								document.getElementById("movieTheaterButton").innerHTML += "<div>"+theater.movieTheater[i].movie_theater_name+"</div>"
												+ "<input type='button' onclick='seatChk(\""+theater.movieTheater[i].movie_play_no+"\",\""+theater.movieTheater[i].movie_start_time+"\")' value='"+theater.movieTheater[i].movie_start_time+"'>"
												+ "<input type='button' onclick='seatChk(\""+theater.movieTheater[i+1].movie_play_no+"\",\""+theater.movieTheater[i+1].movie_start_time+"\")' value='"+theater.movieTheater[i+1].movie_start_time+"'>";
						}
						}
					}else if (theater.movieTheater.length == 1){
						document.getElementById("sessionInfo2").innerHTML += "<input type='hidden' value='"+theater_no+"' name='theater_no'>";
						document.getElementById("movieTheaterButton").innerHTML += "<div>"+theater.movieTheater[0].movie_theater_name+"</div>"
							+ "<input type='button' onclick='seatChk(\""+theater.movieTheater[0].movie_play_no+"\",\""+theater.movieTheater[0].movie_start_time+"\")' value='"+theater.movieTheater[0].movie_start_time+"'>";
				}
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
	
	
	
</script>
<body>
${movie_no}
${theater_no}
${movie_theater_no}
${movie_play_no}
${rowcol}
<br>
	<!--  -->
	<c:forEach items="${movielist}" var="dto">
		<input type="button" onclick="theater('${dto.movie_no}')" value="${dto.movie_name}">
	</c:forEach>
	<!--  -->
	<br>
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
</body>
</html>