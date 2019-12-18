<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String booknum = request.getParameter("booknum");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";

	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
		//String jdbUrl = "jdbc:mysql://localhost:3306/jspdatabase";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "select * from book where booknum=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, booknum);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			
			String sql2 = "select count(*) as C from book where ISBN=?";
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, rs.getString("ISBN"));
			ResultSet rs2 = ps2.executeQuery();
			
			sql = "delete from book where booknum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rs.getString("booknum"));
			pstmt.executeUpdate();
			
			if(rs2.next()){
				if(Integer.parseInt(rs2.getString("C"))<2){
					
					sql = "delete from bookInfo where ISBN=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, rs.getString("ISBN"));
					pstmt.executeUpdate();
					%>
					<script language=javascript>
						self.window.alert("도서를 삭제하였습니다.");
						location.href = "ManagebookSearch.jsp?ISBN=<%=rs.getString("ISBN")%>";
					</script>
					<%
				}else{
					%>
					<script language=javascript>
						self.window.alert("도서를 삭제하였습니다.");
						location.href = "bookDetailManage.jsp?ISBN=<%=rs.getString("ISBN")%>";
					</script>
					<%
				}
				
			}else{
				%>
				<script language=javascript>
					self.window.alert("도서를 삭제하였습니다.");
					location.href = "bookDetailManage.jsp?ISBN=<%=rs.getString("ISBN")%>";
				</script>
				<%
			}

	} else {
%>
<script language=javascript>
	self.window.alert("도서 삭제를 할 수 없습니다.\n에러: 도서 정보가 틀렸습니다.");
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