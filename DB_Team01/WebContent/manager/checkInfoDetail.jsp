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
<title>DB 01�� ȸ�� MyPage</title>
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
		
		if (confirm("���� Ż���Ͻðڽ��ϱ� ?") == true) {
			//alert("Ż��Ǿ����ϴ�");
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
		<h1 style="display: inline;">������ �뿩 ���α׷�</h1>
		<br></br>
		<h2 style="display: inline;">ȸ�� <%=memberid %>���� �� ����</h2>
		<br> <br>
	</div>
		<div id ="mameminfoborder">
			<h3>ȸ������</h3>
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
						position = "�к�";
						break;
					case "postgraduate":
						position = "���п�";
						break;
					case "professor":
						position = "������";
						break;
					}
		%>
						ȸ�� ���̵�:
						<%=rs.getString("memberid")%><br> ����:
						<%=rs.getString("membername")%><br> �̸���:
						<%=rs.getString("email")%><br> ��ȭ��ȣ:
						<%=rs.getString("phonenum")%><br> ����:
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
				onclick="location.href = 'manageMemberLoanList.jsp?memberid=<%=memberid%>&managerid=<%=managerid %>'">�������� ���</button>
			<button
				onclick="location.href = 'memberModifyFormbyManager.jsp?managerid=<%=managerid%>&memberid=<%=memberid%>'">ȸ����������</button>
			<button onclick="secession()">Ż��</button>
		</div>

</body>

</html>
