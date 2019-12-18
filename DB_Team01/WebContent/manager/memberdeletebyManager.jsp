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
</head>
<body>

<%
try {
		String sql = "delete from member where memberid=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, memberid);
		ps.executeUpdate();
		
		String redirectUrl = "manageMemberInfo.jsp?managerid="+managerid;
		response.sendRedirect(redirectUrl);
		
} catch (SQLException e) {
	e.printStackTrace();
}

  
 %>
</body>
</html>