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
	function theater(val) {
		$.ajax({
			type:"GET",
			url:"./theaterChk.do",
			data : {"movie_no" : val},
			dataType : "json",
			success: function(result){				
				for(var i = 0; i < result.result.length; i++)
					{				
						document.getElementById("result").innerHTML += result.result[i].theater_name;
					}
				//alert(result.result[1].theater_name);
			},
			error: function() {
				alert("에러");
			}	
		});
	}
</script>
<body>
 <div id="result"></div>
	<c:forEach items="${movielist}" var="dto">
		<input type="button" onclick="theater('${dto.movie_no}')" value="${dto.movie_name}">
		<a href="./theaterChk.do?movie_no=${dto.movie_no}">${dto.movie_name}</a>
	</c:forEach>

</body>
</html>