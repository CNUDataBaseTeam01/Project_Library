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
		
		System.out.println("1:"+memberid);
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		
		String sql = "select * from member where memberid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberid);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			System.out.println("2");
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
			System.out.println("3:"+position);
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
			SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String time1 = format2.format(cal.getTime());
			System.out.println("4:"+time1);
			Calendar time2= cal;
			time2.add(Calendar.DAY_OF_MONTH,day);
			System.out.println("5:"+format1.format(time2.getTime()));
			
			String sql2 = "insert into loan values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1,booknum);
			ps2.setString(2,memberid);
			ps2.setString(3,day+"");
			ps2.setString(4,time1);
			ps2.setString(5,format1.format(time2.getTime()));
			ps2.setString(6,"ing");
			ps2.executeUpdate();	
			System.out.println("6");
			%>
	<script language=javascript> 
			 self.window.alert("대출에 성공했습니다.\n대출기간: <%=time1.split(" ")[0]%>~<%=format1.format(time2.getTime())%>(<%=day%>일)");
			 location.href="javascript:history.go(-2)";
			 </script>
<%
		}else{
			%>
			<script language=javascript> 
					 self.window.alert("대출에 실패했습니다.");
					 location.href="javascript:history.back()";
					 </script>
			<%
		}
	
		
	} catch (Exception e) {
		%>
<script language=javascript> 
		 self.window.alert("대출에 실패했습니다.");
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