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
	
	<input type="submit" value="도서 검색" name="BookSearchButton"
		id="BookSearchButton"
		onclick="location.href='ManagebookSearch.jsp?managerid=<%=managerid%>'">
		
	<input type="submit" value="도서 관리" name="BookManageButton"
		id="BookManageButton"
		onclick="location.href='bookmanage.jsp?managerid=<%=managerid%>'">


	<input type="button" value="회원" name="MemberLoginButton"
		id="MemberLoginButton">

</body>
</html>
