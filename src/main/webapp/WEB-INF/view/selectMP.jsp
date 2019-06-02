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
	function updateMP(movie_play_no, movie_name, theater_name, movie_theater_name, movie_start_time, times) {
		location.href = "./updateMPForm.do?movie_play_no="+movie_play_no+"&movie_name="+movie_name+"&movie_theater_name="+movie_theater_name+"&movie_start_time="+movie_start_time+"&theater_name="+theater_name+"&times="+times;
	}
</script>
<body>
	<table>
		<tr>
			<td>
				<input type="checkbox" name="chkVal" value="">
			</td>
			<td>상영중인 영화 번호</td>
			<td>영화 이름</td>
			<td>영화관 이름</td>
			<td>상영관 이름</td>
			<td>영화 시작 시간</td>
			<td>회차</td>
			<td></td>
		</tr>
		<c:forEach items="${lists}" var="lists">
			<tr>
				<td>${lists.movie_play_no}</td>
				<td>${lists.movie_name}</td>
				<td>${lists.theater_name}</td>
				<td>${lists.movie_theater_name}</td>
				<td>${lists.movie_start_time}</td>
				<td>${lists.times}</td>
				<td><input type="button" value="수정" onclick="updateMP('${lists.movie_play_no}','${lists.movie_name}','${lists.theater_name}','${lists.movie_theater_name}','${lists.movie_start_time}','${lists.times}')"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>