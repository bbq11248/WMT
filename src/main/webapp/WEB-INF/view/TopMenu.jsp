<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TopMenu</title>
</head>
<body>

<script type="text/javascript">
function login() {
	location.href = "./loginForm.do"
}
function signup() {
	location.href = "./signupForm.do"
	
}
function myboard() {
	location.href = "./myBoard.do"
}

</script>

<div>

<input type="button" value="로그인" onclick="login()">
<input type="button" value="회원가입" onclick="signup()">
<input type="button" value="게시판" onclick="board()">
<input type="button" value="마이페이지" onclick="myboard()">

</div>

</body>
</html>