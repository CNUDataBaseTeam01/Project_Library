<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
			<img src="../images/book_icon.png" alt="book image" style="">
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
				<th>����</th>
			</tr>
				<%
				try {
					String sql = "select * from book where ISBN=" + ISBN;
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					
					SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
					Calendar cal = Calendar.getInstance();
					String time1 = format1.format(cal.getTime());

					while (rs.next()) {
						String booknum = rs.getString("booknum");
						String sql2 = "select * from loan where booknum='" + booknum+"'";
						
						PreparedStatement ps2 = conn.prepareStatement(sql2);
						ResultSet rs2 = ps2.executeQuery();
						boolean ing = false;
						int day=0;
						while(rs2.next()){
						
							if((rs2.getString("returnstate")).equals("done")){	}
							else{
								Date first = format1.parse(time1);
								Date second = format1.parse(rs2.getString("loandate"));
								
								long calDate = second.getTime() - first.getTime();
								long calDateDays = calDate / (24*60*60*1000);
								calDateDays = Math.abs(calDateDays);
								day = (int)calDateDays;
								
								String sql3="select * from member where memberid='" +rs2.getString("memberid")+"'";
								PreparedStatement ps3 = conn.prepareStatement(sql3);
								ResultSet rs3 = ps3.executeQuery();
								
								if(rs3.next()){
									String position = rs3.getString("position");
								
								switch(position){
								case "department":
									day = 10-day;
									break;
								case "postgraduate":
									day = 30-day;
									break;
								case "professor":
									day = 60-day;
									break;
									
								}
					
								}
								ing = true;
							
							}
						}
						
						
						if(!ing){
									
								%>
							<tr>
								<td><%=booknum%></td>
								<td>���Ⱑ��</td>
								<td>0��</td>
								<td><%=time1%></td>
								<td><button
										onclick="location.href = 'bookDetailDelete.jsp?booknum=<%=booknum%>'">����</button></td>
							</tr>
							<%
						}else{
							
							sql2 = "select * from reservation where booknum='" + booknum+"'";
							ps2 = conn.prepareStatement(sql2);
							rs2 = ps2.executeQuery();
							int count=0;
							while(rs2.next()){
								String sql3="select * from member where memberid='" +rs2.getString("memberid")+"'";
								PreparedStatement ps3 = conn.prepareStatement(sql3);
								ResultSet rs3 = ps3.executeQuery();
								
								if(rs3.next()){
									String position = rs3.getString("position");
									count = count+1;
									switch(position){
									case "department":
										day = day + 10;
										break;
									case "postgraduate":
										day = day + 30;
										break;
									case "professor":
										day = day + 60;
										break;
										
									}
								}
							}
							Calendar time2= cal;
							time2.add(Calendar.DAY_OF_MONTH,day);
							%>
							<tr>
								<td><%=booknum%></td>
								<td>������</td>
								<td><%=count%>��</td>
								<td><%=format1.format(time2.getTime())%></td>
								<td></td>
							</tr>
							<%
						}
		
				}

					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>			
		
		</table>
	</div>
</body>
</html>