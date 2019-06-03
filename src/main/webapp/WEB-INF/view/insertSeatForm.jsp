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
	<form action="./insertSeat.do" method="get">
		<table>
			<tr>
				<td>영화관 번호</td>
				<td>세로 좌석</td>
				<td>가로 좌석</td>
				<td>좌석 번호</td>
				<td>좌석 가격</td>
			</tr>
			<tr>
				<td>
					<input type="text" readonly="readonly" value="${movie_theater_no}" name="movie_theater_no">
				</td>
				<td>
					<input type="text" placeholder="ABCDE형식으로 한꺼번에 입력 해주세요" name="inputString">
				</td>
				<td>
					<input type="text" placeholder="입력할 가로 좌석 갯수" name="inputInt">
				</td>
				<td>
					<input type="text" placeholder="ST숫자 로 입력해 주세요" name="seat">
				</td>
				<td>
					<input type="text" placeholder="가격 입력" name="seat_money">
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<input type="submit" value="완료">
				</td>
			</tr>
		</table>
	</form>
	${movie_theater_no}
</body>
</html>