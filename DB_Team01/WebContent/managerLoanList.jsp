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
      <title>대출 이력 조회</title>
      <meta charset="utf-8">
       
    </head>
    
    
        <body>
          <h1>대출 이력 조회</h1>
          <h5><%=dateforPrint%> 부터 <%=endDateforPrint %>까지 대출 목록입니다.</h5>
      
      <form action="managerLoanList.jsp?managerid=<%=managerid %>" method="post">

          날짜입력 <input type="date" name="checkVIP" placeholder="날짜를 입력하세요">
           <input type="submit" name="check" value="확인"> <br><br>
      

            <table width = 80% border = 3 cellpadding = 10>
                <tr>
                    <th>회원명</th>
                    <th>회원아이디</th>
                    <th>회원이메일</th>
                    <th>전화번호</th>
                    <th>구분</th>
                    <th>대출횟수</th>
                </tr>
				<% 
            	try{
            		String sql = "select loan.memberid as Id, member.membername as Name, member.email as Email, member.phonenum as Tel, member.position as Position, loan.loandate as loanDate, count(loan.booknum) as loanNum from loan inner join member using(memberid) group by loan.memberid";

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
    						position = "학부";
    						break;
    					case "postgraduate":
    						position = "대학원";
    						break;
    					case "professor":
    						position = "교직원";
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
