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
	function selMoviePlay() {
		location.href="./selectMP.do"
	}
</script>
<body>
<h1>상영중인 영화 관리</h1>
<input type="button" value="상영중인 영화 리스트 보기" onclick="selMoviePlay()">

</body>
</html>