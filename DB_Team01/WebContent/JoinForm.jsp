<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv = "Content-Type" content="text/html"; charset="EUC-KR">
<title>ȸ�� ȸ������</title>
  <link rel="stylesheet" href = "resource/css/member.css" type="text/css">
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
          <br/>	<input type="submit"  value="ȸ������"><br/>
          </div>
         </form>
</body>

</html>