<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">

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
	function main() {
		location.href = "./main.do"
	}
</script>
<body>
<div class="body">
	<div class="main">
		<div class="main_header">
			<h1><a><img onclick="main()" src="./image/logo.png"></a> WMT</h1>
		</div>
	</div>
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
	
			<div class="footer">
			<div>
				<table>
					<tr>
						<td>서울특별시 강남구 역삼동 역삼역 3번 출구 신한은행 건물 4층 C Class</td>
					</tr>
					<tr>
						<td>개발자 : 양진숙, 이정휴</td>
						<td>대표 번호 : 010-1234-1234</td>
					</tr>
					<tr>
						<td>개발자 e-mail: WMT001@movie.com</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>