<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("euc-kr");
%>

<%
   String bookname = request.getParameter("bookname");
   String bookauthor = request.getParameter("bookauthor");
   String bookpublisher = request.getParameter("bookpublisher");
   String ISBN = request.getParameter("ISBN");
   String bookcount = request.getParameter("bookcount");
   System.out.print(bookname+","+bookauthor+","+bookpublisher+","+ISBN);
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   ResultSet rs2 = null;
   String str = "";
   
   try{
      String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
      //String jdbUrl = "jdbc:mysql://localhost:3306/jspdatabase";
      String dbId = "root";
      String dbPass = "1234";
      
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
      String sql = "select title,author,publisher,ISBN from bookinfo where ISBN=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,ISBN);
      rs = pstmt.executeQuery();
   
      if(rs.next()){
         if(!(bookcount=="")){

            String sql3 ="select booknum, ISBN, SUBSTRING_INDEX(booknum,'-',- 1) AS idx from book where ISBN=? order by cast(idx as unsigned) DESC";
            pstmt = conn.prepareStatement(sql3);
            pstmt.setString(1,ISBN);
            rs2 = pstmt.executeQuery();
            int index=0;
            
            if(rs2.next()){
               String r2ISBN = rs2.getString("ISBN");
               String rbookcount = rs2.getString("booknum");
                index= Integer.parseInt(rs2.getString("idx"));
               
            }
            
            for(int count = 1; count<=Integer.parseInt(bookcount); count++){
               sql = "insert into book values(?,?,?)";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1,ISBN+"-"+(index+count));
               pstmt.setString(2,ISBN);
               pstmt.setString(3,"libm");
               pstmt.executeUpdate();
            }
            
         }
         
         String rISBN = rs.getString("ISBN");
         String rBookname = rs.getString("title");
         String rBookpublisher= rs.getString("publisher");
         String rBookauthor = rs.getString("author");   
         
         String sql2 = "update bookinfo set title=?, author=?, publisher=? where ISBN=?";
         pstmt = conn.prepareStatement(sql2);
         pstmt.setString(1,bookname);
         pstmt.setString(2,bookauthor);
         pstmt.setString(3,bookpublisher);
         pstmt.setString(4,rISBN);
         pstmt.executeUpdate();
         
         
      %>
         <script language=javascript> 
          self.window.alert("수정이 완료되었습니다.");
          location.href="javascript:history.back()";
         </script>
      <%
      }
      else{
      %>
         <script language=javascript> 
          self.window.alert("수정이 실패했습니다.");
          location.href="javascript:history.back()";
         </script>
      <%
      }
      
                     
   }catch(Exception e){
      e.printStackTrace();
   
   }finally{
      if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
      if(conn != null)try{conn.close();}catch(SQLException sqle){}
   }
%>