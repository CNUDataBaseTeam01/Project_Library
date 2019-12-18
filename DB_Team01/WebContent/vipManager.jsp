<%@ page language="java" contentType="text/html; charset=EUC-KR" 
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
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
	String tempdate = request.getParameter("checkVIP");
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String startdate= tempdate==null?sdf.format(now).replaceAll("-",""):tempdate.replaceAll("-","");
	System.out.println(managerid);
	System.out.println(startdate);
	
	
%>
<!DOCTYPE html>
<html>
    <head>
      <title>���� �̷� Top 10 ȸ�� ��ȸ</title>
      <meta charset="utf-8">
       
    </head>
    
    
        <body>
          <h1>���� �̷� Top 10 ȸ�� ���</h1>
      
      <form action="vipManager.jsp?managerid=<%=managerid %>" method="post">

          ��¥�Է� <input type="date" name="checkVIP" placeholder="��¥�� �Է��ϼ���">
           <input type="submit" name="check" value="Ȯ��"> <br><br>
      

            <table width = 80% border = 3 cellpadding = 10>
                <tr>
                    <th>ȸ����</th>
                    <th>ȸ�����̵�</th>
                    <th>ȸ���̸���</th>
                    <th>��ȭ��ȣ</th>
                    <th>����</th>
                    <th>����Ƚ��</th>
                </tr>
				<% 
            	try{
            		String sql = "select loan.memberid as Id, member.membername as Name, member.email as Email, member.phonenum as Tel, member.position as Position, loan.loandate as loanDate, count(loan.booknum) as loanNum from loan inner join member using(memberid) group by loan.memberid asc limit 10";

        			ps = conn.prepareStatement(sql);
        			rs = ps.executeQuery();
        			
        			while(rs.next()){
        				String date = rs.getString("loanDate");
        				if(Integer.parseInt(date)>=Integer.parseInt(startdate)){
        					System.out.println(date);
        				
        				String position = null;
    					String getposition=rs.getString("Position");
    					
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
        					<td> <%=rs.getString("Id")%></td>
            				<td> <%=rs.getString("Name") %></td>
            				<td> <%=rs.getString("Email") %></td>
            				<td> <%=rs.getString("Tel") %></td>
            				<td> <%=position%></td>
            				<td> <%=rs.getString("loanNum") %></td>
            				</tr>
            		<%}
        			}
            	}catch(Exception e){
            	
            	}%>
            
            </table>
        </form>
    </body>
</html>
