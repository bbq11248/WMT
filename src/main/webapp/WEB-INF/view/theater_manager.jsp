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
<body>
<script type="text/javascript">
	function insertTheater() {
		location.href="./insertTForm.do";
	}
	
	function selTheaterList() {
		location.href="./selT.do"
	}
</script>
<h1>영화관 관리</h1>

<input type="button" value="영화관 보기" onclick="selTheaterList()">
<input type="button" value="영화관 수정" onclick="insertTheater()">
<input type="button" value="영화관 등록" onclick="insertTheater()">
</body>
</html>