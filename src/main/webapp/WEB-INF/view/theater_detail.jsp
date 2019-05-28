<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript">
	function updateTheater(theater_no, theater_name, theater_local) {
// 		alert(theater_no+":"+theater_name+":"+theater_local);
		location.href="./updateTForm.do?theater_no="+theater_no+"&theater_name="+theater_name+"&theater_local="+theater_local;
	}
	
	function insertMovieTheater(theater_no) {
		location.href = "./insertMTForm.do?theater_no="+theater_no;
	}
	
	function MTDetail(movie_theater_no) {
		location.href = "./detailMT.do?movie_theater_no="+movie_theater_no;
	}
</script>
<body>
<input type="button" value="영화관 수정" onclick="updateTheater('${lists[0].theater_no}','${lists[0].theater_name}','${lists[0].theater_local}')">
<input type="button" value="상영관 등록" onclick="insertMovieTheater('${lists[0].theater_no}')">
	<table border="1">
		<tr>
			<td>영화관 번호</td>
			<td>영화관 이름</td>
			<td>영화관 주소</td>
			<td>상영관 번호</td>
			<td>상영관 이름</td>
		</tr>
		<c:forEach items="${lists}" var="theater">
			<tr>
				<td>${theater.theater_no}</td>
				<td>${theater.theater_name}</td>
				<td>${theater.theater_local}</td>
				<td>${theater.movie_theater_no}</td>
				<td>
					<input type="button" onclick="MTDetail('${theater.movie_theater_no}')" value="${theater.movie_theater_name}">
				</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>