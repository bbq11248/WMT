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
	function updateMP(movie_play_no, movie_name, theater_name, movie_theater_name, movie_start_time, times) {
		location.href = "./updateMPForm.do?movie_play_no="+movie_play_no+"&movie_name="+movie_name+"&movie_theater_name="+movie_theater_name+"&movie_start_time="+movie_start_time+"&theater_name="+theater_name+"&times="+times;
	}
	
	function checkAllDel(bool){
		var chks =  document.getElementsByName("movie_play_chk");
//		alert(chks.length);
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}


	function chkBox(){
//		alert("작동");
		var chks =  document.getElementsByName("movie_play_chk");
		var c = 0;
		for (var i = 0; i < chks.length; i++) {
			if(chks[i].checked){
				c++;
			}
		}
		if(c>0){
			var doc = document.getElementById("deleteForm");
//			var doc = document.forms[0];
// 			var doc =document.deleteForm;
			doc.action = "./deleteMP.do";
			return true;
		}else{
			swal("게시글 삭제 오류","선택된 글이 없습니다.");
			return false;
		}
	}
	function insertMP() {
		location.href = "./insertMPForm.do"
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

	<form action="#" method="get" id="deleteForm" onsubmit="return chkBox()">
		<table>
			<tr>
				<td>
				<input type="checkbox" onclick="checkAllDel(this.checked)">
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
					<td>
						<input type="checkbox" name="movie_play_chk" value="${lists.movie_play_no}">
					</td>
					<td>${lists.movie_play_no}</td>
					<td>${lists.movie_name}</td>
					<td>${lists.theater_name}</td>
					<td>${lists.movie_theater_name}</td>
					<td>${lists.movie_start_time}</td>
					<td>${lists.times}</td>
					<td><input type="button" value="수정" onclick="updateMP('${lists.movie_play_no}','${lists.movie_name}','${lists.theater_name}','${lists.movie_theater_name}','${lists.movie_start_time}','${lists.times}')"></td>
				</tr>
			</c:forEach>
			<tr>
				<td>
					<input type="submit" value="삭제">
					<input type="button" value="등록" onclick="insertMP()">
				</td>
			</tr>
		</table>
	</form>
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