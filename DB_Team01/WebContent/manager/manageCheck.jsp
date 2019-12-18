<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String id = request.getParameter("managerId");
	String pwd = request.getParameter("managerPw");

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

		String sql = "select managerid, managerpwd from manager where managerid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		

		if (rs.next()) {
			
			String managerid = rs.getString("managerid");
			String managerpwd = rs.getString("managerpwd");
			
			if (managerid.equals(id) && managerpwd.equals(pwd)) {
				String redirectUrl = "manageMain.jsp?managerid=" + managerid;
				response.sendRedirect(redirectUrl);
			} else {
				System.out.println("패스워드가 틀렸습니다.");
				String redirectUrl = "manage.jsp?error=login-failed..";
				response.sendRedirect(redirectUrl);
			}
		} else {
			System.out.println("아이디가 틀렸습니다.");
			String redirectUrl = "manage.jsp?error=login-failed..";
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
