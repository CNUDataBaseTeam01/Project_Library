<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	String memberid = request.getParameter("memberid");
	String booknum = request.getParameter("booknum");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";

	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "select * from loan where memberid='" + memberid + "'&&returnstate!='done'&&booknum='" + booknum + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		if (rs.next()) {

			
			SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String time1 = format2.format(cal.getTime());
			
			
			sql = "update loan set returnstate = ?, returndate = ? where booknum = ? && memberid = ?&&returnstate != 'done'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "ask");
			pstmt.setString(2, time1);
			pstmt.setString(3, booknum);
			pstmt.setString(4, memberid);
			pstmt.executeUpdate();
						
%>
<script language=javascript>
	self.window.alert("대출 반납요청을 하였습니다.");
	location.href = "javascript:history.go(-2)";
</script>


<%
	} else {
%>
<script language=javascript>
	self.window.alert("대출반납을 할 수 없습니다.\n에러: 잠시후 다시 시도해주세요.");
	location.href = "javascript:history.back()";
</script>
<%
	}
	} catch (Exception e) {
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
