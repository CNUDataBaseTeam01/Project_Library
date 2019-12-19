<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 : 도서 삭제 페이지</title>
<style type="text/css">
 
 	h1{
 		margin-bottom: 100px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	#delbtn{
 		margin-top: 30px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 10px;
 		font-weight: bold;
 		font-size: 16px;
 		text-align: center;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#managebtnset{
 		margin: 0 auto;
 		text-align: center;
 		
 	}
 	
 	#bookDeleteTable{
  		height: 100px;
 		width: 500px;
 		text-align: center;
	    margin: 0 auto;
        border: 2px solid black;
        border-collapse: collapse;
    }
 	
 	td{
  		border:2px solid black;
  		padding: 8px;
  		background-color: #e8e1eb;
  		border-collapse: collapse;
	}
	th{
  		border:2px solid black;
  		background-color: #997799;
  		padding: 8px;
  		border-collapse: collapse;
	}
	
	
 	p{
 		text-align: center;
 		margin-bottom: 50px;
 	}
 </style>
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
			<input type="submit" value="삭제하기" id="delbtn"/>
		</p>
	</form>
</body>
</html>