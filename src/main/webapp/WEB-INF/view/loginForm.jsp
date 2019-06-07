<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>로그인</title>
</head>

<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>
<script type="text/javascript">


	function loginCheck() {
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		var frm = document.getElementById("frm");
		frm.action="./login.do";
		if(id==null||id==""){
			alert("아이디를 확인해주세요");
		} else if(pw==null||pw==""){
			alert("비밀번호를 확인해주세요");
		} else {
			jQuery.ajax({
				url : "./loginCheck.do",
				type : "post",
				data : {"id" : id, "pw" : pw},
				success : function(msg){
					if(msg == "성공"){
						frm.submit();
					} else {
						alert("아이디 혹은 비밀번호를 다시 확인해주세요");
					}
				}
			});
		}
	}
	
	function idSearch(){
		location.href = "./idSearchForm.do";
	}
	
</script>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

<body>
<div class="main">
	<div class="main_header">
		<h1><a><img onclick="main()" src="./image/logo.png"></a> WMT</h1>
	</div>
</div>


<div class="card align-middle" style="width:20rem; border-radius:20px;">
	<div class="card-title" style="margin-top:30px;">
		<h2 class="card-title text-center" style="color:#113366;">로그인</h2>
	</div>
	<div class="card-body">
	<form class="form-signin" method="post" id="frm">
		<h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
<!-- 			<div id="idBox">아이디</div> -->
			<input type="text" name="inputId" id="id" placeholder="아이디" required="required" >
<!-- 			<div id="pwBox">비밀번호</div> -->
			<input type="password" name="inputPw" id="pw" placeholder="비밀번호" required="required">
			<br>
			<input type="button" id="login" name="login" value="로그인" onclick="loginCheck()">
			<br>
			<input type="button" id="SearchId" value="아이디 / 비밀번호 찾기" onclick="idSearch()">
	</form>
	
		</div>
	</div>
</body>
</html>