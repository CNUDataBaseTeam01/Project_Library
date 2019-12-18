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
	<form action="bookSearch.jsp" method="post">
		<input type="submit" value="도서검색" name="BookSearchButton"
			id="BookSearchButton" />
	</form>
	<form action="bookSearch.jsp" method="post">
		<input type="submit" value="마이페이지" name="MemberLoginButton"
			id="MemberLoginButton" />
	</form>
</body>
</html>
