<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%
	String memberid = request.getParameter("memberid");
	String managerid = request.getParameter("managerid");
	System.out.println(managerid+" ^^ "+ memberid);

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
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(now);
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
		<br></br>
		<h2 style="display: inline;">ȸ�� <%=memberid %> ���� ���� ��Ȳ</h2>
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
					<th>���� ����</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
	
	try {
			String sql = "select loan.booknum as bookNum, loan.loanterm as Term, book.ISBN as ISBN, loan.loandate as loanDate, loan.returndate as returnDate, bookinfo.title as Title,"
					+" bookinfo.author as Author, bookinfo.publisher as Publisher, loan.returnstate as State"
					+" from loan inner join book using(booknum) inner join bookinfo using(ISBN) where loan.memberid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,memberid);
			rs = ps.executeQuery();
			while (rs.next()) {
			
			String state = rs.getString("State");
			switch(state){
			case "ing" :
				state = "���� ��";
				break;
			case "ask":
				state = "�ݳ� ���� ���";
				break;
			case "done":
				state="�ݳ� �Ϸ�";
				break;
			}
			%>
				<tr>
					<td><%=rs.getString("bookNum")%></td>
					<td><%=rs.getString("Title")%></td>
					<td><%=rs.getString("ISBN")%></td>
					<td><%=rs.getString("Author")%></td>
					<td><%=rs.getString("Publisher")%></td>
					<td><%=rs.getString("Term")%></td>
					<td><%=rs.getString("loanDate").split("\\ ")[0]%></td>
					<td><%=rs.getString("returnDate").split("\\ ")[0]%></td>
					<td><%=state %></td>
					<%if(state.equals("�ݳ� ���� ���")){ %>
					<td>
					<button
							onclick="location.href = 'acceptReturn.jsp?ISBN=<%=rs.getString("ISBN")%>&memberid=<%=memberid%>'">�ݳ�����</button>
						</td>
					<%}%>
				
					
				</tr>
				<% 
				}
				
			}catch (SQLException e) {
				e.printStackTrace();
			}
		     %>
			</tbody>

		</table>
	</div>


</body>
</html>