<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다..</title>
<%@ include file="../inc/bootstrap.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#login").click(function(){
		loginCheck();
	});
});
function loginCheck(){
	if($('input[name=host_id]').val()==0){
		alert('아이디를 입력해주세요');
	}else if($('input[name=password]').val()==0){
		alert('비밀번호를 입력해주세요');
	}else{
		$('form').attr({
			"action":"/admin/login",
			"method":"post"
		});
		$('form').submit();
	}	
}
</script>
</head>
<body>
<form>
<div class="container p-3 my-3 bg-dark text-white">
  <h1>관리자 로그인 페이지입니다.</h1>
  <p>발급받은 id와 password를 입력해주세요</p>
	<div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="ID" name="host_id" value="">
  </div>
	 <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="password">
  </div>
  <button type="button" class="btn" style="background: #b8b0b0" id="login">Login</button>
  <button type="button" class="btn" style="background: #b8b0b0" onclick="location.href='/member/main'">매장으로</button>
	  </form>
</div>
	</div>
</body>
</html>