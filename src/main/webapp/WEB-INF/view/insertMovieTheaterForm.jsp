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
<h1>영화관 등록 폼</h1>
<form action="./insertMT.do">
	<input type="hidden">
	<div>
		<table>
			<tr>
				<td>영화관 번호</td>
				<td>
					<input type="text" readonly="readonly" value="${theater_no}" name="theater_no">
				</td>
			</tr>
			<tr>
				<td>상영관 이름</td>
				<td>
					<input type="text" name="movie_theater_name">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="완료">
				</td>
			</tr>
		</table>
	</div>
</form>

</body>
</html>