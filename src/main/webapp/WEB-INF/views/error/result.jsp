<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
    	RuntimeException e=(RuntimeException)request.getAttribute("e"); //에러객체
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgColor="red">
ㅈㅅㅈㅅ
<%=e.getMessage() %>
</body>
</html>