<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv = "Content-Type" content="text/html"; charset="EUC-KR">
<title>���ڵ� �߰�</title>
</head>
<body>
	<h2>member ���̺� ���ڵ� �߰�</h2>
	
	<form method="post" action="insertTestPro.jsp">
		���̵� : <input type="text" name = "id" maxlength = "12"><br/>
		�н����� : <input type = "password" name="passwd" maxlength="12"><br/>
		�̸� : <input type="text" name="name" maxlength="10"><br/>
		<input type="submit" value="�Է¿Ϸ�">
	</form>
</body>
</html>