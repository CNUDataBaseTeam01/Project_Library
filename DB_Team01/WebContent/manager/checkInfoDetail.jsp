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
	
	String managerid = request.getParameter("managerid");
	String memberid = request.getParameter("memberid");
	System.out.println(memberid+" "+ managerid);
	
%>
<%!
	
%>
<!DOCTYPE html>
<html>
<head>
<title>DB 01조 회원 MyPage</title>
<meta charset="utf-8">
<style>
    
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#mameminfohead{
 		margin: 15px;
 	}
 	 
 	button{
 		border: 2px solid black;
 		background-color: #cb99c5;
 		padding: 5px;
 		font-weight: bold;
 		font-size: 16px;
 		text-align: center;
 		margin-right: 25px;
 		width: 130px;
 		border-radius: 10px;
 	} 
 	
 	#mameminfoborder{
 	 	border: 2px solid;
 	 	padding: 0px 50px 20px 50px;
 	 	width: 60%;
 	 	height: 180px;
 	 	margin-bottom: 20px;
 	 	text-align: center;
 	 	margin: 0 auto;
 	 	background-color:#f0daf0; 
 	}
 	
 	#memlookinfo{
 		text-align: left;
 		font-weight: bold;
 	}
 	
 	#mamembtnset{
 		text-align: center;
 		margin-top: 30px;
 	}
}
 	
</style>
</head>

<script type="text/javascript">
	function secession() {
		
		if (confirm("정말 탈퇴하시겠습니까 ?") == true) {
			//alert("탈퇴되었습니다");
			var memberid2 = "<%=memberid%>";
			var managerid2 = "<%=managerid%>";
			//document.write(memberid2);
			
			var redirectUrl = "memberdeletebyManager.jsp?managerid="+managerid2+"&memberid="+memberid2;
			location.href = redirectUrl;
		} else {
			return;
		}
	}
</script>
<body>
	<div id ="mameminfohead">
		<h1 style="display: inline;">도서관 대여 프로그램</h1>
		<br></br>
		<h2 style="display: inline;">회원 <%=memberid %>님의 상세 정보</h2>
		<br> <br>
	</div>
		<div id ="mameminfoborder">
			<h3>회원정보</h3>
			<div id ="memlookinfo">


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
	
		<div id="mamembtnset">
			<button
				onclick="location.href = 'manageMemberLoanList.jsp?memberid=<%=memberid%>&managerid=<%=managerid %>'">도서대출 목록</button>
			<button
				onclick="location.href = 'memberModifyFormbyManager.jsp?managerid=<%=managerid%>&memberid=<%=memberid%>'">회원정보수정</button>
			<button onclick="secession()">탈퇴</button>
		</div>

</body>

</html>
