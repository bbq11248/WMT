<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>

</head>
<script type="text/javascript">
	function check() {
		//비밀번호확인, 아이디중복체크
		var pw = document.getElementById("pw").value;
		var passOK = document.getElementById("passOK").value;
		alert(pw+"::"+passOK);
		
		var frm = document.form[0];
		
		var chk = document.getElementById("chaVal").value;
		alert(chk);
		
		
		//유효값 검사
		if(pw != passOK){
		 alert("비밀번호를 확인해주세요.");
		 return false;
		}
		
	}
</script>

<body>
<div id="container">
	<div id= "title">
		<img src="#">	
	</div>
	
	<input type="hidden" value="0" id="chaVal">
	
	<form action="./regist.do" method="get" id="frm" onsubmit="return check()">
		<div id="info">
		
		
		<div id="leftInfo">정보입력</div>
		
		<div id="conterInfo">
			
			<input type="text" id="id" name="id" placeholder="아이디" required="required">
			<br>
			
			<span id="result"></span>
			<input type="text" id="password" name="pw" placeholder="비밀번호" required="required">
			<br>
			<input type="text" id="password" name="passOK" placeholder="비밀번호 확인" required="required">
			<br>
			<input type="text" id="name" name="name" placeholder="이름" required="required">
			<br>
			<input type="text" id="nickname" name="nickname" placeholder="닉네임" required="required">
			<br>
			<input type="text" id="birthday" name="birthday" placeholder="생년월일 예) 951230" required="required">
			<br>
			<input type="text" id="phone" name="phone" placeholder="전화번호 예) 01012341234" required="required"> 
			<br>
			<input type="text" id="address" name="address" placeholder="주소" required="required">
			<br>
			<input type="text" id="email" name="email" placeholder="이메일" required="required">
			
		</div>	
		<div id="rightInfo"></div>
		</div>
		<div id=line></div>
		<div id="bottom">
		<br>
		* 만 14세 미만은 법정대리인 동의 후 회원서비스를 이용 가능합니다.
		<br>
		* 회원님은 언제든지 관리자가 가지고 잇는 자신의 개인정보에 대해 열람 및 오류정정을
		<br>
		요구할 수 있으며 관리자에 대해 지체없이 처리합니다.
		<br>
		* 선택 약관의 동의하지 않아도 회원가입은 가능합니다.
		<br>
		<strong id="bottomStrong">
		약관과 개인정보 수집 및 이용을 확인하였으며 이에 동의 하십니까?
		</strong>
		<br>
		
		<div id="buttom">
			<input type="submit" value="동의하고  회원가입">
			<input type="button" value="뒤로가기">
		</div>
		
		
		</div>
	</form>
	
</div>


</body>
</html>