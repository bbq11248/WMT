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
	<form action="./updateMT.do">
		<input type="hidden" value="${theater_no}" name="theater_no">
		<table>
			<tr>
				<td>영화관 이름</td>
				<td>상영관 번호</td>
				<td>상영관 이름</td>
			</tr>
				<tr>
					<td>
						<input type="text"  value="${theater_name}" readonly="readonly">
					</td>
					<td>
						<input type="text" readonly="readonly" value="${movie_theater_no}" name="movie_theater_no">
					</td>
					<td>
						<input type="text"  value="${movie_theater_name}" name="movie_theater_name">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="왼료">
					</td>
				</tr>
		</table>
	</form>



</body>
</html>