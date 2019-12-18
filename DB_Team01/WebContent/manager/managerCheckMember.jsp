<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String managerid = request.getParameter("managerid");
	System.out.println(managerid);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>member Page</title>
</head>
<body>

	<h1>회원 관리 페이지</h1>

	<input type="submit" value="회원 목록" name="BookSearchButton"
		id="BookSearchButton"
		onclick="location.href='manageMemberInfo.jsp?managerid=<%=managerid%>'">
	<br></br>
	<input type="button" value="반납 신청 목록" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='managerLoanList.jsp?managerid=<%=managerid%>'">
	<br></br>
	<input type="button" value="대출 Top 10 목록" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='vipManager.jsp?managerid=<%=managerid%>'">

</body>
</html>
