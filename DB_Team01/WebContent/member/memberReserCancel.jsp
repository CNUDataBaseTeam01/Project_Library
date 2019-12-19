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

		String sql = "select * from reservation where memberid='" + memberid + "'&&booknum='" + booknum + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		if (rs.next()) {

			sql = "delete from reservation where memberid='" + memberid + "'&&booknum='" + booknum + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
%>
<script language=javascript>
	self.window.alert("예약을 취소하였습니다.");
	location.href = "javascript:history.go(-2)";
</script>


<%
	} else {
%>
<script language=javascript>
	self.window.alert("예약을 취소 할 수 없습니다.\n에러: 잠시후 다시 시도해주세요.");
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