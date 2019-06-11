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
<link rel="stylesheet" type="text/css" href="./css/footer.css">

<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript">
	function updateboardForm(seq, id, title, content) {
		location.href = "./updateBoardForm.do?seq="+seq+"&id="+id+"&title="+title+"&content="+content;
	}
	
	function deleteBoard(seq) {
		location.href = "./deleteBoard.do?seq="+seq;
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
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<tr>
			<td>${bDto.seq}</td>
			<td>${bDto.title}</td>
			<td>${bDto.content}</td>
			<td>${bDto.id}</td>
			<td>${bDto.regdate}</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="updateboardForm('${bDto.seq}','${bDto.id}','${bDto.title}','${bDto.content}')">
			</td>
			<td colspan="2">
				<input type="button" value="삭제" onclick="deleteBoard('${bDto.seq}')">
			</td>
		</tr>
	</table>
	${bDto}
	
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