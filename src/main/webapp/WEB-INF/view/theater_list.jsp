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
<style type="text/css">
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
<script type="text/javascript">
	function detail(theater_no) {
		location.href="./selOneT.do?theater_no="+theater_no;
	}
</script>
<table>
<tr>
	<td>영화관 번호</td>
	<td>영화관 이름</td>
	<td>영화관 주소</td>
</tr>
		<c:forEach items="${lists}" var="theater">
			<tr>
				<td>${theater.theater_no}</td>
				<td>
					<a href="#" onclick="detail(${theater.theater_no})">${theater.theater_name}</a>
				</td>
				<td>${theater.theater_local}</td>
			</tr>
		</c:forEach>
			
</table>
</body>
</html>