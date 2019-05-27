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
				data : "id="+id+"&pw="+pw,
				success : function(msg){
					if(msg == "성공"){
						frm.submit();
					} else {
						alert("아이디나 비밀번호를 다시 확인해주세요");
					}
				}
			});
		}
	}
	
	function idSearch(){
		alert("구현해주세요.");
	}
	
	function pwSearch(){
		alert("구현해주세요.");
	} 
	
</script>

<body>
	<div id="title">게시판 로그인</div>
	<div id="idBox">아이디</div>
	<form method="post" id="frm">
		<input type="text" name="inputId" id="id" placeholder="아이디" required="required" >
		<div id="pwBox">비밀번호</div>
		<input type="password" name="inputPw" id="pw" placeholder="비밀번호" required="required">
		<br>
		<input type="button" id="login" name="login" value="로그인" onclick="loginCheck()">
		<br>
		<input type="button" id="SearchId" value="아이디찾기" onclick="idSearch()">
		<input type="button" id="SearchPw" value="비밀번호찾기" onclick="pwSearch()">
	</form>
</body>
</html>