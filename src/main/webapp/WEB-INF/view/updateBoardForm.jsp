<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/content.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<body>
<div class="body">
	<div class="main">
		<div class="main_header">
			<h1><a><img onclick="main()" src="./image/logo.png"></a> WMT</h1>
		</div>
	</div>
<div class="content">
	<form action="./updateBoard.do">
		<table>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" readonly="readonly" value="${seq}" name="seq">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" readonly="readonly" value="${id}" name="id">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" value="${title}" name="title">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<input type="text" value="${content}" name="content">
				</td>
			</tr>
		</table>
		<input type="submit" value="완료">
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