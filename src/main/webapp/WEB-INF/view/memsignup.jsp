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
<title>회원가입</title>
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
<div id="CenterInfo">
	<input type="text" id="id" name="id" placeholder="아이디" required="required">
	<br>
	<input type="text" id="pw" name="pw" placeholder="비밀번호" required="required">
	<br>
	<input type="text" id="rePass" name="rePass" placeholder="비밀번호 확인" required="required">
	<br>
	<input type="text" id="name" name="name" placeholder="이름" required="required">
	<br>
	<input type="text" id="birthday" name="birthday" placeholder="생년월일" required="required">
	<br>
	<input type="text" id="phone" name="phone" placeholder="전화번호" required="required">
	<br>
	<input type="text" id="address" name="address" placeholder="이메일" required="required">
</div>
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