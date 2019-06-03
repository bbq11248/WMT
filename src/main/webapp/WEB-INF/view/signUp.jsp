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
	//pw확인, id중복
	var pw = document.getElementById("password").value;
	var passOK = document.getElementById("passwordcheck").value;
	
	var frm = document.forms[0];
	
	var chk = document.getElementById("chaVal").value;
	alert(chk);
	
	if(pw != passOK){
		alert("※회원가입 실패※ 비밀번호를 확인해 주세요.");
		return false;
		//location.href(~~~//signupForm.do); //비밀번호 틀리면 새로고침 or signupForm.do 주소로 이동
	}else if(chk == "0"){
		alert("※회원가입 실패※ 아이디 중복 체크를 해주세요!");
		return false;
	}else{
		alert("성공 이동");
		return true;
	}
	
}

	// 아이디 중복, 요효값 검사
	$(document).ready(function() {
		$("#id").keyup(function() {
			
			//아이디 길이확인
			var inputLength = $(this).val().length;
// 			alert(inputLength);

			var id = $(this).val();
			
			//아이디 공백 검사(있는지 없는지)
			if(id.indexOf(" ") != -1){
				alert("공백");
				$("#result").css("color","red");
				$("#result").html("공백이 포함된 아이디는 사용이 불가능합니다.");
				$("#chaVal").val("1");
			}else if(inputLength >5){
// 				alert("실행!");
				jQuery.ajax({
					url:"./idCheck.do",
					type: "post",
					data: "id="+$(this).val(),
					async: true,
					success: function(msg) {
// 						alert(msg);
						$("#result").html(msg);
						var temp = msg;
						temp = temp.substring(0,temp.indexOf("디")+1);
						if(temp == "사용가능한 아이디"){
							$("#chaVal").val(1);
							$("#result").css("color","blue");
						}else{
							$("#chaVal").val(0);
							$("#result").css("color","red");
				
						}
					}
				});
				
			}else{
				$("#result").css("color","red");
				$("#result").html("6자리 이상만 사용 가능합니다.");
				$("#chaVal").val("0");
			}
		});
	});
	
	
	
</script>

<body>
<div id="container">
	<div id= "title">
		<img src="#">	
	</div>
	
	<input type="hidden" value="0" id="chaVal">
	
	<form action="./regist.do" method="post" id="frm" onsubmit="return check()">
		<div id="info">
		
		
		<div id="leftInfo">정보입력</div>
		
		<div id="conterInfo">
			<input type="text" id="id" name="id" placeholder="아이디" required="required">
			<br>
			
			<span id="result"></span>
			<br>
			
			<input type="text" id="password" name="pw" placeholder="비밀번호" required="required">
			<br>
			<input type="text" id="passwordcheck" name="passOK" placeholder="비밀번호 확인" required="required">
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
			<input type="submit" value="동의하고  회원가입" >
			<input type="button" value="뒤로가기" onclick="javascript:history.back(-1)">
		</div>
		</div>
	</form>
</div>


</body>
</html>