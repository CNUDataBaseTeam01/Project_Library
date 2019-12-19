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
	
	String dateforPrint = tempdate==null?sdf.format(now):tempdate;
	String endDateforPrint = sdf.format(now);
	
	
%>
<!DOCTYPE html>
<html>
    <head>
      <title>���� �̷� Top 10 ȸ�� ��ȸ</title>
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
 	
 	#indate{
 		padding-top: 10px;
 		text-align: center;
 	}
 	
 	#datesub{
 		border: 1px solid black;
 		background-color: #f2d7c6;
 		padding: 5px;
 		font-weight: bold;
 		text-align: center;
 	}
 	
 	#plzinputdate{
 		 height:27px;
 	}
 	
}
 	
 </style> 
       
       
       
    </head>
    
    
        <body>
          <h1>���� �̷� Top 10 ȸ�� ���</h1>
          <h5><%=dateforPrint%> ���� <%=endDateforPrint %>���� ���� ����Դϴ�.</h5>
          
      
      <form action="vipManager.jsp?managerid=<%=managerid %>" method="post">
		<div id ="indate">
           	��¥�Է� <input type="date" name="checkVIP" placeholder="��¥�� �Է��ϼ���" id="plzinputdate">
           <input type="submit" name="check" value="Ȯ��" id="datesub"> <br><br>
        </div>

            <table>
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
            		String sql = "select loan.memberid as Id, member.membername as Name, member.email as Email, member.phonenum as Tel,"
            				+" member.position as Position, loan.loandate as loanDate, count(loan.booknum) as loanNum"
            				+" from loan inner join member using(memberid) group by loan.memberid order by loanNum desc limit 10";

        			ps = conn.prepareStatement(sql);
        			rs = ps.executeQuery();
        			
        			while(rs.next()){
        				String date = rs.getString("loanDate").split("\\ ")[0].replaceAll("-","");
        				System.out.println("date : "+date);
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
            				<td> <%=rs.getString("Name") %></td>
            				<td> <%=rs.getString("Id")%></td>
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
