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
	System.out.println(managerid);
	
%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ�� ���</title>
<meta charset="utf-8">

</head>
<body>
	<h1>ȸ�� ��� ��ȸ</h1>

	<form action="manageMemberInfo.jsp?managerid=<%=managerid %>" method="post">

		���̵� �Է� <input type="text" name="memberid" placeholder="���̵� �Է��ϼ���">
		<input type="submit" name="check" value="Ȯ��"> <br> <br>

		<table width=80% border=3 cellpadding=10>
			<tr>
				<th>ȸ����</th>
				<th>ȸ�����̵�</th>
				<th>��й�ȣ</th>
				<th>ȸ���̸���</th>
				<th>��ȭ��ȣ</th>
				<th>����</th>
			</tr>
			<% 
            	try{
            		String sql = "select memberid,memberpwd, membername, email, phonenum, position from member";
            		
            		if(memberid!=null){
            			sql = sql+" where memberid=?";
            			ps = conn.prepareStatement(sql);
            			ps.setString(1,memberid);
            		}else{
            			ps = conn.prepareStatement(sql);
            		}
        			rs = ps.executeQuery();
        			
        			while(rs.next()){
        				
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
    					}%>
			<tr>
				<td><%=rs.getString("membername") %></td>
				<td onclick="location.href='checkInfoDetail.jsp?managerid=<%=managerid%>-<%=rs.getString("memberid")%>'"><%=rs.getString("memberid")%></td>
				<td><%=rs.getString("memberpwd") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("phonenum") %></td>
				<td><%=position%></td>
			</tr>
			<%
        			}
            	}catch(Exception e){
            	
            	}%>

		</table>
	</form>
</body>
</html>
