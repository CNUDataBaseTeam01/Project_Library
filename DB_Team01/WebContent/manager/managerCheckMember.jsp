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

	<h1>ȸ�� ���� ������</h1>

	<input type="submit" value="ȸ�� ���" name="BookSearchButton"
		id="BookSearchButton"
		onclick="location.href='manageMemberInfo.jsp?managerid=<%=managerid%>'">
	<br></br>
	<input type="button" value="�ݳ� ��û ���" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='managerLoanList.jsp?managerid=<%=managerid%>'">
	<br></br>
	<input type="button" value="���� Top 10 ���" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='vipManager.jsp?managerid=<%=managerid%>'">

</body>
</html>
