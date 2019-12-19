<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	String memberid = request.getParameter("memberid");
System.out.println(memberid);
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

	td{
		border-bottom: 1px solid #444444;
		padding: 10px;
		text-align: center;
	/* border: 1px solid #444444; */
	}

	th {
		border-bottom: 1px solid #444444;
		padding: 10px;
		text-align: center;
		background-color: #f2ccc7;
	/* border: 1px solid #444444; */
	}
 	
 	h1{
 		margin-left: 15px;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#searchlist{
 		margin: 15px;
 	}
 	 
 	button{
 		border: 2px solid black;
 		background-color: #f2d7c6;
 		padding: 5px;
 		font-weight: bold;
 		font-size: 16px;
 		text-align: center;
 	} 
}
 	
</style>

</head>
<body>
	<div id ="searchlist">
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
		String inputTitle = request.getParameter("inputTitle");
    
			String sql = "select * from bookInfo where title like '%"+inputTitle+"%'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				System.out.println(rs.getString("ISBN"));
			%>
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