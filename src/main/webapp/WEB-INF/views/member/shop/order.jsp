<%@page import="ga.dgmarket.gymshopping.domain.Order"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Order order=(Order)session.getAttribute("order");
%>


<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
  width: 60%;
  height: 800px;
  margin: auto;
}

/* Full-width input fields */
input[type=text],textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, textarea {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>

<form action="/action_page.php">
    <div class="container">
        <h1>결제를 완료 했습니다.</h1>
        <p>감사합니다 다음에 다시 이용해주세요.</p>
        <hr>

        <label><b>주문자 성명</b></label>
        <input type="text" value="<%=order.getName()%>">

        <label><b>제품명</b></label>
        <input type="text" value="<%=order.getProduct_name()%>">

        <label><b>구매 수량</b></label>
        <input type="text" value="<%=order.getEa() %>">

        <label><b>가격</b></label>
        <input type="text" value="<%=order.getTotalprice() %>">

        <label><b>제품 수령 주소</b></label>
        <input type="text" value="<%=order.getAddr()%>">


        <hr>
        <button type="button" class="btn" onclick="location.href='/member/main'">쇼핑 계속하기</button>
    </div>
</form>

</body>
</html>