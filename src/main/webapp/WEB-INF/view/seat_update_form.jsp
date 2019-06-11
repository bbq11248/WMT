<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/content.css">
<title>Insert title here</title>
</head>
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