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
<link rel="stylesheet" href="mainTP.css" type="text/css">

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
	<div>
		<h1 style="display: inline;">������ �뿩 ���α׷�</h1>
		<h2 style="display: inline;">MyPage</h2>
		<br> <br>
	</div>


	<center>
		<div
			style="border: 1px solid; padding: 0px 50px 20px 50px; width: 60%; height: 180px; margin-bottom: 20px;">
			<h3>ȸ������</h3>
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
	</center>

	<center>
		<div>
			
			<button onclick="location.href = 'memberModifyForm.jsp?memberid=<%=memberid%>'"
				style="background: #cb99c5; border-radius: 10px;">ȸ����������</button>
			<button onclick="secession()"
				style="background: #cb99c5; border-radius: 10px;">Ż��</button>
		</div>
	</center>



</body>

</html>
