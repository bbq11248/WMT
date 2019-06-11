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
	<form action="./updateM.do">
		<input type="hidden" value="${movie_no}" name="movie_no">
		<table>
			<tr>
				<td>영화 이름</td>
				<td>영화 감독</td>
				<td>영화 장르</td>
				<td>개봉일</td>
				<td>국가</td>
				<td>총 영화 시간</td>
			</tr>
				<tr>
					<td>
						<input type="text" value="${movie_name}" name="movie_name">
					</td>
					<td>
						<input type="text" value="${movie_foreman}" name="movie_foreman">
					</td>
					<td>
						<input type="text" value="${movie_genre}" name="movie_genre">
					</td>
					<td>
						<input type="text" value="${movie_openday}" name="movie_openday">
					</td>
					<td>
						<input type="text" value="${movie_country}" name="movie_country">
					</td>
					<td>
						<input type="text" value="${movie_time}" name="movie_time">
					</td>
				</tr>
			<tr>
				<td colspan="6">
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