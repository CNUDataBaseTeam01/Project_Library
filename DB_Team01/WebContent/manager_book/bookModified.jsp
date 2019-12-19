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
   String ISBN = request.getParameter("ISBN");
   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 : 도서 수정 페이지</title>
<style type="text/css">
 
 	h1{
 		margin-bottom: 50px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	#mot{
 		margin-bottom: 20px;
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
 	
 	#bookModifiedTable{
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
	
	#inputmodifedTable{
 		text-align: center;
	    margin: 0 auto;
        border: 2px solid black;
        border-collapse: collapse;
	}
	
	.modi{
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
   <h1>도서 수정하기</h1>
      <table id="bookModifiedTable">
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
      <p>수정할 번호를 입력하고, 내용을 수정해 주세요.</p>
      <form method = "post" action ="./bookModifiedCheck.jsp?">
      <table id="inputmodifedTable">
         <tr class="modi">
            <td class="modi">번호:</td>
            <td class="modi"><input type="text" id="number" name="number"
               size="10" disabled></td>
         </tr>
         <tr class="modi">
            <td class="modi">도서 제목:</td>
            <td class="modi"><input type="text" id="bookname"
               name="bookname"></td>
         </tr>
         <tr class="modi">
            <td class="modi">도서 저자:</td>
            <td class="modi"><input type="text" id="bookauthor"
               name="bookauthor"></td>
         </tr>
         <tr class="modi">
            <td class="modi">도서 출판사:</td>
            <td class="modi"><input type="text" id="bookpublisher"
               name="bookpublisher"></td>
         </tr>
         <tr class="modi">
            <td class="modi">추가할 권수:</td>
            <td class="modi"><input type="text" id="bookcount" name="bookcount"></td>
         </tr>
         <tr class="modi">
            <td class="modi">ISBN:</td>
            <td class="modi"><input type="text" id="ISBN" name="ISBN" readonly></td>
         </tr>
       <tr>
         <tr class="modi">
            <td class="modi" colspan="2"><input type = "submit" value = "정보수정" id = "mot"/></td>
         </tr>
      </table>
      </form>
      <p style="color:red;">* 각 도서 삭제는 도서 세부사항에서 가능합니다.</p>
</body>
</html>