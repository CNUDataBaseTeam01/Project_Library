<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DB 01�� ȸ�� ���� �˻�</title>
<style>
    table {
      width: 100%;
      border-top: 1px solid #444444;
      border-collapse: collapse;
      margin-top: 10px;
    }

    td,
    th {
      border-bottom: 1px solid #444444;
      padding: 10px;
      text-align: center;
      /* border: 1px solid #444444; */
    }
  </style>
</head>
<body>
  <div>
    <h1 style="display:inline;">������ �뿩 ���α׷�</h1>
    <h2 style="display:inline;">���� ������ </h2>
    <br><br>
  </div>

  <div style="border:1px solid; padding:30px 50px 20px 50px; height: 120px">
    <div style="float:left; margin-right:30px; width=100px; height=100px;">
      <img src="images/book_icon.png" alt="book image" style="width=120px; height=120px;">
    </div>
    <div style="width:70%; float:left;">
      ��������: ���<br>
      ISBN: �� �� �� ��<br>
      ����: ����<br>
      ���ǻ�: ���
    </div>
  </div>

  <div>
    <table>
      <tr>
        <th>������ȣ</th>
        <th>��������</th>
        <th>������</th>
        <th>���Ⱑ�ɳ�¥</th>
        <th>��ư</th>
      </tr>
      <tr>
        <td>001</td>
        <td>���Ⱑ��</td>
        <td>0��</td>
        <td>2019.11.30</td>
        <td><button onclick='loan()'>����</button></td>
      </tr>
      <tr>
        <td>002</td>
        <td>������</td>
        <td>1��</td>
        <td>2020.03.01</td>
        <td><button onclick='reservation()'>����</button></td>
      </tr>
    </table>
  </div>
</body>
</html>