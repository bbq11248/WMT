<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Test page</title>
</head>
<body>
</body>
<a href="jin.jsp">진숙 테스트</a>

<a href="./mileageChk.do?id=JINSOOK">mileage확인</a>
<a href="./mileage.do?id=JINSOOK&price=10000">마일리지 충전</a>
<a href="./payList.do?id=JINSOOK">결재 내역 확인</a>
<br>
<br>
<br>
<a href="./ticketList.do?id=JINSOOK">예매내역 보기</a>
<a href="./detailTicket.do">예매내역 상세 보기</a>
<a href="./ticketing.do?id=JINSOOK&price=1000">예매</a>
<a href="./cancel.do?id=JINSOOK&price=1000&ticketing_no=TN21">예매 취소</a>

</html>






