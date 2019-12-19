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
 	
 	#lookmemlist{
 		margin-bottom: 30px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;
 		width: 188px;
 	}
 	#returnlist{
 		margin-bottom: 30px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;
 		width: 188px;
 	}
 	#top10list{
 		margin-bottom: 30px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 15px;
 		font-size: 20px;
 		font-weight: bold;	
 		width: 188px;

 	}
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#memcontrol{
 		margin: 0 atuo;
 		text-align: center;
 	}
 </style>
</head>
<body>

	<h1>회원 관리 페이지</h1>
	<div id ="memcontrol">
	<input type="submit" value="회원 목록" name="BookSearchButton"
		id="lookmemlist"
		onclick="location.href='manageMemberInfo.jsp?managerid=<%=managerid%>'">
	<br/>
	<input type="button" value="반납 신청 목록" name="MemberLoginButton"
		id="returnlist"
		onclick="location.href='managerLoanList.jsp?managerid=<%=managerid%>'">
	<br/>
	<input type="button" value="대출 Top 10 목록" name="MemberLoginButton"
		id="top10list"
		onclick="location.href='vipManager.jsp?managerid=<%=managerid%>'">
	</div>
</body>
</html>
