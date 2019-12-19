<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 : 도서 등록 페이지</title>
 <style type="text/css">
 
 	h1{
 		margin-bottom: 100px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	#entbtn{
 		margin-bottom: 20px;
 		border: 2px solid black;
 		background-color: #e0bbb6;
 		padding: 10px;
 		font-weight: bold;
 		font-size: 16px;
 	}
 	
 	body{
 		margin: 0 auto;
 		background-color: #FFFFF0;
 	}
 	
 	#managebtnset{
 		margin: 0 auto;
 		text-align: center;
 		
 	}
 	
 	#bookenrollmentTable{
  		height: 100px;
 		width: 300px;
 		text-align: center;
	    margin: 0 auto;
        border: 2px solid black;
        border-collapse: collapse;
        margin-bottom: 30px;
    }
 	
 	td{
  		border:2px solid black;
  		padding: 8px;
  		background-color: #e8e1eb;
	}
	th{
  		border:2px solid black;
  		background-color: #997799;
  		padding: 8px;
  		
	}
 	#ent{
 		text-align: center;
 	}
 </style>
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
		<div id ="ent">
			<input type="submit" value="등록하기" id ="entbtn"/>
		</div>
	</form>
</body>
</html>