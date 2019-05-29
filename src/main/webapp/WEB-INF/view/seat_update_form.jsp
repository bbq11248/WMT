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
	<form action="./updateSeat.do">
		<input type="hidden" value="${seat}" name="seat">
		<table>
			<tr>
				<td>좌석 번호</td>
				<td>세로 번호</td>
				<td>가로 번호</td>
				<td>좌석 가격</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="${seat_no}" readonly="readonly" name="seat_no">
				</td>
				<td>
					<input type="text" value="${rowseat}" name="rowseat">
				</td>
				<td>
					<input type="text" value="${colseat}" name="colseat">
				</td>
				<td>
					<input type="text" value="${seat_money}" name="seat_money">
					
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="완료">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>