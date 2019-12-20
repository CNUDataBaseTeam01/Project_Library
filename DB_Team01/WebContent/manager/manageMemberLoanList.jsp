<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%
	String memberid = request.getParameter("memberid");
	String managerid = request.getParameter("managerid");
	System.out.println(managerid + " ^^ " + memberid);
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
 	
 	h1,h5{
 		margin-left: 15px;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 		padding-left: 10px;
 	}
 	
 	#inid{
 		padding-top: 10px;
 		text-align: center;
 	}
 	
 	#idsub{
 		border: 1px solid black;
 		background-color: #f2d7c6;
 		padding: 5px;
 		font-weight: bold;
 		text-align: center;
 	}
 	
 	#plzinputid{
 		 height:27px;
 	}
 	
}
 	
 </style> 

</head>
<body>
	<div>
		<h1 style="display: inline;">도서관 대여 프로그램</h1>
		<br></br>
		<h2 style="display: inline;">
			회원
			<%=memberid%>
			님의 대출 현황
		</h2>
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
					<th>반납날짜</th>
					<th>현재 상태</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
						String sql = "select loan.booknum as bookNum, loan.loanterm as Term, book.ISBN as ISBN, loan.loandate as loanDate, loan.returndate as returnDate, bookinfo.title as Title,"
								+ " bookinfo.author as Author, bookinfo.publisher as Publisher, loan.returnstate as State"
								+ " from loan inner join book using(booknum) inner join bookinfo using(ISBN) where loan.memberid=?";
						ps = conn.prepareStatement(sql);
						ps.setString(1, memberid);
						rs = ps.executeQuery();

						while (rs.next()) {

							SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

							Date first = format1.parse(rs.getString("loandate").split("\\ ")[0]);
							Date second = format1.parse(rs.getString("returndate").split("\\ ")[0]);

							long calDate2 = first.getTime() - second.getTime();
							long calDateDays2 = calDate2 / (24 * 60 * 60 * 1000);
							calDateDays2 = Math.abs(calDateDays2);
							int day = (int) calDateDays2;

							String state = rs.getString("State");
							switch (state) {
							case "ing":
								state = "대출 중";
								break;
							case "ask":
								state = "반납 승인 대기";
								break;
							case "done":
								state = "반납 완료";
								break;
							}
				%>
				<tr>
					<td><%=rs.getString("bookNum")%></td>
					<td><%=rs.getString("Title")%></td>
					<td><%=rs.getString("ISBN")%></td>
					<td><%=rs.getString("Author")%></td>
					<td><%=rs.getString("Publisher")%></td>
					<td><%=day+1%>일</td>
					<td><%=rs.getString("loanDate").split("\\ ")[0]%></td>
					<td><%=rs.getString("returnDate").split("\\ ")[0]%></td>
					<td><%=state%></td>
					<%
						if (state.equals("반납 승인 대기")) {
					%>
					<td>
						<button
							onclick="location.href = 'acceptReturn.jsp?booknum=<%=rs.getString("bookNum")%>&memberid=<%=memberid%>&manangerid=<%=managerid %>&loandate=<%=rs.getString("loanDate")%>&idx=1'">반납승인</button>
					</td>
					<%
						}
					%>


				</tr>
				<%
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