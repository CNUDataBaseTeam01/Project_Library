<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String id = request.getParameter("memberId");
	String pwd = request.getParameter("memberPw");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
		//String jdbUrl = "jdbc:mysql://localhost:3306/jspdatabase";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "select memberid, memberpwd from member where memberid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		

		if (rs.next()) {
			
			String memberid = rs.getString("memberid");
			String memberpwd = rs.getString("memberpwd");

			if(memberid.equals(id))System.out.println(memberid + ":" + id);
			if(memberpwd.equals(pwd))System.out.println(memberpwd + ":" + pwd);
			
	
			if (memberid.equals(id) && memberpwd.equals(pwd)) {
				String redirectUrl = "memberMain.jsp?memberid=" + memberid;
				response.sendRedirect(redirectUrl);
			} else {
				String redirectUrl = "member.jsp?idx=0";
				response.sendRedirect(redirectUrl);
			}
		} else {
			String redirectUrl = "member.jsp?idx=0";
			response.sendRedirect(redirectUrl);
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
