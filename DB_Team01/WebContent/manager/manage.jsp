<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
        <title>
            DB 01�� Manage
        </title>
        <meta charset = "utf-8">
  <style type="text/css">
 
 	h1{
 		margin-bottom: 80px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#loginIn{
 		margin: 0 auto;
 		background-color: #e0bbb6;
 		padding: 35px;
 	}
 	
 	th{
 		text-align: left;
 	}
 	
 	#ManagerLoginButton{
 		padding: 18px;
 		background-color: #9996a5;
 		font-weight: bold;
 		font-size: 15px;
 	}
 	
 </style> 
  </head>
  
    <body>
        <% if (request.getParameter("error") != null) { %>
 			 <script language=javascript> 
 			 self.window.alert("�α��ο� �����Ͽ����ϴ�."); 
 			 location.href="javascript:history.back()"; </script>

        <% }%>
        <h1> ������ �α��� </h1>
          <form action="manageCheck.jsp" method="post">
           <div id ="managerLogin">
           <table id="loginIn">
             <tr><th>Id</th><td><input type="text" name ="managerId" id="managerId"/></td>
              <td rowspan="2"><input type ="submit" value ="Login" name = "Login" id ="ManagerLoginButton" /></td></tr>
             <tr><th>Password</th><td><input type ="password" name ="managerPw" id="managerPw"></td></tr>
          </table>
          </div>
         </form>
    </body>
</html>