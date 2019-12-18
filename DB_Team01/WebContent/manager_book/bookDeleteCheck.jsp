<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String bookname = request.getParameter("bookname");
	String bookauthor = request.getParameter("bookauthor");
	String bookpublisher = request.getParameter("bookpublisher");
	String ISBN = request.getParameter("ISBN");
	
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
		
		String sql = "select * from bookInfo where ISBN=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ISBN);
		rs = pstmt.executeQuery();

		
		if (rs.next()) {
		
			String rISBN = rs.getString("ISBN");
			String rBookname = rs.getString("title");
			String rBookpublisher= rs.getString("publisher");
			String rBookauthor = rs.getString("author");
		
			if (ISBN.equals(rISBN) && bookname.equals(rBookname)
					&& bookpublisher.equals(rBookpublisher)&& bookauthor.equals(rBookauthor)) {
				
				String sql2 = "select * from book where ISBN=?";
				PreparedStatement ps2 = conn.prepareStatement(sql2);
				ps2.setString(1, ISBN);
				ResultSet rs2 = ps2.executeQuery();
				boolean exist = false;
				
				while(rs2.next()){

					String sql3 = "select * from loan where booknum=?";
					PreparedStatement ps3 = conn.prepareStatement(sql3);
					ps3.setString(1, rs2.getString("booknum"));
					ResultSet rs3 = ps3.executeQuery();
					while(rs3.next()){
						if(!(rs3.getString("returnstate")).equals("done")){
							out.println("rs3.getString(returnstate): "+rs3.getString("returnstate"));
							exist= true;
							break;
						}
					}
					if(exist){
						break;
					}else{
						sql = "delete from book where booknum=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, rs2.getString("booknum"));
						pstmt.executeUpdate();
					}
				}
				
				if(!exist){
					sql = "delete from bookInfo where ISBN=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ISBN);
					pstmt.executeUpdate();
					%>
<script language=javascript> 
					 self.window.alert("도서를 삭제하였습니다.");
					 location.href="javascript:history.back()";
					 </script>
<%
				}else{
					%>
					<script language=javascript> 
					 self.window.alert("도서 삭제를 할 수 없습니다.\n에러: 대출 중인 도서가 있습니다.");
					 location.href="javascript:history.back()";
					 </script>
					 <% 
				}
	} else {
		%>
<script language=javascript> 
		 self.window.alert("도서 삭제를 할 수 없습니다.\n에러: 도서 정보가 틀렸습니다.");
		 location.href="javascript:history.back()";
		 </script>
<%
			}
		} else {
			%>
<script language=javascript> 
			 self.window.alert("도서 삭제를 할 수 없습니다.\n에러: 도서 정보가 틀렸습니다.");
			 location.href="javascript:history.back()";
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