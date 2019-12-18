<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DB 01조 회원 도서 검색</title>
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
    <h1 style="display:inline;">도서관 대여 프로그램</h1>
    <h2 style="display:inline;">도서 상세정보 </h2>
    <br><br>
  </div>

  <div style="border:1px solid; padding:30px 50px 20px 50px; height: 120px">
    <div style="float:left; margin-right:30px; width=100px; height=100px;">
      <img src="images/book_icon.png" alt="book image" style="width=120px; height=120px;">
    </div>
    <div style="width:70%; float:left;">
      도서제목: 라미<br>
      ISBN: ♥ ♥ ♥ ♥<br>
      저자: 나나<br>
      출판사: 디노
    </div>
  </div>

  <div>
    <table>
      <tr>
        <th>도서번호</th>
        <th>도서상태</th>
        <th>예약대기</th>
        <th>대출가능날짜</th>
        <th>버튼</th>
      </tr>
      <tr>
        <td>001</td>
        <td>대출가능</td>
        <td>0명</td>
        <td>2019.11.30</td>
        <td><button onclick='loan()'>대출</button></td>
      </tr>
      <tr>
        <td>002</td>
        <td>대출중</td>
        <td>1명</td>
        <td>2020.03.01</td>
        <td><button onclick='reservation()'>예약</button></td>
      </tr>
    </table>
  </div>
</body>
</html>