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
	function updateboardForm(seq, id, title, content) {
		location.href = "./updateBoardForm.do?seq="+seq+"&id="+id+"&title="+title+"&content="+content;
	}
	
	function deleteBoard(seq) {
		location.href = "./deleteBoard.do?seq="+seq;
	}
</script>
<body>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<tr>
			<td>${bDto.seq}</td>
			<td>${bDto.title}</td>
			<td>${bDto.content}</td>
			<td>${bDto.id}</td>
			<td>${bDto.regdate}</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="updateboardForm('${bDto.seq}','${bDto.id}','${bDto.title}','${bDto.content}')">
			</td>
			<td colspan="2">
				<input type="button" value="삭제" onclick="deleteBoard('${bDto.seq}')">
			</td>
		</tr>
	</table>
	${bDto}
</body>
</html>