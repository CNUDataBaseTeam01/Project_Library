
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%String memberid = request.getParameter("memberid");%>

<!DOCTYPE html>
<html>
<head>
<title>DB 01조 회원 도서 검색</title>
<meta charset="utf-8">
 <style type="text/css">
 	
 	h1{
 		margin-left: 15px;
 	}
 	
 	#headset{
 		padding: 15px;
 		margin: 0 auto;
 		text-align: center;
 	}
 	
 	#btnTitle,#btnISBN{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		font-weight: bold;
 		height: 34px;
 		width: 100px;
 		font-size: 15px;
 	}
 	
 	#inputTitle,#inputISBN{
 		border: 2px solid black;
 	    height:30px;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#searchbtnone{
 		margin: 0 auto;
 		text-align: center;
 	}

 	#searchbtntwo{
 		margin: 0 auto;
 		text-align: center;
 	}
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
 	
 	#membookinput{
 		margin: 0 auto;
 		text-align: center;
 		margin-top: 100px;
 	}
 	
 </style> 
</head>
<script type="text/javascript">
	function bookIsbn() {
		String
		redirectUrl = "../main.jsp?idx=0";
		response.sendRedirect(redirectUrl);
	}
</script>

<body>
	<div id="headset">
		<h1 style="display: inline;">도서관 대여 프로그램</h1>
		<h2 style="display: inline;">도서검색</h2>
	</div>

	<div id="membookinput">
	<div>
		<br>
		<form action="TitlebookList.jsp" method="post">
		<input type="hidden" id= "memberid"name= "memberid" value=<%=memberid%>>
			<input type="text" id="inputTitle" name="inputTitle"
				placeholder="도서제목 검색" style="width: 300px;"> <input
				type="submit" value="검색" name="btnTitle" id="btnTitle" />
		</form>
		
	</div>

	<div style="line-height: 50%;">
		<br/>
			<form action="ISBNbookList.jsp" method="post">
			<input type="hidden" id= "memberid"name= "memberid" value=<%=memberid%>>
				<input type="text" id="inputISBN" name="inputISBN"
					placeholder="ISBN 검색" style="width: 300px;"> <input
					type="submit" value="검색" name="btnISBN" id="btnISBN" />
			</form>
	</div>
	</div>
</body>

</html>
