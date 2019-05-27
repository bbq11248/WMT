<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>
<script type="text/javascript">
	function loginCheck() {
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		alert(id+":"+pw);
	}
	
	
</script>

<body>
	<div id="title">게시판 로그인</div>
	<div id="id">아이디</div>
	<form method="post" id="frm">
		<input type="text" name="inputId" id="id" placeholder="아이디" required="required">
		<div id="pw">비밀번호</div>
		<input type="password" name="inputPw" id="pw" placeholder="비밀번호" required="required">
		<br>
		<input type="button" id="login" name="login" value="로그인" onclick="loginCheck()">
		<br>
		<input type="button" id="SearchId" value="아이디찾기" onclick="idSearch()">
		<input type="button" id="SearchPw" value="비밀번호찾기" onclick="pwSearch()">
	</form>
</body>
</html>