<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>������ : ���� ���� ������</title>
<link rel="stylesheet" href="../resource/css/bookmanage.css">
</head>
<body>
	<h1>���� �����ϱ�</h1>
	<form method="post" action="./bookDeleteCheck.jsp">
		<table id="bookDeleteTable">
			<tr>
				<th>���� ����</th>
				<td><input type="text" name="bookname" /></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="bookauthor" /></td>
			</tr>
			<tr>
				<th>���ǻ�</th>
				<td><input type="text" name="bookpublisher" /></td>
			</tr>
			<tr>
				<th>ISBN</th>
				<td><input type="text" name="ISBN"></td>
			</tr>

		</table>
		<p>
			<input type="submit" value="�����ϱ�" />
		</p>
	</form>
</body>
</html>