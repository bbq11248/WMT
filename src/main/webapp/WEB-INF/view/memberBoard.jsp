<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<title>마이페이지</title>
</head>
<script type="text/javascript">
	function ticketChk() {
		location.href="./ticketList.do"
	}
	function paymentList() {
		location.href="./payList.do"
	}
	function main() {
		location.href = "./main.do"
	}

</script>
<body>
<div class="body">
	<div class="main">
		<div class="main_header">
			<h1><a><img onclick="main()" src="./image/logo.png"></a> WMT</h1>
		</div>
	</div>

<div>
		<form action="./modifyBoard.do" method="get">
			<table>
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="id" value="${mbDto.id}" readonly="readonly">
					</td>
			</tr>
			
			<tr>
				<th>이름</th>
					<td>
						<input type="text" name="name" value="${mbDto.name}" readonly="readonly">
					</td>
			</tr>	
			
			<tr>	
				<th>닉네임</th>
				<td>
					<input type="text" name="nickname" value="${mbDto.nickname}" readonly="readonly">
				</td>
			</tr>
				
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="birthday" value="${mbDto.birthday}" readonly="readonly">
				</td>
			</tr>
				
			<tr>	
				<th>전화번호</th>
				<td>
					<input type="text" name="phone" value="${mbDto.phone}" readonly="readonly">
				</td>
			</tr>	
				
			<tr>	
				<th>주소</th>
				<td>
					<input type="text" name="address" value="${mbDto.address}" readonly="readonly">
				</td>
			</tr>	
				
			<tr>
				<th>이메일</th>
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