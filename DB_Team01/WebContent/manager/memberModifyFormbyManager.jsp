<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
    <%
    Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPass = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	try{
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);	
	}
	catch(Exception e){
		e.printStackTrace();
	}
	String managerid = request.getParameter("managerid");
	String memberid = request.getParameter("memberid");
	System.out.println(memberid+" "+ managerid);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
 
 	h1{
 		margin-bottom: 50px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	#mamemmodisubbtn{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 10px;
 		font-weight: bold;
 		font-size: 16px;
 		text-align: center;
 		width: 100px;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#tocentermodi{
 		margin: 0 auto;
 		text-align: center;
 	}
 	
 	#memberModifyTable{
  		height: 100px;
 		width: 500px;
 		text-align: center;
	    margin: 0 auto;
        border: 2px solid black;
        border-collapse: collapse;
    }
 	
 	td{
  		border:2px solid black;
  		padding: 8px;
  		background-color: #e8e1eb;
  		border-collapse: collapse;
	}
	th{
  		border:2px solid black;
  		background-color: #997799;
  		padding: 8px;
  		border-collapse: collapse;
	}
	
	
 </style>
</head>
<body>
	  <h1> <%=memberid %>님 회원정보 변경 화면입니다. </h1>
       <form method="post" action="memberModifyProbyManager.jsp?managerid=<%=managerid%>&memberid=<%=memberid%>">
           <div id ="memberModify">
           <table id="memberModifyTable">
             <tr><th>id</th><td><%=memberid %></td></tr>
             <tr><th>password</th><td><input type ="password" name ="memberPw" maxlength = "12"></td></tr>
             <tr><th>성명</th><td><input type ="text" name ="membername" maxlength = "12"></td></tr>
             <tr><th>E-mail</th><td><input type ="text" name ="memberEmail"></td></tr>
             <tr><th>전화번호</th><td><input type ="text" name ="memberPH"></td></tr>
             <tr><th>구분</th>
                 <td id="sort"><select class="membersort" name="memebersort">
                   <option value="department">학부</option>
                   <option value="postgraduate">대학원</option>
                   <option value="professor">교직원</option>
                 </select>
                 </td></tr>
          </table>
          <br/>
          	<div id ="tocentermodi">
          	<input type="submit"  value="수정" id="mamemmodisubbtn"><br/>
          	</div>
          </div>
         </form>
</body>
</html>