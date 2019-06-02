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
</body>
</html>