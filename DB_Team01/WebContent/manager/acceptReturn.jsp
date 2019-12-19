<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%
Connection conn = null;
PreparedStatement ps = null;
PreparedStatement ps2 = null;
PreparedStatement ps3 = null;
ResultSet rs = null;

String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
String dbId = "root";
String dbPass = "1234";

Class.forName("com.mysql.jdbc.Driver");
Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
String today = sdf.format(now);
conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

String booknum = request.getParameter("booknum");
String memberid = request.getParameter("memberid");
String managerid = request.getParameter("managerid");

%>
<%
try{
	
	String sql = "update loan set returnstate='done', returndate='"+today+"' where memberid=? and booknum=?";
	System.out.println(sql);
	ps = conn.prepareStatement(sql);
	ps.setString(1, memberid);
	ps.setString(2, booknum);
	ps.executeUpdate();

	System.out.println(" select reserve");
	String forNext="select reservation.memberid as Id, member.position as Position from reservation inner join member using (memberid) where booknum=? order by reserDate limit 1";
	ps = conn.prepareStatement(forNext);
	ps.setString(1, booknum);
	rs = ps.executeQuery();

	if(rs.next()){
		System.out.println("into delete reservation");
		String next = "delete from reservation where booknum=? order by reserDate limit 1";	
		ps2 = conn.prepareStatement(next);
		ps2.setString(1, booknum);
		ps2.executeUpdate();
		System.out.println("into insert loan");
		String nextTo = "insert into loan value (?, ?, ?, ?, ?, ?)";
		
		String loanTerm ="";
		Date returnDate;
		String returnDatetoString;
		
		switch(rs.getString("Position")){
		case "department" :
			loanTerm = "10";
			break;
		case "postgraduate":
			loanTerm = "30";
			break;
		case "professor":
			loanTerm = "60";
			break;
		}
		returnDate = new Date(now.getTime()+ (long)(24*60*60*1000L*(Integer.parseInt(loanTerm)-1)));
		returnDatetoString = sdf.format(returnDate);
		
		ps3 = conn.prepareStatement(nextTo);
		ps3.setString(1, booknum);
		ps3.setString(2, rs.getString("Id"));
		ps3.setString(3, loanTerm);
		ps3.setString(4, today);
		ps3.setString(5, returnDatetoString);
		ps3.setString(6, "ing");
		ps3.executeUpdate();
		%>
		<script> 
		 alert("반납을 승인했습니다.");
		 var redirectUrl="managerLoanList.jsp?managerid=<%=managerid%>"; 
		 location.href=redirectUrl;
		 </script>
		 
		 <%}else{%>
			 <script> 
			 alert("반납을 승인했습니다.");
			 var redirectUrl="managerLoanList.jsp?managerid=<%=managerid%>"; 
			 location.href=redirectUrl;
			 </script>
		<% }
	
}catch(Exception e){
	e.printStackTrace();
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>