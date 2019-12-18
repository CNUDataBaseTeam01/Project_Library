
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%String memberid = request.getParameter("memberid");%>

<!DOCTYPE html>
<html>
<head>
<title>DB 01조 회원 도서 검색</title>
<meta charset="utf-8">
<link rel="stylesheet" href="mainTP.css" type="text/css">

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin-top: 30px;
}

td, th {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	/* border: 1px solid #444444; */
}
</style>

</head>
<script type="text/javascript">
	function bookIsbn() {
		String
		redirectUrl = "main.jsp?idx=0";
		response.sendRedirect(redirectUrl);
	}
</script>

<body>
	<div>
		<h1 style="display: inline;">도서관 대여 프로그램</h1>
		<h2 style="display: inline;">도서검색</h2>
	</div>


	<div style="line-height: 120%;">
		<br>
		<center>
		<form action="TitlebookList.jsp" method="post">
		<input type="hidden" id= "memberid"name= "memberid" value=<%=memberid%>>
			<input type="text" id="inputTitle" name="inputTitle"
				placeholder="도서제목 검색" style="width: 300px;"> <input
				type="submit" value="검색" name="btnTitle" id="btnTitle" />
		</form>
		</center>
	</div>

	<div style="line-height: 50%;">
		<br>
		<center>
			<form action="ISBNbookList.jsp" method="post">
			<input type="hidden" id= "memberid"name= "memberid" value=<%=memberid%>>
				<input type="text" id="inputISBN" name="inputISBN"
					placeholder="ISBN 검색" style="width: 300px;"> <input
					type="submit" value="검색" name="btnISBN" id="btnISBN" />
			</form>
		</center>
	</div>

</body>

</html>
