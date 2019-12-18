<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String id = request.getParameter("memberId");
	String passwd = request.getParameter("memberPw");
	String name = request.getParameter("membername");
	String email = request.getParameter("memberEmail");
	String phone = request.getParameter("memberPH");
	String position = request.getParameter("memebersort");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
		//String jdbUrl = "jdbc:mysql://localhost:3306/jspdatabase";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setString(4,email);
		pstmt.setString(5,phone);
		pstmt.setString(6,position);
		pstmt.setString(7,"libm");
		pstmt.executeUpdate();
	
		String redirectUrl = "member.jsp?idx=1";
		response.sendRedirect(redirectUrl);
		
	}catch(Exception e){
		e.printStackTrace();
	
		String redirectUrl = "member.jsp?idx=2";
		response.sendRedirect(redirectUrl);
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>