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
<link rel="stylesheet" type="text/css" href="./css/content.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">

<title>공지사항 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript">
	function detailBoard(seq) {
		location.href = "./oneBoard.do?seq="+seq;
	}
	function insertBoard() {
		location.href = "./insertBoardForm.do" 
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
	<input type="button" value="글 입력 " onclick="insertBoard()">
	<table>
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${lists}" var="lists">
			<tr>
				<td>${lists.seq}</td>
				<td>
					<input type="button" value="${lists.title}" onclick="detailBoard('${lists.seq}')">
				</td>
				<td>${lists.id}</td>
				<td>${lists.regdate}</td>
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