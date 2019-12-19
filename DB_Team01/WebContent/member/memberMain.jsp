<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String memberid = request.getParameter("memberid");
	System.out.println(memberid);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>member Page</title>
<style type="text/css">
 
 	h1{
 		margin-bottom: 150px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	
 	#booksearhatmem{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;
 		margin-right: 10px;
 		width: 134px;
 	}
 	#nowstatus{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;
 		margin-right: 10px;
		width: 134px;
 	}
 	#nowreservation{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;
 		margin-right: 10px;	
 		width: 134px;
 	}
 	#tomypage{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;	
 		width: 134px;
 	}
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#memmainpage{
 		margin: 0 atuo;
 		text-align: center;
 	}
 </style>
</head>
<body>


	<h1>회원 MAIN PAGE</h1>
	<div id="memmainpage">
	<input type="submit" value="도서검색" name="BookSearchButton"
		id="booksearhatmem"
		onclick="location.href='../member_book/bookSearch.jsp?memberid=<%=memberid%>'">

	<input type="button" value="대출현황" name="MemberLoginButton"
		id="nowstatus"
		onclick="location.href='memberLoanList.jsp?memberid=<%=memberid%>'">
		
		<input type="button" value="예약현황" name="MemberLoginButton"
		id="nowreservation"
		onclick="location.href='memberReserList.jsp?memberid=<%=memberid%>'">

	<input type="button" value="마이페이지" name="MemberLoginButton"
		id="tomypage"
		onclick="location.href='memberInfo.jsp?memberid=<%=memberid%>'">
	</div>
</body>
</html>
