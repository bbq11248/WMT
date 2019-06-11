<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/menu.css">
<link rel="stylesheet" type="text/css" href="./css/content.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드민 페이지</title>
</head>
<script type="text/javascript">
	function movie_play_manager() {
		location.href = "./moviePlayManager.do"
	}
	
	function logoutForm() {
		location.href = "./logoutForm.do"
		
	}
	function theater_manager() {
		location.href="./theater_manager.do"
	}

	function movie_theater_manager() {
		location.href="./movie_theater_manager.do"
	}

	function movie_manager() {
		location.href="./movieManager.do"
	}
	function boardList() {
		location.href = "./board.do";
	}
	function main() {
		location.href = "./main.do"
	}
</script>
<body>
<div class="body">
	<div class="main">
		<div class="main_header">
			<h1>
				<a><img onclick="main()" src="./image/logo.png"></a>WMT
			</h1>
			<div class="welcome">관리자 페이지 입니다.</div>
		</div>
	</div>
		<div class="main_info">
			<input type="button" value="마이 페이지" onclick="memberInfo()">
			<input type="button" value="로그아웃" onclick="logoutForm()">
			<input type="button" value="공지 사항" onclick="boardList()">
		</div>
	
	<div class="menu">
		<div class="menu-bar">
			<input type="button" value="상영중인 영화관 관리" onclick="movie_play_manager()">
			<input type="button" value="영화관 관리" onclick="theater_manager()">
			<input type="button" value="상영관 관리" onclick="movie_theater_manager()">
			<input type="button" value="영화 관리" onclick="movie_manager()">
		</div>
	</div>
	<div class="content"></div>
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