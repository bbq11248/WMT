<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript">
	function ticketDetail(ticketing_no) {
		location.href = "./detailTicket.do?ticketing_no="+ticketing_no;
	}
</script>
<body>
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
</body>
</html>