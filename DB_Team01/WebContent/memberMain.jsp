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
	<input type="submit" value="�����˻�" name="BookSearchButton"
		id="BookSearchButton"
		onclick="location.href='bookSearch.jsp?memberid=<%=memberid%>'">

<input type="button" value="������Ȳ" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='memberLoanList.jsp?memberid=<%=memberid%>'">
		
		<input type="button" value="������Ȳ" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='memberInfo.jsp?memberid=<%=memberid%>'">

	<input type="button" value="����������" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='memberInfo.jsp?memberid=<%=memberid%>'">

</body>
</html>
