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
	function detailBoard(seq) {
		location.href = "./oneBoard.do?seq="+seq;
	}
	function insertBoard() {
		location.href = "./insertBoardForm.do" 
	}
</script>
<body>
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
</body>
</html>