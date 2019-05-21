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
<header id="header"></header>

<a href="./regist.do?id=양규동&pw=1234&name=양규동&address=진숙구 진숙동&
nickname=야옹&birthday=190701&phone=01035352906&
email=nang@naver.com&mileage=0">회원가입</a>

<a href="./memupdate.do?id=JN&pw=1234&nickname=앙앙&phone=01098745612&address=기모찌기모찌&birthday=123456">회원정보수정</a>

<a href="./memberList.do">회원전체보기</a>

<a href="./memberInfo.do?id=wlstnr7833">아이디중복체크</a>

<a href="./memberId.do?name=양규동&birthday=190701">아이디찾기</a>

<a href="./password.do?id=양규동&pw=9876">비밀번호발송</a>

<a href="./info.do?id=wlstnr7833">회원상세보기</a>


<br>

<a href="./board.do">전체글조회</a>

<a href="./oneBoard.do?seq=BS24">상세글조회</a>

<a href="./insertBoard.do?id=wlstnr7833&title=안녕하세요?&content=사이트에 오셔서 감사합니다.">글입력</a>

<a href="./updateBoard.do?seq=BS24&id=wlstnr7833&pw=1234&title=수정합니다.&content=게시글수정완료.">글수정</a>

<a href="./deleteBoard.do?seq=BS24">글삭제</a>


</body>

</html>