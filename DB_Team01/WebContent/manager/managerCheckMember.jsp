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

	<h1>ȸ�� ���� ������</h1>
	<div id ="memcontrol">
	<input type="submit" value="ȸ�� ���" name="BookSearchButton"
		id="lookmemlist"
		onclick="location.href='manageMemberInfo.jsp?managerid=<%=managerid%>'">
	<br/>
	<input type="button" value="�ݳ� ��û ���" name="MemberLoginButton"
		id="returnlist"
		onclick="location.href='managerLoanList.jsp?managerid=<%=managerid%>'">
	<br/>
	<input type="button" value="���� Top 10 ���" name="MemberLoginButton"
		id="top10list"
		onclick="location.href='vipManager.jsp?managerid=<%=managerid%>'">
	</div>
</body>
</html>
