<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
String managerid = request.getParameter("managerid");
String memberid = request.getParameter("memberid");
System.out.println(memberid+" "+ managerid);
%>

<%
	String passwd = request.getParameter("memberPw");
	String name = request.getParameter("membername");
	String email = request.getParameter("memberEmail");
	String phone = request.getParameter("memberPH");
	String position = request.getParameter("memebersort");
	
	 System.out.println(passwd+", "+name+", "+email+", "+phone+", "+position+", "+memberid);
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
		
		String sql = "update member set memberpwd=?, membername=?, email=?, phonenum=?, position=? where memberid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,passwd);
		pstmt.setString(2,name);
		pstmt.setString(3,email);
		pstmt.setString(4,phone);
		pstmt.setString(5,position);
		pstmt.setString(6,memberid);
		pstmt.executeUpdate();
	
		String redirectUrl = "checkInfoDetail.jsp?managerid="+managerid+"-"+memberid;
		System.out.println("$$$$$$$$$$"+redirectUrl);
		response.sendRedirect(redirectUrl);
		
	}catch(Exception e){
		//e.printStackTrace();
		String redirectUrl = "checkInfoDetail.jsp?managerid="+managerid+"-"+memberid;
		//alert("정보 변경에 실패했습니다. "+redirectUrl);
		System.out.println("정보 변경 실패");
		response.sendRedirect(redirectUrl);
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>