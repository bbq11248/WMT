<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>♥♡jin sook page♡♥</title>
</head>
<body>

<a href="./TopMeun.do">탑메뉴</a>
<br><br>

<a href="./regist.do?">회원가입</a>

<a href="./login.do?id=wlstnr7833&pw=1234">로그인</a>
<a href="./loginForm.do">로그인 폼</a>

<a href="./memupdate.do?id=JN&pw=1234&nickname=앙앙&phone=01098745612&address=기모찌기모찌&birthday=123456">회원정보수정</a>

<a href="./memberList.do">회원전체보기</a>

<a href="./memberInfo.do?id=wlstnr7833">아이디중복체크</a>

<a href="./memberId.do?name=양규동&birthday=190701">아이디찾기</a>

<a href="./password.do?id=양규동&pw=9876">비밀번호발송</a>

<a href="./info.do?id=wlstnr7833">회원상세보기</a>
<br><br>





<br><br><br><br><br><br>

<a href="./board.do">전체글조회</a>

<a href="./oneBoard.do?seq=BS24">상세글조회</a>

<a href="./insertBoard.do?id=wlstnr7833&title=안녕하세요?&content=사이트에 오셔서 감사합니다.">글입력</a>

<a href="./updateBoard.do?seq=BS24&id=wlstnr7833&pw=1234&title=수정합니다.&content=게시글수정완료.">글수정</a>

<a href="./deleteBoard.do?seq=BS24">글삭제</a>


</body>

</html>