<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%

	String memberid = request.getParameter("memberid");
	String booknum = request.getParameter("booknum");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
		//String jdbUrl = "jdbc:mysql://localhost:3306/jspdatabase";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		
		String sql = "select * from member where memberid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberid);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			String position = rs.getString("position");
			int day=0;
			switch(position){
			case "department":
				day = 10;
				break;
			case "postgraduate":
				day = 30;
				break;
			case "professor":
				day = 60;
				break;
			}
			
			SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd@HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String time1 = format1.format(cal.getTime());
			
			String sql2 = "insert into reservation values(?, ?, ?)";
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1,time1);
			ps2.setString(2,booknum);
			ps2.setString(3,memberid);
			ps2.executeUpdate();	
			%>
<script language=javascript> 
			 self.window.alert("예약에 성공했습니다.");
			 location.href="javascript:history.go(-2)";
			 </script>
<%
		}else{
			%>
<script language=javascript> 
					 self.window.alert("예약에 실패했습니다.");
					 location.href="javascript:history.back()";
					 </script>
<%
		}
	
		
	} catch (Exception e) {
		%>
<script language=javascript> 
		 self.window.alert("이미 예약하신 책입니다.");
		 location.href="javascript:history.back()";
		 </script>
<%
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException sqle) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}
%>