<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
        <title>
            DB 01조 Manage
        </title>
        <meta charset = "utf-8">
  <link rel="stylesheet" href = "../resource/css/manage.css" type="text/css">
  </head>
    <body>
 
        <% if (request.getParameter("error") != null) { %>
 			 <script language=javascript> 
 			 self.window.alert("로그인에 실패하였습니다."); 
 			 location.href="javascript:history.back()"; </script>

        <% }%>
        
        <h1> 관리자 로그인 화면입니다. </h1>
          <form action="manageCheck.jsp" method="post">
           <div id ="managerLogin">
           <table id="loginIn">
             <tr><th>id</th><td><input type="text" name ="managerId" id="managerId"/></td>
              <td rowspan="2"><input type ="submit" value ="Login" name = "Login" id ="ManagerLoginButton" /></td></tr>
             <tr><th>password</th><td><input type ="password" name ="managerPw" id="managerPw"></td></tr>
          </table>
          </div>
         </form>
    </body>
</html>