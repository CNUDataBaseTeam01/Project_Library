<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DB 01조 Manage</title>
<meta charset="utf-8">
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
 	
 	#memloginIn{
 		margin: 0 auto;
 		background-color: #e0bbb6;
 		padding: 35px;
 	}
 	
 	th{
 		text-align: left;
 	}
 	
 	#MemberLoginButton{
 		padding: 18px;
 		background-color: #9996a5;
 		font-weight: bold;
 		font-size: 15px;
 	}
 	
 	#memberJoinlink{
 		text-align: center;
 		font-weight: bold;
 	}
 	
 </style> 
</head>
<body>

	<%
        if (request.getParameter("idx") != null){
        int idx = Integer.parseInt(request.getParameter("idx"));
        switch(idx){
        case 0: %>
	<script language=javascript> 
			 self.window.alert("로그인에 실패하였습니다.");  </script>

	<%         	break;
        case 1: %>
        
		<script language=javascript> 
		 self.window.alert("회원가입에 성공하였습니다.");  </script>
		 

	<%         	break;
        case 2: %>
        		 <script language=javascript> 
		 self.window.alert("회원가입에 실패하였습니다.");  </script>

	<%         	break; 
        case 4: %>
        <script language=javascript>
        self.window.alert("수정이 완료되었습니다."); </script>
   
   <%	break;
        case 5: %>
        <script language=javascript>
        self.window.alert("수정에 실패하였습니다."); </script>
   
   <%	break;
	}
        }%>
	<h1>회원 로그인</h1>
	<form action="memberCheck.jsp" method="post">
		<div id="memberLogin">
			<table id="memloginIn">
				<tr>
					<th>Id</th>
					<td><input type="text" name="memberId" id="memberId" /></td>
					<td rowspan="2"><input type="submit" value="Login"
						name="MemberLoginButton" id="MemberLoginButton" /></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="memberPw" id="memberPw"></td>
				</tr>
			</table>
		</div>
	</form>
	<p id="memberJoinlink">
		회원이 아니신가요? <a href="JoinForm.jsp">회원가입 하러가기</a>
	</p>
</body>
</html>