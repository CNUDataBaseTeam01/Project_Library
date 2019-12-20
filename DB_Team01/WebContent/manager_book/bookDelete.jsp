<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.sql.*"%>
<%
   Connection conn = null;
   PreparedStatement ps = null;
   ResultSet rs = null;

   String jdbUrl = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useSSL=false";
   //String jdbUrl = "jdbc:mysql://localhost:3306/jspdatabase";
   String dbId = "root";
   String dbPass = "1234";

   Class.forName("com.mysql.jdbc.Driver");
   try{
   conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
   
   }
   catch(Exception e){
      e.printStackTrace();
   }
   
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 : 도서 삭제 페이지</title>
<style type="text/css">
 
 	h1{
 		margin-bottom: 100px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	#delbtn{
 		margin-top: 30px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 10px;
 		font-weight: bold;
 		font-size: 16px;
 		text-align: center;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#managebtnset{
 		margin: 0 auto;
 		text-align: center;
 		
 	}
 	
 	#bookDeleteTable{
  		height: 100px;
 		width: 500px;
 		text-align: center;
	    margin: 0 auto;
        border: 2px solid black;
        border-collapse: collapse;
    }
 	
 	td{
  		border:2px solid black;
  		padding: 8px;
  		background-color: #e8e1eb;
  		border-collapse: collapse;
	}
	th{
  		border:2px solid black;
  		background-color: #997799;
  		padding: 8px;
  		border-collapse: collapse;
	}
		#inputdeletedTable{
 		text-align: center;
	    margin: 0 auto;
        border: 2px solid black;
        border-collapse: collapse;
	}
	
	.delete{
	     border-collapse: collapse;
	     border-right:none;
		 border-left:none;
		 border-top:none;
         border-bottom:none;
	}
	
 	p{
 		text-align: center;
 		margin-bottom: 50px;
 	}
 </style>
</head>
<script type="text/javascript">
  
  function secession(idx) {
   alert(idx+" 번을 선택하셨습니다.");
   change(idx);
  }
  
  function change(idx){
     var num = document.getElementById('number');
     var a = document.getElementById(idx);
     var bookname = document.getElementById('bookname');
     var bookauthor = document.getElementById('bookauthor');
     var bookpublisher = document.getElementById('bookpublisher');
     var isbn = document.getElementById('ISBN')
     num.value = a.parentElement.parentElement.childNodes[1].innerText;
     bookname.value = a.parentElement.parentElement.childNodes[3].innerText;
     bookauthor.value = a.parentElement.parentElement.childNodes[5].innerText;
     bookpublisher.value = a.parentElement.parentElement.childNodes[7].innerText;
     isbn.value = a.parentElement.parentElement.childNodes[9].innerText;
  }
</script>
<body>
	 <h1>도서 삭제하기</h1>
      <table id="bookDeleteTable">
         <tr>
            <th>번호</th>
            <th>도서 제목</th>
            <th>저자</th>
            <th>출판사</th>
            <th>ISBN</th>
         </tr>

         <%

   
   try {
   
         String sql = "select * from bookInfo";
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();
      int idx=1;
         while (rs.next()) {%>
         <tr>
            <td><button onclick="secession(<%=idx%>)" value="<%=idx%>" id ="<%=idx%>"><%=idx%></button></td>
            <td><%=rs.getString("title")%></td>
            <td><%=rs.getString("author")%></td>
            <td><%=rs.getString("publisher")%></td>
            <td><%=rs.getString("ISBN")%></td>
         </tr>
         <% 
         idx++;}
            
   
   } catch (SQLException e) {
      e.printStackTrace();
   }
      
     %>

      </table>
      <p>삭제 할 도서번호를 입력하고, 삭제 버튼을 눌러주세요.</p>
      <form method = "post" action ="./bookDeleteCheck.jsp">
      <table id="inputdeletedTable">
         <tr class="delete">
            <td class="delete">번호:</td>
            <td class="delete"><input type="text" id="number" name="number"
               size="10" disabled></td>
         </tr>
         <tr class="delete">
            <td class="delete">도서 제목:</td>
            <td class="delete"><input type="text" id="bookname"
               name="bookname" readonly></td>
         </tr>
         <tr class="delete">
            <td class="delete">도서 저자:</td>
            <td class="delete"><input type="text" id="bookauthor"
               name="bookauthor" readonly></td>
         </tr>
         <tr class="delete">
            <td class="delete">도서 출판사:</td>
            <td class="delete"><input type="text" id="bookpublisher"
               name="bookpublisher" readonly></td>
         </tr>
         <tr class="delete">
            <td class="delete">ISBN:</td>
            <td class="delete"><input type="text" id="ISBN" name="ISBN" readonly></td>
         </tr>
       <tr>
         <tr class="delete">
            <td class="delete" colspan="2"><input type = "submit" value = "도서삭제" id = "delete"/></td>
         </tr>
      </table>
      </form>
</body>
</html>