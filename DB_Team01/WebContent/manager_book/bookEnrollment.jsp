<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 : 도서 등록 페이지</title>
<link rel="stylesheet" href="../resource/css/bookmanage.css">
</head>
<body>
	<h1>도서 등록하기</h1>
	<form method="post" action="./bookEnrollmentCheck.jsp">
		<table id="bookenrollmentTable">
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
			<tr>
				<th>등록권수</th>
				<td><select name="bookNum">
						<option value="">권</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
				</select></td>

			</tr>
		</table>
		<p>
			<input type="submit" value="등록하기" />
		</p>
	</form>
</body>
</html>