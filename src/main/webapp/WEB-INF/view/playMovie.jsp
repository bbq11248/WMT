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
				$.each(theater,function(key, value){
					var htmlInput = "";
					
					if(key == "theater"){
						htmlInput += "<div><input type='button' onclick='movieTheater('')'></div>";
					}
																		
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
// 				alert(theater.movieTheater.length);
					var movie_time = document.getElementById("movieTheaterButton").innerHTML = "";
					for(var i = 0; i < theater.movieTheater.length; i++){ // 0 1 < 1 = 0 
						for(var j = 1; j < theater.movieTheater.length; j++){ // 1 
							alert(theater.movieTheater[i].movie_theater_name);
							alert(theater.movieTheater[j].movie_theater_name);
							if (theater.movieTheater[i].movie_theater_name === theater.movieTheater[j].movie_theater_name && i < j && i != j) {
								alert(theater.movieTheater[i].movie_theater_name);
								alert(theater.movieTheater[j].movie_theater_name);
								document.getElementById("movieTheaterButton").innerHTML += "<div>"+theater.movieTheater[i].movie_theater_name+"</div>"
												+ "<input type='button' onclick='seatChk("+theater.movieTheater[i].movie_play_no+")' value='"+theater.movieTheater[i].movie_start_time+"'>"
												+ "<input type='button' onclick='seatChk("+theater.movieTheater[j].movie_play_no+")' value='"+theater.movieTheater[j].movie_start_time+"'>";
							}else{
								document.getElementById("movieTheaterButton").innerHTML += "<div>"+theater.movieTheater[i].movie_theater_name+"</div>"
																					+ "<input type='button' value='"+theater.movieTheater[i].movie_start_time+"'>";
						}
							if(theater.movieTheater[i].movie_theater_name != theater.movieTheater[j].movie_theater_name){
								document.getElementById("movieTheaterButton").innerHTML += "<div>"+theater.movieTheater[i].movie_theater_name+"</div>"
																					+ "<input type='button' value='"+theater.movieTheater[i].movie_start_time+"'>";
							}
					}
				}
				alert(theater.movieTheater[0].movie_theater_name);
			},
			error : function() {
				alert("에러");
			}
		});
			
	}
	
	function seatChk(movie_play_no) {
		$.ajax({type:"GET",
			url:"./seatChk.do",
			data : {"movie_play_no" : movie_play_no},
			dataType : "json",
			success: function(theater){
				alert("성공");
				
			},
			error : function() {
				alert("에러");
			}
		});
	}
</script>
<body>
	<!--  -->
	<c:forEach items="${movielist}" var="dto">
		<input type="button" onclick="theater('${dto.movie_no}')" value="${dto.movie_name}">
	</c:forEach>
	<!--  -->
	<br>
	
	
	<div id="theaterButton"></div>
	
	<div id="movieTheaterButton"></div>
	
	<div id="seatButton"></div>
</body>
</html>