<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	String ISBN = request.getParameter("ISBN");

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String str = "";
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
<meta charset="EUC-KR">
<title>DB 01�� ȸ�� ���� �˻�</title>
<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin-top: 10px;
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
		<h1 style="display: inline;">������ �뿩 ���α׷�</h1>
		<h2 style="display: inline;">���� ������</h2>
		<br> <br>
	</div>

	<div
		style="border: 1px solid; padding: 30px 50px 20px 50px; height: 120px">
		<div style="float: left; margin-right: 30px;">
			<img src="images/book_icon.png" alt="book image" style="">
		</div>
		<div style="width: 70%; float: left;">
			<%
			try {
				String sql = "select * from bookInfo where ISBN=?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, ISBN);
					rs = ps.executeQuery();

					if (rs.next()) {
			%>

			��������: <%=rs.getString("title")%><br> 
			ISBN: <%=rs.getString("ISBN")%><br> 
			����: <%=rs.getString("author")%><br> 
			���ǻ�: <%=rs.getString("publisher")%>

				<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

		</div>
	</div>

	<div>
		<table>
			<tr>
				<th>������ȣ</th>
				<th>��������</th>
				<th>������</th>
				<th>���Ⱑ�ɳ�¥</th>
				<th>��ư</th>
			</tr>
			<%
					try {
						String sql = "select * from book where ISBN="+ISBN;
						ps = conn.prepareStatement(sql);
						rs = ps.executeQuery();

						while (rs.next()) {
				%>
				<tr>
					<td><%=ISBN%></td>
					<td><%=rs.getString("title")%></td>
					<td><%=rs.getString("author")%></td>
					<td><%=rs.getString("publisher")%></td>
					<td><button
							onclick="location.href = 'bookDetailManage.jsp?ISBN=<%=ISBN%>'">������</button></td>
				</tr>
				<%
					}

					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>
			<tr>
				<td>001</td>
				<td>���Ⱑ��</td>
				<td>0��</td>
				<td>2019.11.30</td>
				<td><button onclick='loan()'>����</button></td>
			</tr>
			<tr>
				<td>002</td>
				<td>������</td>
				<td>1��</td>
				<td>2020.03.01</td>
				<td><button onclick='reservation()'>����</button></td>
			</tr>
			
		
		</table>
	</div>
</body>
</html>