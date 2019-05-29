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
<script type="text/javascript">
	function seatUpdateForm(seat_no, rowseat, colseat, seat_money, seat) {
		location.href = "./seatUpdateForm.do?seat_no="+seat_no+"&rowseat="+rowseat+"&colseat="+colseat+"&seat_money="+seat_money+"&seat="+seat;
	}
	
	function MTList(movie_theater_no) {
		location.href = "./detailMT.do?movie_theater_no="+movie_theater_no;
	}
</script>
<body>
	<input type="button" value="뒤로 가기 " onclick="MTList('${lists[0].movie_theater_no}')">
	<table>
		<tr>
			<td>좌석 번호</td>
			<td>세로열</td>
			<td>가로열</td>
			<td>좌석 가격</td>
		</tr>
		<c:forEach items="${lists}" var="lists">
			<tr>
				<td>
					<input type="button" value="${lists.seat_no}" onclick="seatUpdateForm('${lists.seat_no}','${lists.rowseat}','${lists.colseat}','${lists.seat_money}','${lists.seat}')">
				</td>
				<td>${lists.rowseat}</td>
				<td>${lists.colseat}</td>
				<td>${lists.seat_money}</td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>