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
	function ticketDetail(ticketing_no) {
		location.href = "./detailTicket.do?ticketing_no="+ticketing_no;
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
	<table>
		<tr>
			<td>티켓 번호</td>
			<td>상영 영화 번호</td>
			<td>영화관 이름</td>
			<td>상영관 이름</td>
			<td>영화 이름</td>
		</tr>
		<c:forEach items="${lists}" var="lists">
		<tr>
			<td>${lists.ticketing_no}</td>
			<td>${lists.movie_play_no}</td>
			<td>${lists.theater_name}</td>
			<td>${lists.movie_theater_name}</td>
			<td>
				<input type="button" value="${lists.movie_name}" onclick="ticketDetail('${lists.ticketing_no}')">
			</td>
		</tr>
		</c:forEach>
	</table>
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