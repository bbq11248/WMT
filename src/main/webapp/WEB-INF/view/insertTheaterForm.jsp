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
<form action="./insertT.do">
	<input type="hidden">
	<div>
		<table>
			<tr>
				<td>영화관 이름</td>
				<td>
					<input type="text" name="theater_name">
				</td>
			</tr>
			<tr>
				<td>영화관 위치</td>
				<td>
					<input type="text" name="theater_local">
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