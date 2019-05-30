<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function selMovieTheater() {
		location.href = "./listMT.do";
	}
	
	function selTheater() {
		location.href = "./insertMTSelTheater.do";
	}
</script>
<body>
<h1>상영관 관리 페이지</h1>
<input type="button" value="상영관 전체 보기" onclick="selMovieTheater()">
<input type="button" value="상영관 등록" onclick="selTheater()">


</body>
</html>