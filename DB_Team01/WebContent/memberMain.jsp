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
</head>
<body>


	<h1>member Page</h1>
	<input type="submit" value="도서검색" name="BookSearchButton"
		id="BookSearchButton"
		onclick="location.href='bookSearch.jsp?memberid=<%=memberid%>'">

<input type="button" value="대출현황" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='memberLoanList.jsp?memberid=<%=memberid%>'">
		
		<input type="button" value="예약현황" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='memberReserList.jsp?memberid=<%=memberid%>'">

	<input type="button" value="마이페이지" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='memberInfo.jsp?memberid=<%=memberid%>'">

</body>
</html>
