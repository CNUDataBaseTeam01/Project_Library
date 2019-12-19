<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<title>DB 01�� ȸ�� ���� �˻�</title>
<meta charset="utf-8">
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
 	
 	#nowstathead{
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
	<div id="nowstathead">
		<h1 style="display: inline;">������ �뿩 ���α׷�</h1>
		<h2 style="display: inline;">ȸ��������</h2>
	</div>

	<div>
		<table>
			<thead>
				<tr>
					<th>������ȣ</th>
					<th>��������</th>
					<th>ISBN</th>
					<th>����</th>
					<th>���ǻ�</th>
					<th>����Ⱓ</th>
					<th>���⳯¥</th>
					<th>�ݳ�������¥</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					try {

						int day = 0;

						String sql = "select * from loan where memberid='" + memberid + "'&&returnstate!='done'";
						ps = conn.prepareStatement(sql);
						rs = ps.executeQuery();

						while (rs.next()) {

							sql = "select * from book where booknum='" + rs.getString("booknum") + "'";
							ps = conn.prepareStatement(sql);
							ResultSet rs2 = ps.executeQuery();


							if (rs2.next()) {
								sql = "select * from bookInfo where ISBN='" + rs2.getString("ISBN") + "'";
								ps = conn.prepareStatement(sql);
								ResultSet rs3 = ps.executeQuery();
								if (rs3.next()) {
				%>
				<tr>
					<%
						String ISBN = rs2.getString("ISBN");
					%>
					<td><%=rs.getString("booknum")%></td>
					<td><%=rs3.getString("title")%></td>
					<td><%=rs3.getString("ISBN")%></td>
					<td><%=rs3.getString("author")%></td>
					<td><%=rs3.getString("publisher")%></td>
					<td><%=rs.getString("loanterm")%>��</td>
					<td><%=rs.getString("loandate").split("\\ ")[0]%></td>
					<td><%=rs.getString("returndate").split("\\ ")[0]%></td>
					<%
						if ((rs.getString("returnstate")).equals("ing")) {
					%>
					<td><button
							onclick="location.href = 'memberLoanReturnAsk.jsp?booknum=<%=rs.getString("booknum")%>&memberid=<%=memberid%>'">�ݳ�</button></td>
					<%
						} else {
					%>
					<td>�ݳ���û��</td>
					<%
						}
					%>
				</tr>
				<%
					}
							}
						}

					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>

			</tbody>

		</table>
	</div>


</body>
</html>