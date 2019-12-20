<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%
	String managerid = request.getParameter("managerid");
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
<title>DB 01조 회원 도서 검색</title>
<meta charset="utf-8">
<link rel="stylesheet" href="mainTP.css" type="text/css">

<style>
	table {
		width: 100%;
		border-top: 1px solid #444444;
		border-collapse: collapse;
		margin-top: 30px;
		padding: 10px;
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
 	
 	h1,h2{
 		margin-left: 15px;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 		padding-left: 10px;
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
	<div>
		<h1 style="display: inline;">도서관 대여 프로그램</h1>
		<br></br>
		<h2 style="display: inline;">회원 반납 신청 목록</h2>
	</div>

	<div>
		<table>
			<thead>
				<tr>
					<th>회원아이디</th>
					<th>도서제목</th>
					<th>ISBN</th>
					<th>저자</th>
					<th>출판사</th>
					<th>대출날짜</th>
					<th>반납예정날짜</th>
					<th></th>
					
				</tr>
			</thead>
			<tbody>
				
	
		<%try {
			/*  ing-> ask로 고치기 */
			String sql = "select loan.memberid as Id, book.booknum as BookNum, book.ISBN as ISBN, loan.loandate as loanDate, loan.returndate as returnDate, bookinfo.title as Title,"
					+" bookinfo.author as Author, bookinfo.publisher as Publisher"
					+" from loan inner join book using(booknum) inner join bookinfo using(ISBN) where loan.returnstate like 'ask'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {%>
				<tr>
					<td><%=rs.getString("Id")%></td>
					<td><%=rs.getString("Title")%></td>
					<td><%=rs.getString("ISBN")%></td>
					<td><%=rs.getString("Author")%></td>
					<td><%=rs.getString("Publisher")%></td>
					<td><%=rs.getString("loanDate").split("\\ ")[0]%></td>
					<td><%=rs.getString("returnDate").split("\\ ")[0]%></td>
					<td><button
							onclick="location.href = 'acceptReturn.jsp?booknum=<%=rs.getString("BookNum")%>&memberid=<%=rs.getString("Id")%>&managerid=<%=managerid %>&loandate=<%=rs.getString("loanDate")%>&idx=2'">반납승인</button></td>
				</tr>
			<%}
			
			}catch (SQLException e) {
				e.printStackTrace();
			}%>
			</tbody>

		</table>
	</div>


</body>
</html>