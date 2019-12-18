<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
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
<meta charset="utf-8">
<title>������ : ���� ���� ������</title>
<link rel="stylesheet" href="../resource/css/bookmanage.css">
</head>
<script type="text/javascript">

  function secession(idx) {
System.out.println(idx+"�� Ŭ����!!");
  }
</script>
<body>
	<h1>���� �����ϱ�</h1>
		<table id="bookModifiedTable">
			<tr>
				<th>��ȣ</th>
				<th>���� ����</th>
				<th>����</th>
				<th>���ǻ�</th>
				<th>ISBN</th>
			</tr>

			<%

	
	try {
	
			String sql = "select * from bookInfo";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		int idx=1;
			while (rs.next()) {%>
			<tr>
				<td><button onclick="secession(<%=idx%>)" value="<%=idx%>"><%=idx%></button></td>
				<td><%=rs.getString("title")%></td>
				<td><%=rs.getString("author")%></td>
				<td><%=rs.getString("publisher")%></td>
				<td><%=rs.getString("ISBN")%></td>
			</tr>
			<% 
			idx++;}
				
	
	} catch (SQLException e) {
		e.printStackTrace();
	}
      
     %>

		</table>
		<p>������ ��ȣ�� �Է��ϰ�, ������ ������ �ּ���.</p>
		<table id="inputmodifedTable">
			<tr class="modi">
				<td class="modi">��ȣ:</td>
				<td class="modi"><input type="text" id="number" name="number"
					size="10"></td>
			</tr>
			<tr class="modi">
				<td class="modi">���� ����:</td>
				<td class="modi"><input type="text" id="bookname"
					name="bookname"></td>
			</tr>
			<tr class="modi">
				<td class="modi">���� ����:</td>
				<td class="modi"><input type="text" id="bookautor"
					name="bookautor"></td>
			</tr>
			<tr class="modi">
				<td class="modi">���� ���ǻ�:</td>
				<td class="modi"><input type="text" id="bookpublisher"
					name="bookpublisher"></td>
			</tr>
			<tr class="modi">
				<td class="modi">ISBN:</td>
				<td class="modi"><input type="text" id="ISBN" name="ISBN"></td>
			</tr>
			<tr class="modi">
				<td class="modi"></td>
				<td class="modi"><button id="modibutton">���� ����</button></td>
			</tr>
		</table>

</body>
</html>
