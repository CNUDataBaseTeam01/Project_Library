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
    String memberid = request.getParameter("memberid");
	System.out.println(memberid);
	
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
		String forCheck = "select memberid from loan where returnstate not like '%done%' && memberid=?";
		ps = conn.prepareStatement(forCheck);
		ps.setString(1,memberid);
		rs = ps.executeQuery();
		if(rs.next()){
		%>
			<script>
			alert("반납을 완료하지 않은 대출 목록이 있습니다.");
			var redirectUrl = "memberInfo.jsp?memberid=<%=memberid%>";
			location.href=redirectUrl;
			</script>
		<%
		}else{	
			String sql = "delete from member where memberid=?";
		
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberid);
			ps.executeUpdate();
		
			String resultUrl = "../main.jsp";
			response.sendRedirect(resultUrl);
		
	}
	}catch (SQLException e) {
		e.printStackTrace();
	}%>
</body>
</html>