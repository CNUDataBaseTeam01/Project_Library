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
	System.out.println("%%"+ managerid);
	String memberid = managerid.split("\\-")[1];
	managerid = managerid.split("\\-")[0];
	System.out.println(memberid+" "+ managerid);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	  <h1> 회원정보 변경 화면입니다. </h1>
       <form method="post" action="memberModifyProbyManager.jsp?managerid=<%=managerid%>-<%=memberid%>">
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
          <br/>	<input type="submit"  value="수정"><br/>
          </div>
         </form>
</body>
</html>