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
<body>
	<table>
		<tr>
			<td>결제 번호</td>
			<td>티켓 번호</td>
			<td>ID</td>
			<td>마일리지</td>
			<td>금액</td>
			<td>시간</td>
		</tr>
		<c:forEach items="${lists}" var="lists">
			<tr>
				<td>${lists.payment_no}</td>
				<td>${lists.ticketing_no}</td>
				<td>${lists.id}</td>
				<td>${lists.mileage}</td>
				<td>${lists.price}</td>
				<td>${lists.mileage_time}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>