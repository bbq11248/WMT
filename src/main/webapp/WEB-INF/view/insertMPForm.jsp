<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./insertMP.do">
		<table>
			<tr>
				<td>영화 제목</td>
				<td>
					<input type="text" name="movie_name">
				</td>
			</tr>
			<tr>
				<td>영화관 이름</td>
				<td>
					<input type="text" name="theater_name">
				</td>
			</tr>
			<tr>
				<td>상영관 이름</td>
				<td>
					<input type="text" name="movie_theater_name">
				</td>
			</tr>
			<tr>
				<td>영화 시작 시간</td>
				<td>
					<input type="text" name="movie_start_time">
				</td>
			</tr>
			<tr>
				<td>회차</td>
				<td>
					<input type="text" name="times">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="완료">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>