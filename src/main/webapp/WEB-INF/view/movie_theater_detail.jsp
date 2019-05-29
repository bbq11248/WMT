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
	function update_movie_theater(movie_theater_no, movie_theater_name, theater_name, theater_no) {
		location.href="./updateMTForm.do?movie_theater_no="+movie_theater_no+"&movie_theater_name="+movie_theater_name+"&theater_name="+theater_name+"&theater_no="+theater_no;
	}
	function seatsel(seat) {
		location.href = "./selSeat.do?seat="+seat;
	}
	function insertSeat(movie_theater_no) {
		location.href = "./insertSeatForm.do?movie_theater_no="+movie_theater_no;
	}
</script>
<body>
	<input type="button" value="좌석 등록" onclick="insertSeat('${movie_theater_no}')">
	<table border="1">
		<tr>
			<td>영화관 이름</td>
			<td>상영관 번호</td>
			<td>상영관 이름</td>
			<td>좌석 코드</td>
		</tr>
		<c:forEach items="${lists}" var="lists">
			<tr>
				<td>
					${lists.theater_name}
				</td>
				<td>
					${lists.movie_theater_no}
				</td>
				<td>
					${lists.movie_theater_name}
				</td>
				<td>
					<input type="button" value="${lists.seat}" onclick="seatsel('${lists.seat}')">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" value="수정" onclick="update_movie_theater('${lists.movie_theater_no}','${lists.movie_theater_name}','${lists.theater_name}','${lists.theater_no}')">
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>