<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DB 01�� Manage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="../resource/css/manage.css" type="text/css">
</head>
<body>

	<%
        if (request.getParameter("idx") != null){
        int idx = Integer.parseInt(request.getParameter("idx"));
        switch(idx){
        case 0: %>
	<script language=javascript> 
			 self.window.alert("�α��ο� �����Ͽ����ϴ�.");  </script>

	<%         	break;
        case 1: %>
        
		<script language=javascript> 
		 self.window.alert("ȸ�����Կ� �����Ͽ����ϴ�.");  </script>
		 

	<%         	break;
        case 2: %>
        		 <script language=javascript> 
		 self.window.alert("ȸ�����Կ� �����Ͽ����ϴ�.");  </script>

	<%         	break; 
        case 4: %>
        <script language=javascript>
        self.window.alert("������ �Ϸ�Ǿ����ϴ�."); </script>
   
   <%	break;
        case 5: %>
        <script language=javascript>
        self.window.alert("������ �����Ͽ����ϴ�."); </script>
   
   <%	break;
	}
        }%>
	<h1>ȸ�� �α��� ȭ���Դϴ�.</h1>
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
		ȸ���� �ƴϽŰ���? <a href="JoinForm.jsp">ȸ������ �Ϸ�����</a>
	</p>
</body>
</html>