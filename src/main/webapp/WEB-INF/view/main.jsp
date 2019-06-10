<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 메인페이지</title>
</head>
<script type="text/javascript">
	function logoutForm() {
		location.href = "./logoutForm.do"
	}
	function myBoard() {
		location.href = "./myBoard.do"
	}

</script>

<body>
	<div class="main">
		<div class="main_header">
			<h1><a><img onclick="main()" src="./image/logo.png"></a>WMT</h1>
		</div>
		<div class="main_info">
			<input type="button" value="로그아웃" onclick="logoutForm()">
			<input type="button" value="마이페이지" onclick="myBoard()">
		</div>
	</div>
</body>
</html>