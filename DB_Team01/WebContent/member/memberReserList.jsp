<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
					<th>�����ѳ�¥</th>
					<th>���Ⱑ�ɳ�¥</th>
					<th>�������ȣ</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%

	
	try {
			String sql = "select * from reservation where memberid='"+memberid+"'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				sql = "select * from book where booknum='"+rs.getString("booknum")+"'";
				ps = conn.prepareStatement(sql);
				ResultSet rs2 = ps.executeQuery();
				String timedate="";
				String time1="";
				String resertime=rs.getString("reserDate").split(" ")[0];
				
				if(rs2.next()){
					sql = "select * from bookInfo where ISBN='"+rs2.getString("ISBN")+"'";
					ps = conn.prepareStatement(sql);
					ResultSet rs3 = ps.executeQuery();
					if(rs3.next()){
						
						sql = "select * from reservation where booknum='"+rs2.getString("booknum")+"'";
						ps = conn.prepareStatement(sql);
						ResultSet rs4 = ps.executeQuery();
						int count = 0;
						int day = 0;
						
						while(rs4.next()){
							sql = "select * from member where memberid='"+rs4.getString("memberid")+"'";
							ps = conn.prepareStatement(sql);
							ResultSet rs5 = ps.executeQuery();
							
							
							if(rs5.next()){
								String position = rs5.getString("position");
								count++;
								if((rs4.getString("memberid")).equals(memberid)){
								break;	
								}else{
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
				
							
						}
						
						sql = "select * from loan where booknum='"+rs2.getString("booknum")+"'";
						ps = conn.prepareStatement(sql);
						rs4 = ps.executeQuery();
						
						if(rs4.next()){
							
							SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
							Calendar cal = Calendar.getInstance();
							
							time1 = rs4.getString("returndate");
							Date first = format1.parse(time1);
							cal.setTime(first);
							
							cal.add(Calendar.DAY_OF_MONTH,day);
							timedate=format1.format(cal.getTime());
						}
				
			
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
					<td><%=resertime%></td>
					<td><%=timedate%></td>
					<td><%=count%>��°</td>	
					<td><button onclick="location.href = 'memberReserCancel.jsp?booknum=<%=rs.getString("booknum")%>&memberid=<%=memberid%>'">�������</button></td>
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