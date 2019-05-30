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
				<td>${mvDto.id}</td>
			</tr>
	</table>
</body>
</html>