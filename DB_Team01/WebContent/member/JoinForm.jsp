<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv = "Content-Type" content="text/html"; charset="EUC-KR">
<title>ȸ�� ȸ������</title>
  <style type="text/css">
 
 	h1{
 		margin-bottom: 50px;
 		text-align: center;
 		background-color: #f2d7c6;
 		padding: 25px;
 	}
 	
 	#joinsubbtn{
 		margin-bottom: 20px;
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
 	
 	#joinbtnheadset{
 		margin: 0 auto;
 		text-align: center;
 		
 	}
 	
 	#memberJoinTable{
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
	
	
 </style>
</head>
<body>
	   <h1> ȸ������ ȭ���Դϴ�. </h1>
       <form method="post" action="JoinPro.jsp">
           <div id ="memberJoin">
           <table id="memberJoinTable">
             <tr><th>id</th><td><input type="text" name ="memberId" maxlength = "12"></td></tr>
             <tr><th>password</th><td><input type ="password" name ="memberPw" maxlength = "12"></td></tr>
             <tr><th>����</th><td><input type ="text" name ="membername" maxlength = "12"></td></tr>
             <tr><th>E-mail</th><td><input type ="text" name ="memberEmail"></td></tr>
             <tr><th>��ȭ��ȣ</th><td><input type ="text" name ="memberPH"></td></tr>
             <tr><th>����</th>
                 <td id="sort"><select class="membersort" name="memebersort">
                   <option value="department">�к�</option>
                   <option value="postgraduate">���п�</option>
                   <option value="professor">������</option>
                 </select>
                 </td></tr>
          </table>
          <br/>
          	<div id="joinbtnheadset">
          	<input type="submit"  value="ȸ������" id="joinsubbtn"><br/>
         	</div>
          </div>
         </form>
</body>

</html>