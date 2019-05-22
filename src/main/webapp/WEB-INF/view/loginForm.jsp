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

<script type="text/javascript">
	function loginCheck() {
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		alert(id+":"+pw);
	}
	
	
</script>

<body>
<div id = "loginChk">
<input type="text" id="id" name="id" placeholder="아이디" required="required">
<br>
<input type="text" id="pw" name="pw" placeholder="비밀번호" required="required">
</div>
<br>
<input type="button" value="로그인" onclick="loginCheck()">


</body>
</html>