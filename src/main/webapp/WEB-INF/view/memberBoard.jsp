<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<script type="text/javascript">
	function ticketChk() {
		location.href="./ticketList.do"
	}
	function paymentList() {
		location.href="./payList.do"
	}

</script>
<body>


<div>
		<form action="./modifyBoard.do" method="get">
			<table>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>생년월일</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>이메일</td>
				<td>등급</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="id" value="${mbDto.id}" readonly="readonly">
				</td>
				<td>
					<input type="text" name="name" value="${mbDto.name}" readonly="readonly">
				</td>
				<td>
					<input type="text" name="nickname" value="${mbDto.nickname}" readonly="readonly">
				</td>
				<td>
					<input type="text" name="birthday" value="${mbDto.birthday}" readonly="readonly">
				</td>
				<td>
					<input type="text" name="phone" value="${mbDto.phone}" readonly="readonly">
				</td>
				<td>
					<input type="text" name="address" value="${mbDto.address}" readonly="readonly">
				</td>
				<td>
					<input type="text" name="email" value="${mbDto.email}" readonly="readonly">
				</td>
			</tr>
			</table>
			<input type="submit" value="수정하기">
			<input type="button" value="결제 내역 확인" onclick="paymentList()">
			<input type="button" value="예매 내역 보기" onclick="ticketChk()">
			<input type="button" value="뒤로가기" onclick="backWard()">
		</form>

	
</div>


</body>
</html>