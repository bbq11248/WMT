<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/menu.css">
<link rel="stylesheet" type="text/css" href="./css/content.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<!DOCTYPE html>
<html class="html">
<head>
<meta charset="UTF-8">
<title>유저 메인페이지</title>
</head>
<script type="text/javascript">
	function logoutForm() {
		location.href = "./logoutForm.do"
	}
	function memberInfo() {
		location.href = "./myBoard.do"
	}
	function playMovieList() {
		location.href = "./playMovie.do"
	}
	function selTheaterList() {
		location.href = "./selTList.do"
	}
	function selMovieList() {
		location.href = "./selMList.do"
	}
	function boardList() {
		location.href = "./board.do";
	}
	function mileageCG() {
		location.href="./mileageForm.do"
	}
</script>

<body>
<div class="body">
	<div class="main">
		<div class="main_header">
			<h1>
				<a><img onclick="main()" src="./image/logo.png"></a>WMT
			</h1>
			<div class="welcome">${id}님환영합니다.</div>
		</div>
	</div>
		<div class="main_info">
			<input type="button" value="충전" onclick="mileageCG()">
			<input type="text" value="${mileage}" readonly="readonly"> 
			<input type="button" value="마이 페이지" onclick="memberInfo()"> 
			<input type="button" value="로그아웃" onclick="logoutForm()">
			<input type="button" value="공지 사항" onclick="boardList()">
		</div>
		<div class="menu">
			<div class="menu-bar">
				<table>
					<tr>
						<td>
							<input type="button" value="예매" onclick="playMovieList()">
						</td>
						<td>
							<input type="button" value="극장"
							onclick="selTheaterList()"></td>
						<td>
							<input type="button" value="영화" onclick="selMovieList()">
						</td>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="premovie">
				<h4>개봉 예정작</h4>
				<img
					src="https://movie-phinf.pstatic.net/20190607_19/1559868537841RhggT_JPEG/movie_image.jpg?type=m99_141_2"
					alt="맨 인 블랙: 인터내셔널"
					onerror="this.src='https://ssl.pstatic.net/static/movie/2012/09/dft_img99x141.png'">
			</div>
			<div class="bestmovie">
				<h4>인기작</h4>
				<img
					src="https://movie-phinf.pstatic.net/20190528_36/1559024198386YVTEw_JPEG/movie_image.jpg?type=m99_141_2"
					alt="기생충"
					onerror="this.src='https://ssl.pstatic.net/static/movie/2012/09/dft_img99x141.png'">
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