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
<link rel="stylesheet" type="text/css" href="./css/content.css">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript">
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
	
	<div class="content">
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
	</div>
	
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