<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 : 도서 삭제 페이지</title>
<link rel="stylesheet" href="../resource/css/bookmanage.css">
</head>
<body>
	<h1>도서 삭제하기</h1>
	<form method="post" action="./bookDeleteCheck.jsp">
		<table id="bookDeleteTable">
			<tr>
				<th>도서 제목</th>
				<td><input type="text" name="bookname" /></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" name="bookauthor" /></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><input type="text" name="bookpublisher" /></td>
			</tr>
			<tr>
				<th>ISBN</th>
				<td><input type="text" name="ISBN"></td>
			</tr>

		</table>
		<p>
			<input type="submit" value="삭제하기" />
		</p>
	</form>
</body>
</html>