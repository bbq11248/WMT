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
	function movieTheaterOne(movie_theater_no) {
		location.href = "./detailMT.do?movie_theater_no="+movie_theater_no;
	}
</script>
<body>
<table>
	<tr>
		<td>상영관 번호</td>
		<td>상영관 이름</td>
	</tr>
	<c:forEach items="${lists}" var="lists">
		<tr>
			<td>${lists.movie_theater_no}</td>
			<td>
				<input type="button" value="${lists.movie_theater_name}" onclick="movieTheaterOne('${lists.movie_theater_no}')">
			</td>
		</tr>
	</c:forEach>
	
</table>
${lists}
</body>
</html>