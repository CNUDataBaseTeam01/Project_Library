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
	  <h1> ȸ������ ���� ȭ���Դϴ�. </h1>
       <form method="post" action="memberModifyProbyManager.jsp?managerid=<%=managerid%>-<%=memberid%>">
           <div id ="memberModify">
           <table id="memberModifyTable">
             <tr><th>id</th><td><%=memberid %></td></tr>
             <tr><th>password</th><td><input type ="password" name ="memberPw" maxlength = "12"></td></tr>
             <tr><th>����</th><td><input type ="text" name ="membername" maxlength = "12"></td></tr>
             <tr><th>E-mail</th><td><input type ="text" name ="memberEmail"></td></tr>
             <tr><th>��ȭ��ȣ</th><td><input type ="text" name ="memberPH"></td></tr>
             <tr><th>����</th>
                 <td id="sort"><select class="membersort" name="memebersort">
                   <option value="department">�к�</option>
                   <option value="postgraduate">���п�</option>
                   <option value="professor">������</option>
                 </select>
                 </td></tr>
          </table>
          <br/>	<input type="submit"  value="����"><br/>
          </div>
         </form>
</body>
</html>