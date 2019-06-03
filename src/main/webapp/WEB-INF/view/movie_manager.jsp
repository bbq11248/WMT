<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function selmovie() {
		location.href = "./listM.do";
	}
	
	function insmovie() {
		location.href = "./insertMForm.do";
	}
</script>
<body>
<h1>영화 관리 페이지</h1>
<input type="button" value="영화 전체 보기" onclick="selmovie()">
<input type="button" value="영화 등록" onclick="insmovie()">
</body> 
</html>