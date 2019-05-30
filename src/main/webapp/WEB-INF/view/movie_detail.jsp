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
	function updateMovie(movie_no, movie_name ,movie_foreman, movie_genre, movie_openday, movie_country, movie_time) {
		location.href = "./updateMForm.do?movie_no="+movie_no+"&movie_name="+movie_name+"&movie_foreman="+movie_foreman+"&movie_genre="+movie_genre+"&movie_openday="+movie_openday+"&movie_country="+movie_country+"&movie_time="+movie_time;
	}
</script>
<body>
	<input type="button" value="수정" onclick="updateMovie('${lists[0].movie_no}','${lists[0].movie_name}','${lists[0].movie_foreman}','${lists[0].movie_genre}','${lists[0].movie_openday}','${lists[0].movie_country}','${lists[0].movie_time}')">
	<table>
		<tr>
			<td>영화 이름</td>
			<td>영화 감독</td>
			<td>영화 장르</td>
			<td>개봉일</td>
			<td>국가</td>
			<td>총 영화 시간</td>
		</tr>
		<c:forEach items="${lists}" var="lists">
		<tr>
			<td>
				<input type="text" readonly="readonly" value="${lists.movie_name}" name="movie_name">
			</td>
			<td>
				<input type="text" readonly="readonly" value="${lists.movie_foreman}" name="movie_foreman">
			</td>
			<td>
				<input type="text" readonly="readonly" value="${lists.movie_genre}" name="movie_genre">
			</td>
			<td>
				<input type="text" readonly="readonly" value="${lists.movie_openday}" name="movie_openday">
			</td>
			<td>
				<input type="text" readonly="readonly" value="${lists.movie_country}" name="movie_country">
			</td>
			<td>
				<input type="text" readonly="readonly" value="${lists.movie_time}" name="movie_time">
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>