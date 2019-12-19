<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	String memberid = request.getParameter("memberid");
%>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
	//String jdbUrl = "jdbc:mysql://localhost:3306/jspdatabase";
	String dbId = "root";
	String dbPass = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

%>
<!DOCTYPE html>
<html>
<head>
<title>DB 01조 회원 도서 검색</title>
<meta charset="utf-8">
<link rel="stylesheet" href="mainTP.css" type="text/css">

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin-top: 30px;
}

td, th {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	/* border: 1px solid #444444; */
}
</style>

</head>
<body>
	<div>
		<h1 style="display: inline;">도서관 대여 프로그램</h1>
		<h2 style="display: inline;">도서검색결과</h2>
	</div>

	<div>
		<table>
			<thead>
				<tr>
					<th>도서제목</th>
					<th>ISBN</th>
					<th>저자</th>
					<th>출판사</th>
					<th>버튼</th>
				</tr>
			</thead>
			<tbody>
				<%

	
	try {
		String inputISBN = request.getParameter("inputISBN");
    	System.out.println(inputISBN);
			String sql = "select * from bookInfo where ISBN like '%"+inputISBN+"%'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {%>
				<tr>
				<%
						String ISBN = rs.getString("ISBN");
					%>
					<td><%=rs.getString("title")%></td>
					<td><%=rs.getString("ISBN")%></td>
					<td><%=rs.getString("author")%></td>
					<td><%=rs.getString("publisher")%></td>
					<td><button onclick="location.href = 'bookDetail.jsp?ISBN=<%=ISBN%>&memberid=<%=memberid%>'">상세정보</button></td>
				</tr>
				<% }
				
	
	} catch (SQLException e) {
		e.printStackTrace();
	}
      
     %>

			</tbody>

		</table>
	</div>


</body>
</html>