<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/content.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<title>Insert title here</title>
</head>
<body>
<div class="body">
	<div class="main">
		<div class="main_header">
			<h1><a><img onclick="main()" src="./image/logo.png"></a> WMT</h1>
		</div>
	</div>
<div class="content">
	<form action="./updateMP.do">
		<table>
			<tr>
				<td>상영중인 영화 번호</td>
				<td>영화 이름</td>
				<td>영화관 이름</td>
				<td>상영관 이름</td>
				<td>영화 시작 시간</td>
				<td>회차</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="${movie_play_no}" readonly="readonly" name="movie_play_no">
				</td>
				<td>
					<input type="text" value="${movie_name}" name="movie_name">
				</td>                                           
				<td>                                            
					<input type="text" value="${theater_name}" name="theater_name">
				</td>                                           
				<td>                                            
					<input type="text" value="${movie_theater_name}" name="movie_theater_name">
				</td>                                           
				<td>                                            
					<input type="text" value="${movie_start_time}" name="movie_start_time">
				</td>                                           
				<td>                                            
					<input type="text" value="${times}" name="times">
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<input type="submit" value="완료">
				</td>
			</tr>
		</table>
	</form>
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