<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/loginForm.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/content.css">

 
<!DOCTYPE html>
<html class="html">
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
	
	function main() {
		location.href = "./main.do"
	}
	function enterKey() {
		if(window.event.keyCode == 13){
			loginCheck();
		}
	}
	
</script>


<body>
<div class="body">

<div class="main">
		<div class="main_header">
			<h1><a><img onclick="main()" src="./image/logo.png"></a> WMT</h1>
		</div>
</div>

<div class="content">
<div id="div"></div>
<div class="card align-middle" id=container>
	
	<div class="card-title" id="loginForm">
		<h2 class="card-title text-center">로그인</h2>
	</div>
	<div class="card-body">
	<form class="form-signin" method="post" id="frm">
		<h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
			<input type="text" class="form-control" name="inputId" id="id" placeholder="아이디" required="required">
			<input  type="password" class="form-control" name="inputPw" id="pw" placeholder="비밀번호" required="required" onkeyup="enterKey();">
			<br>
			
			<input type="button" class="btn btn-lg btn-primary btn-block" id="login" name="login" value="로그인" onclick="loginCheck()">
			<br>
			<input type="button" class="btn btn-secondary btn-sm" id="SearchId" value="아이디 / 비밀번호 찾기" onclick="idSearch()">
	</form>
	
		</div>
	</div>
	</div>
	
<div id="div2"></div>
	<div class="footer">
			<div>
				<table>
					<tr>
						<td>서울특별시 강남구 역삼동 역삼역 3번 출구 신한은행 건물 4층 C Class</td>
					</tr>
					<tr>
						<td>개발자 : 양진숙, 이정휴</td>
						<td>대표 번호 : 010-1234-1234</td>
					</tr>
					<tr>
						<td>개발자 e-mail: WMT001@movie.com</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
