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
<title>관리자 : 도서 수정 페이지</title>
<link rel="stylesheet" href="resource/css/bookmanage.css">
</head>
<script type="text/javascript">

  function secession(idx) {
System.out.println(idx+"행 클릭함!!");
  }
</script>
<body>
	<h1>도서 수정하기</h1>
		<table id="bookModifiedTable">
			<tr>
				<th>번호</th>
				<th>도서 제목</th>
				<th>저자</th>
				<th>출판사</th>
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
		<p>수정할 번호를 입력하고, 내용을 수정해 주세요.</p>
		<table id="inputmodifedTable">
			<tr class="modi">
				<td class="modi">번호:</td>
				<td class="modi"><input type="text" id="number" name="number"
					size="10"></td>
			</tr>
			<tr class="modi">
				<td class="modi">도서 제목:</td>
				<td class="modi"><input type="text" id="bookname"
					name="bookname"></td>
			</tr>
			<tr class="modi">
				<td class="modi">도서 저자:</td>
				<td class="modi"><input type="text" id="bookautor"
					name="bookautor"></td>
			</tr>
			<tr class="modi">
				<td class="modi">도서 출판사:</td>
				<td class="modi"><input type="text" id="bookpublisher"
					name="bookpublisher"></td>
			</tr>
			<tr class="modi">
				<td class="modi">ISBN:</td>
				<td class="modi"><input type="text" id="ISBN" name="ISBN"></td>
			</tr>
			<tr class="modi">
				<td class="modi"></td>
				<td class="modi"><button id="modibutton">정보 수정</button></td>
			</tr>
		</table>

</body>
</html>
