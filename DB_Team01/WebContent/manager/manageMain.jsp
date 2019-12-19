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
<style type="text/css">
 
 	h1{
 		margin-bottom: 150px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	
 	#BookSearchButton{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;
 		margin-right: 10px;
 	}
 	#BookManageButton{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;
 		margin-right: 10px;
 	}
 	#MemberLoginButton{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;	
 		width: 119.56px;
 	}
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#mamain{
 		margin: 0 atuo;
 		text-align: center;
 	}
 </style>
</head>
<body>


	<h1>관리자 MAIN PAGE</h1>
	<div id = mamain>
	<input type="submit" value="도서 검색" name="BookSearchButton"
		id="BookSearchButton"
		onclick="location.href='../manager_book/ManagebookSearch.jsp?managerid=<%=managerid%>'">
		
	<input type="submit" value="도서 관리" name="BookManageButton"
		id="BookManageButton"
		onclick="location.href='../manager_book/bookmanage.jsp?managerid=<%=managerid%>'">

	<input type="button" value="회원" name="MemberLoginButton"
		id="MemberLoginButton"
		onclick="location.href='managerCheckMember.jsp?managerid=<%=managerid%>'">
	</div>
</body>
</html>
