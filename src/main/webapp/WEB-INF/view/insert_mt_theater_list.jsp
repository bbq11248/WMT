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
	function insertMTForm(theater_no) {
// 		alert(theater_no);
		location.href = "./insertMTForm.do?theater_no="+theater_no;
	}
</script>
<body>
<h1>상영관을 등록할 영화관을 선택해 주세여</h1>
<table border="1">
<tr>
	<td>영화관 번호</td>
	<td>영화관 이름</td>
	<td>영화관 주소</td>
</tr>
		<c:forEach items="${lists}" var="theater">
			<tr>
				<td>${theater.theater_no}</td>
				<td>
					<input type="button" value="${theater.theater_name}" onclick="insertMTForm('${theater.theater_no}')">
				</td>
				<td>${theater.theater_local}</td>
			</tr>
		</c:forEach>
			
</table>
</body>
</html>