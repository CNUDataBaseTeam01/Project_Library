<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv = "Content-Type" content="text/html"; charset="EUC-KR">
<title>레코드 추가</title>
</head>
<body>
	<h2>member 테이블에 레코드 추가</h2>
	
	<form method="post" action="insertTestPro.jsp">
		아이디 : <input type="text" name = "id" maxlength = "12"><br/>
		패스워드 : <input type = "password" name="passwd" maxlength="12"><br/>
		이름 : <input type="text" name="name" maxlength="10"><br/>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>