
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String result=(String)request.getAttribute("result");
if(result!=null && result.equals("false")){
%>
<%
out.print("<script>");
out.print("alert('올바르지 않은 정보입니다.');");
out.print("location.href='/member/loginform';");
out.print("</script>");
%>
<%} %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title></title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<meta name="keywords"
	content="Working Signin form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //Meta tag Keywords -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="//fonts.googleapis.com/css2?family=Karla:wght@400;700&display=swap"
	rel="stylesheet">
<style>
html {
	scroll-behavior: smooth;
}

body, html {
	margin: 0;
	padding: 0;
	font-family: 'Karla', sans-serif;
}

* {
	box-sizing: border-box;
}

.d-grid {
	display: grid;
}

.d-flex {
	display: flex;
	display: -webkit-flex;
}

.text-center {
	text-align: center;
}

.text-left {
	text-align: left;
}

.text-right {
	text-align: right;
}

button, input, select {
	-webkit-appearance: none;
	outline: none;
	font-family: 'Karla', sans-serif;
}

button, .btn, select {
	cursor: pointer;
}

a {
	text-decoration: none;
}

img {
	max-width: 100%;
}

ul {
	margin: 0;
	padding: 0
}

h1, h2, h3, h4, h5, h6, p {
	margin: 0;
	padding: 0
}

p {
	color: #666;
	font-size: 18px;
	line-height: 25px;
}

.p-relative {
	position: relative;
}

.p-absolute {
	position: absolute;
}

.p-fixed {
	position: fixed;
}

.p-sticky {
	position: sticky;
}

.btn, button, .actionbg, input {
	border-radius: 4px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-o-border-radius: 4px;
	-ms-border-radius: 4px;
}

.btn:hover, button:hover {
	transition: 0.5s ease;
	-webkit-transition: 0.5s ease;
	-o-transition: 0.5s ease;
	-ms-transition: 0.5s ease;
	-moz-transition: 0.5s ease;
}

