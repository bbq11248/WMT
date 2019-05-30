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
	<form action="./updateM.do">
		<input type="hidden" value="${movie_no}" name="movie_no">
		<table>
			<tr>
				<td>영화 이름</td>
				<td>영화 감독</td>
				<td>영화 장르</td>
				<td>개봉일</td>
				<td>국가</td>
				<td>총 영화 시간</td>
			</tr>
				<tr>
					<td>
						<input type="text" value="${movie_name}" name="movie_name">
					</td>
					<td>
						<input type="text" value="${movie_foreman}" name="movie_foreman">
					</td>
					<td>
						<input type="text" value="${movie_genre}" name="movie_genre">
					</td>
					<td>
						<input type="text" value="${movie_openday}" name="movie_openday">
					</td>
					<td>
						<input type="text" value="${movie_country}" name="movie_country">
					</td>
					<td>
						<input type="text" value="${movie_time}" name="movie_time">
					</td>
				</tr>
			<tr>
				<td colspan="6">
					<input type="submit" value="완료">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>