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
<link rel="stylesheet" type="text/css" href="./css/content.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function insertTheater() {
		location.href="./insertTForm.do";
	}
	
	function selTheaterList() {
		location.href="./selT.do"
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
	
<div class="content">
<h1>영화관 관리</h1>

<input type="button" value="영화관 보기" onclick="selTheaterList()">
<input type="button" value="영화관 등록" onclick="insertTheater()">
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