<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DB 01조 Manage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resource/css/manage.css" type="text/css">
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
	<h1>회원 로그인 화면입니다.</h1>
	<form action="memberCheck.jsp" method="post">
		<div id="memberLogin">
			<table id="loginIn">
				<tr>
					<th>id</th>
					<td><input type="text" name="memberId" id="memberId" /></td>
					<td rowspan="2"><input type="submit" value="Login"
						name="MemberLoginButton" id="MemberLoginButton" /></td>
				</tr>
				<tr>
					<th>password</th>
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