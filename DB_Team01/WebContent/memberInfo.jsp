<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPass = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	try{
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);	
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	
	String memberid = request.getParameter("memberid");
	System.out.println(memberid+" in infoForm");
	
%>
<%!
	
%>
<!DOCTYPE html>
<html>
<head>
<title>DB 01조 회원 MyPage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="mainTP.css" type="text/css">

</head>

<script type="text/javascript">
	function secession() {
		
		if (confirm("정말 탈퇴하시겠습니까 ?") == true) {
			alert("탈퇴되었습니다");
			var memberid2 = "<%=memberid%>";
			//document.write(memberid2);
			
			var redirectUrl = "memberdelete.jsp?memberid="+memberid2;
			location.href = redirectUrl;
			//document.write(memberid);
			//alert("탈퇴되었습니다");
			
		} else {
			return;
		}
	}
</script>

<body>
	<div>
		<h1 style="display: inline;">도서관 대여 프로그램</h1>
		<h2 style="display: inline;">MyPage</h2>
		<br> <br>
	</div>


	<center>
		<div
			style="border: 1px solid; padding: 0px 50px 20px 50px; width: 60%; height: 180px; margin-bottom: 20px;">
			<h3>회원정보</h3>
			<div style="text-align: left; width: 50%;">


				<%

	
	try {
		System.out.println("1");
		
			String sql = "select * from member where memberid=?";
			System.out.println(sql.replace('?',' ')+memberid);
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, memberid);
			rs = ps.executeQuery();
			if(rs.next()){
			
			System.out.println("2");
			String position = null;
			String getposition=rs.getString("position");
			
			switch(getposition){
			case "department":
				position = "학부";
				break;
			case "postgraduate":
				position = "대학원";
				break;
			case "professor":
				position = "교직원";
				break;
			}
			System.out.println("3"+position);
%>
				회원 아이디:
				<%=rs.getString("memberid")%><br> 성명:
				<%=rs.getString("membername")%><br> 이메일:
				<%=rs.getString("email")%><br> 전화번호:
				<%=rs.getString("phonenum")%><br> 구분:
				<%=position%>
				<% 
			}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
      
     %>
			</div>
		</div>
	</center>

	<center>
		<div>
			<button onclick="location.href = 'memberLoanList.jsp?memberid=<%=memberid%>'"
				style="background: #cb99c5; border-radius: 10px;">도서대출 목록</button>
			<button onclick="location.href = ''memberResList.jsp?memberid=<%=memberid%>'"
				style="background: #cb99c5; border-radius: 10px;">도서예약 현황</button>
			<button onclick="location.href = 'memberModifyForm.jsp?memberid=<%=memberid%>'"
				style="background: #cb99c5; border-radius: 10px;">회원정보수정</button>
			<button onclick="secession()"
				style="background: #cb99c5; border-radius: 10px;">탈퇴</button>
		</div>
	</center>



</body>

</html>
