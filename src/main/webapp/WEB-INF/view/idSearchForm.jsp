<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>

</head>

<script type="text/javascript">
	function idCcheck() {
// 		location.href = "./idSearch.do";
		var name = document.getElementById("name").value;
		var birthday = document.getElementById("birthday").value;
		$.ajax({
			type: "POST",
			url : "./idSearch.do",
			data : {"name" : name, "birthday" : birthday},
			success : function(idSer) {
				alert("성공");
				document.getElementById("idInfo").innerHTML = "";
				if(idSer.id == null){
					if(confirm("가입 정보가 없습니다 . 회원 가입 하시겠습니까 ?") == true){
						location.href = "./signupForm.do";
					}else {
						idSer.id = "잘못된 정보를 입력 하셨습니다."
						document.getElementById("idInfo").innerHTML += idSer.id;
						$("#idInfo").css("color","red");
					}
				}else {
				document.getElementById("idInfo").innerHTML += idSer.id;
				alert(idSer.id);
				}
				
			},
			error : function() {
				alert("에러")
			}
		});
	}
	
	function pwCcheck() {
		var id = document.getElementByID("id").value;
		var birthday = document.getElementById("birthday").value;
	
		$.ajax({
			type : "POST",
			url : "./pwSearch.do",
			data: 
			
		})
	}
</script>


<body>

	<table>
		<tr>
			<td>아이디 찾기</td>
		</tr>	
	</table>
	
	<table>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" id="name">
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="text" name="birthday" id="birthday">
			</td>
		</tr>
		<tr>
			<td>
				<div>
					<input type="button" value="아이디 찾기" onclick="idCcheck()">
				</div>
			</td>
		</tr>
	</table>
		
		<div id="idInfo"></div>
		
	<table>
		<tr>
			<td>비밀번호 찾기</td>
		</tr>	
	</table>	
	
	<table>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" id="id">
			</td>
		</tr>
		
		<tr>
			<td>생년월일</td>
			<td>
				<input type="text" name="birthday" id="birthday">
			</td>
		</tr>
		
		<tr>
			<td>
				<div>
					<input type="button" value="비밀번호 찾기" onclick="pwCcheck()">
				</div>
			</td>
		</tr>
	</table>
	
	<div id="pwdInfo"></div>

</body>
</html>