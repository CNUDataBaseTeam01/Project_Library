<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            DB 01조 Main
        </title>
        <meta charset = "utf-8">
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
 	
 	#mainbtn{
 		margin: 0 auto;
 		text-align: center;
 		
 	}
 	
 </style>
  </head>
    <body>
        <div>
        <h1> 도서관 대여 프로그램 </h1>
        <div id = "mainbtn">
          <p><button onclick = "location.href='./manager/manage.jsp'">관리자 화면</button></p><br/>
          <p><button onclick = "location.href = './member/member.jsp'">사용자 화면</button></p>
        </div>
        </div>
    </body>
</html>
