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
<title>내정보 수정 페이지</title>
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
<div>
	<h3>회원정보수정</h3>
	<h5>변경 가능한 정보 : 닉네임, 생년월일, 핸드폰, 주소</h5>
</div>
	<form action="./updateMyBoard.do">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" value="${id}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="${name}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="nickname" value="${nickname}">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" name="birthday" value="${birthday}">
				</td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td>
					<input type="text" name="phone" value="${phone}">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="address" value="${address}">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email" value="${email}" readonly="readonly">
				</td>
			</tr>
		
		</table>
		<input type="submit" value="수정완료">
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