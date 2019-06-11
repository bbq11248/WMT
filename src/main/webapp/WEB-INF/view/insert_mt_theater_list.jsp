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
	function insertMTForm(theater_no) {
// 		alert(theater_no);
		location.href = "./insertMTForm.do?theater_no="+theater_no;
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
	

<div class="content">
<h1>상영관을 등록할 영화관을 선택해 주세여</h1>
<table border="1">
<tr>
	<td>영화관 번호</td>
	<td>영화관 이름</td>
	<td>영화관 주소</td>
</tr>
		<c:forEach items="${lists}" var="theater">
			<tr>
				<td>${theater.theater_no}</td>
				<td>
					<input type="button" value="${theater.theater_name}" onclick="insertMTForm('${theater.theater_no}')">
				</td>
				<td>${theater.theater_local}</td>
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
</div>
</body>
</html>