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


	<h1>member Page</h1>
	
	<input type="submit" value="���� �˻�" name="BookSearchButton"
		id="BookSearchButton"
		onclick="location.href='ManagebookSearch.jsp?managerid=<%=managerid%>'">
		
	<input type="submit" value="���� ����" name="BookManageButton"
		id="BookManageButton"
		onclick="location.href='bookmanage.jsp?managerid=<%=managerid%>'">


	<input type="button" value="ȸ��" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='vipManager.jsp?managerid=<%=managerid%>'">

</body>
</html>
