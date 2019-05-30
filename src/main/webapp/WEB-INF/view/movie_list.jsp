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
	function selOneMovie(movie_no) {
		location.href = "./oneM.do?movie_no="+movie_no;
	}
</script>
<body>
	<form action="">
		<table>
			<tr>
				<td>영화 번호</td>
				<td>영화 이름</td>
			</tr>
			<c:forEach items="${lists}" var="lists">
				<tr>
					<td>${lists.movie_no}</td>
					<td>
						<input type="button" value="${lists.movie_name}" onclick="selOneMovie('${lists.movie_no}')">
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>