/*-- wrapper start --*/
.wrapper {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

@media ( min-width : 576px) {
	.wrapper {
		max-width: 540px;
	}
}

@media ( min-width : 768px) {
	.wrapper {
		max-width: 720px;
	}
}

@media ( min-width : 992px) {
	.wrapper {
		max-width: 960px;
	}
}

@media ( min-width : 1200px) {
	.wrapper {
		max-width: 1140px;
	}
}

.wrapper-full {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

/*-- //wrapper start --*/

/*-- form styling --*/
.w3l-workinghny-form .logo {
	text-align: center;
}

.w3l-workinghny-form .logo a.brand-logo {
	display: inline-block;
	text-align: center;
	font-size: 50px;
	line-height: 1.1em;
	font-weight: 700;
	color: #212529;
	margin-bottom: 30px;
	text-transform: capitalize;
	letter-spacing: -1px;
}

.w3l-workinghny-form .align-end {
	align-self: flex-end;
	padding: 2em;
}

.w3l-workinghny-form .logo a.brand-logo span {
	font-weight: 300;
}

.w3l-workinghny-form h1 {
	font-size: 50px;
	line-height: 1.1em;
	font-weight: 700;
	color: #3f3a64;
}

.w3l-workinghny-form {
	position: relative;
	z-index: 0;
	padding: 2em 0px;
	display: grid;
	align-items: center;
	height: 100vh;
}

.w3l-workinghny-form .pos-relative {
	position: relative;
}

.w3l-workinghny-form .copyright {
	margin-top: 20px;
}

.w3l-workinghny-form p.copy-footer-29 a {
	color: #495057;
}

.w3l-workinghny-form p.copy-footer-29 a:hover {
	color: #4361ee;
}

.w3l-workinghny-form h2 {
	font-size: 30px;
	color: #fff;
	margin-bottom: 15px;
}

.w3l-workinghny-form .workinghny-block-grid {
	display: grid;
	grid-template-columns: 1.2fr 1fr;
	grid-gap: 70px;
	width: 90%;
	margin: 0 auto;
	align-items: center;
}

.w3l-workinghny-form .login-form-content {
	padding: 2em 0em;
}

.w3l-workinghny-form .one-frm label {
	font-style: normal;
	font-size: 16px;
	color: #343a40;
	display: block;
	margin-bottom: 10px;
	font-weight: 400;
}

.w3l-workinghny-form input {
	background: transparent;
	border: none;
	border-bottom: 2px solid #212529;
	color: #777;
	background: transparent;
	font-size: 13px;
	line-height: 20px;
	padding: 12px 15px;
	width: 100%;
	margin-bottom: 30px;
	border-radius: 0;
	outline: none;
}

.w3l-workinghny-form input:focus {
	background: transparent;
	border-bottom: 2px solid #4361ee;
	box-shadow: none;
}

.w3l-workinghny-form .btn-style {
	font-size: 18px;
	color: #fff;
	width: 100%;
	background: #4361ee;
	border: none;
	height: 55px;
	font-weight: 700;
	border-radius: 6px;
	transition: .3s ease;
	-webkit-transition: .3s ease;
	-moz-transition: .3s ease;
	-ms-transition: .3s ease;
	-o-transition: .3s ease;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
}

.w3l-workinghny-form .btn-style:hover {
	background: #f72585;
	transform: translateY(-3px);
	box-shadow: 0 6px 6px 0 rgba(0, 0, 0, 0.2);
}

.w3l-workinghny-form p.already, .w3l-workinghny-form p.already a {
	font-size: 18px;
	line-height: 25px;
	color: #495057;
	margin: 25px 0 0;
	text-align: center;
}

.w3l-workinghny-form p.remember {
	color: #495057;
	line-height: 20px
}

.w3l-workinghny-form p.already a {
	color: #495057;
	font-weight: 700;
}

.w3l-workinghny-form p.already a:hover {
	color: #4361ee;
}

.w3l-workinghny-form .check-remaind input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
	height: 0;
	width: 0;
}

.w3l-workinghny-form .check-remaind {
	display: block;
	position: relative;
	padding-left: 35px;
	cursor: pointer;
	margin: 5px 0px 30px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.w3l-workinghny-form .check-remaind input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
	height: 0;
	width: 0;
}

.w3l-workinghny-form .checkmark {
	position: absolute;
	top: 0px;
	left: 0;
	height: 21px;
	width: 21px;
	background-color: #F5F4F2;
	border-radius: 4px;
}

.w3l-workinghny-form .check-remaind:hover input ~.checkmark {
	background-color: #4361ee;
}

.w3l-workinghny-form .check-remaind input:checked ~.checkmark {
	background-color: #4361ee;
}

.w3l-workinghny-form .checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

.w3l-workinghny-form .check-remaind input:checked ~.checkmark:after {
	display: block;
}

.w3l-workinghny-form .check-remaind .checkmark:after {
	left: 7px;
	top: 3px;
	width: 5px;
	height: 10px;
	border: solid #fff;
	border-width: 0 2px 2px 0;
	transform: rotate(45deg);
}

/* -- placeholder --*/
::-webkit-input-placeholder {
	/* Chrome/Opera/Safari */
	color: #777;
}

::-moz-placeholder {
	/* Firefox 19+ */
	color: #777;
}

:-ms-input-placeholder {
	/* IE 10+ */
	color: #777;
}

:-moz-placeholder {
	/* Firefox 18- */
	color: #777;
}

@media ( max-width : 992px) {
	.w3l-workinghny-form .workinghny-block-grid {
		grid-template-columns: 1fr;
		grid-gap: 10px;
		width: 100%;
	}
	.w3l-workinghny-form .login-form-content {
		padding: 0em 0em 2em 0;
	}
	.workinghny-left-img {
		order: 2;
	}
	.w3l-workinghny-form .logo a.brand-logo {
		font-size: 40px;
		margin-bottom: 10px;
	}
	.w3l-workinghny-form {
		height: auto;
	}
}

@media ( max-width : 667px) {
	.w3l-workinghny-form .align-end {
		padding: 0em;
	}
}

@media ( max-width : 480px) {
	.w3l-workinghny-form .logo a.brand-logo {
		font-size: 35px;
	}
	.w3l-workinghny-form h2 {
		font-size: 22px;
	}
}

@media ( max-width : 415px) {
	.w3l-workinghny-form .copyright {
		margin-top: 30px;
	}
}
</style>

<script>
	$(function() {
		$("button[type='button']").click(function() {
			loginCheck();
		});
	});

	function loginCheck() {
		var form = document.form1;

		//아이디에서 입력 필수 조건문
		if (form.user_id.value == "") {
			alert("아이디를 입력해야 합니다!");
			form.user_id.focus();//포커스를 id박스로 이동.
			return;
		}

		//패스워드 검사 -------------------------------------------------------------------------

		if (form.password.value == "") {
			alert("패스워드를 입력 해야 합니다!");
			form.password.focus();//포커스를 Password박스로 이동.
			return;
		}
		
		

		//서버에 로그인 요청
		$("form").attr({
			"action" : "/member/login",
			"method" : "post"
		});
		$("form").submit();
	}
</script>
</head>
<body>
	<!-- form section start -->
	<section class="w3l-workinghny-form">
		<!-- /form -->
		<div class="workinghny-form-grid">
			<div class="wrapper">
				<div class="logo">
					<h1>
						<a class="brand-logo"><span>득근마켓</span>
							로그인</a>
					</h1>
				</div>
				<div class="workinghny-block-grid">
					<div class="workinghny-left-img align-end">
						<img src="/resources/img/reallogo.png" class="img-responsive" alt="img" />
					</div>
					<div class="form-right-inf">

						<div class="login-form-content">
							<h2>Where to?</h2>
							<form class="signin-form" name="form1">
								<div class="one-frm">

									<label>ID</label> <input type="text" name="user_id"
										placeholder="" required="">
								</div>
								<div class="one-frm">
									<label>Password</label> <input type="password" name="password"
										placeholder="" required="">
								</div>
								
								<button type="button" class="btn btn-style mt-3">로그인</button>
							</form>
							<p class="already">
								계정이 없으신가요? <a href="/member/registform">회원가입</a>/<a href="/member/main">비회원으로</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright text-center">
			<div class="wrapper">
				<p class="copy-footer-29">
					<a href="https://w3layouts.com"></a>
				</p>
			</div>
		</div>
	</section>
</body>
</html>