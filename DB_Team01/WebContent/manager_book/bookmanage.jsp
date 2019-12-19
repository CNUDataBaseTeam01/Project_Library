<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>관리자 : 도서 관리 페이지</title>
 <style type="text/css">
 
 	h1{
 		margin-bottom: 100px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	button{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 25px;
 		font-size: 20px;
 		font-weight: bold;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#managebtnset{
 		margin: 0 auto;
 		text-align: center;
 		
 	}
 	
 </style>
  </head>
  <body>
    <h1>도서 관리 페이지</h1>
    <div id = managebtnset>
   	 <button onclick="location.href='bookEnrollment.jsp'">도서 등록 하러가기</button><br/>
   	 <button onclick ="location.href='bookModified.jsp'">도서 수정 하러가기</button><br/>
   	 <button onclick ="location.href ='bookDelete.jsp'">도서 삭제 하러가기</button><br/>
 	</div>
  </body>
</html>