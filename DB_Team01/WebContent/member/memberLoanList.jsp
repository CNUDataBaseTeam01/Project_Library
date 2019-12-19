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
		<h2 style="display: inline;">회원대출목록</h2>
	</div>

	<div>
		<table>
			<thead>
				<tr>
					<th>도서번호</th>
					<th>도서제목</th>
					<th>ISBN</th>
					<th>저자</th>
					<th>출판사</th>
					<th>대출기간</th>
					<th>대출날짜</th>
					<th>반납예정날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
						String sql = "select * from member where memberid='" + memberid + "'";
						ps = conn.prepareStatement(sql);
						rs = ps.executeQuery();
						int day = 0;
						
						if (rs.next()) {
							String position = rs.getString("position");

							switch (position) {
							case "department":
								day = 10;
								break;
							case "postgraduate":
								day = 30;
								break;
							case "professor":
								day = 60;
								break;
							}
						}
						
						sql = "select * from loan where memberid='" + memberid + "'&&returnstate!='done'";
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
					<td><%=day%>일</td>
					<td><%=rs.getString("loandate")%></td>
					<td><%=rs.getString("returndate")%></td>
					<%
						if ((rs.getString("returnstate")).equals("ing")) {
					%>
					<td><button
							onclick="location.href = '../member_book/bookDetail.jsp?ISBN=<%=ISBN%>&memberid=<%=memberid%>'">반납</button></td>
					<%
						} else {
					%>
					<td>반납요청중</td>
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