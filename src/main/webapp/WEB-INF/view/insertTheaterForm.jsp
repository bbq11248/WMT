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