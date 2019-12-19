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
<title>DB 01�� ȸ�� MyPage</title>
<meta charset="utf-8">
<style>
   
 	h1{
 		margin-left: 15px;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#meminfohead{
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
 		width: 110px;
 		border-radius: 10px;
 	} 
 	
 	#lookmeminfo{
 	 	border: 2px solid;
 	 	padding: 0px 50px 20px 50px;
 	 	width: 60%;
 	 	height: 180px;
 	 	margin-bottom: 20px;
 	 	text-align: center;
 	 	margin: 0 auto;
 	 	background-color:#f0daf0; 
 	}
 	
 	#memdetailinfo{
 		text-align: left;
 		font-weight: bold;
 	}
 	
 	#meminfobtnset{
 		text-align: center;
 		margin-top: 30px;
 	}
}
 	
</style>
</head>

<script type="text/javascript">
	function secession() {
		
		if (confirm("���� Ż���Ͻðڽ��ϱ� ?") == true) {
			alert("Ż��Ǿ����ϴ�");
			var memberid2 = "<%=memberid%>";
			//document.write(memberid2);
			
			var redirectUrl = "memberdelete.jsp?memberid="+memberid2;
			location.href = redirectUrl;
			//document.write(memberid);
			//alert("Ż��Ǿ����ϴ�");
			
		} else {
			return;
		}
	}
</script>

<body>
	<div id ="meminfohead">
		<h1 style="display: inline;">������ �뿩 ���α׷�</h1>
		<h2 style="display: inline;">MyPage</h2>
		<br> <br>
	</div>


	
		<div id="lookmeminfo">
		
			<h3>ȸ������</h3>
			<div id ="memdetailinfo">


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
			System.out.println("3"+position);
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
	

		<div id = "meminfobtnset">
			
			<button onclick="location.href = 'memberModifyForm.jsp?memberid=<%=memberid%>'">ȸ����������</button>
			<button onclick="secession()">Ż��</button>
		</div>



</body>

</html>
