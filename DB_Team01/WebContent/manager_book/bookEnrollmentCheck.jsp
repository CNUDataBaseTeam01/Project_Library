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
	String bookNum = request.getParameter("bookNum");
	
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
		
		String sql = "insert into bookInfo values(?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,ISBN);
		pstmt.setString(2,bookname);
		pstmt.setString(3,bookauthor);
		pstmt.setString(4,bookpublisher);
		pstmt.executeUpdate();
		
		for(int idx=1;idx<=Integer.parseInt(bookNum);idx++){
			sql = "insert into book values(?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,ISBN+"-"+idx);
			ps.setString(2,ISBN);
			ps.setString(3,"libm");
			ps.executeUpdate();
		}
		%>
			<script language=javascript> 
			 self.window.alert("도서를 등록하였습니다."); 
			 location.href="javascript:history.back()";
			 </script>
		<%
	}catch(Exception e){
		e.printStackTrace();
		%>
		<script language=javascript> 
		 self.window.alert("도서 등록에 실패하였습니다.");
		 location.href="javascript:history.back()";
		 </script>
	<%
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>