<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member member = (Member)request.getAttribute("member");
	int checkGrade = member.getUser_grade();
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인중..</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>
</head>
<body>
 
 


	  <%
	  	if(checkGrade == 7){%>
	  		<script>
				alert("탈퇴 처리된 계정입니다");
				location.href="/member/main";
			</script>
		  	<%session.invalidate();
	  	}else{%>
	  		<script>
				alert("어서오세요!");
				location.href="/member/main";	  		
			</script>
	  	<%}%>
</body>
</html>