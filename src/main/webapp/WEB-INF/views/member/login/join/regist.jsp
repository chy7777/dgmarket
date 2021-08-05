<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Member member = (Member) request.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>JoinForm</title>
<!-- Meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content=" Astronauts sign up & login Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	alt></script>
<!-- bootbox cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<link href="//fonts.googleapis.com/css?family=Barlow:300,400,500"
	rel="stylesheet">
<style type="text/css">
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, dl, dt, dd, ol, nav ul, nav li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

ol, ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}
/* start editing from here */
a {
	text-decoration: none;
}

.txt-rt {
	text-align: right;
}
/* text align right */
.txt-lt {
	text-align: left;
}
/* text align left */
.txt-center {
	text-align: center;
}
/* text align center */
.float-rt {
	float: right;
}
/* float right */
.float-lt {
	float: left;
}
/* float left */
.clear {
	clear: both;
}
/* clear float */
.pos-relative {
	position: relative;
}
/* Position Relative */
.pos-absolute {
	position: absolute;
}
/* Position Absolute */
.vertical-base {
	vertical-align: baseline;
}
/* vertical align baseline */
.vertical-top {
	vertical-align: top;
}
/* vertical align top */
nav.vertical ul li {
	display: block;
}
/* vertical menu */
nav.horizontal ul li {
	display: inline-block;
}
/* horizontal menu */
img {
	max-width: 100%;
}
/*end reset*/
html, body {
	padding: 0;
	margin: 0;
	background: #fff;
	font-family: 'Barlow', sans-serif;
}

body a {
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
	-ms-transition: 0.5s all;
	text-decoration: none;
}

body a:hover {
	text-decoration: none;
}

body a:focus, a:hover {
	text-decoration: none;
}

select, input[type="email"], input[type="text"], input[type=password],
	input[type="button"], input[type="submit"], textarea {
	font-family: 'Barlow', sans-serif;
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
	-ms-transition: 0.5s all;
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
	font-family: 'Barlow', sans-serif;
	letter-spacing: 1px;
}

p {
	margin: 0;
	padding: 0;
	letter-spacing: 1px;
	font-family: 'Barlow', sans-serif;
}

ul {
	margin: 0;
	padding: 0;
}
/*-- //Reset-Code --*/
body {
	background: #000;
	min-height: 100vh;
}

h1.header-w3ls {
	padding: 31px 0px 25px;
	font-size: 53px;
	text-align: center;
	text-transform: capitalize;
	color: #ffffff;
	text-shadow: 2px 3px rgba(0, 0, 0, 0.42);
	letter-spacing: 5px;
}

.art-right-w3ls h2 {
	font-size: 33px;
	font-weight: 600;
	margin-bottom: 12px;
	color: #000;
}

.art-right-w3ls p {
	font-size: 14px;
	text-align: center;
	color: #000;
	line-height: 27px;
}

.art-bothside {
	width: 70%;
	margin: 0em auto;
	-webkit-box-shadow: -2px 7px 37px 8px rgba(0, 0, 0, 0.52);
	-moz-box-shadow: -2px 7px 37px 8px rgba(0, 0, 0, 0.52);
	box-shadow: -2px 7px 37px 8px rgba(0, 0, 0, 0.52);
	background: #fff;
}

.mid-cls {
	display: -webkit-flex;
	display: -webkit-box;
	display: -moz-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-justify-content: space-between;
	justify-content: space-between;
}

.art-left-w3ls, .art-right-w3ls {
	padding: 3em 2em 3em;
}

.art-left-w3ls, .art-right-w3ls {
	flex-basis: 50%;
	-webkit-flex-basis: 50%;
}

.art-left-w3ls {
	text-align: center;
	background: #ffffff;
}

.form-left-to-w3l input[type="text"], .form-left-to-w3l input[type="password"],
	.form-right-w3ls input[type="password"], .form-right-w3ls input[type="email"]
	{
	width: 100%;
	color: #000;
	outline: none;
	font-size: 14px;
	padding: 1em 0em;
	margin: 0px 0px 20px;
	border: none;
	border-bottom: 1px solid #000;
	-webkit-appearance: none;
	display: inline-block;
	background: transparent;
	-moz-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	box-sizing: border-box;
}

::-webkit-input-placeholder {
	/* Chrome/Opera/Safari */
	color: #000;
}

::-moz-placeholder {
	/* Firefox 19+ */
	color: #000;
}

:-ms-input-placeholder {
	/* IE 10+ */
	color: #000;
}

:-moz-placeholder {
	/* Firefox 18- */
	color: #000;
}


.w3layouts_more-buttn a {
	font-size: 16px;
	color: #f10000;
	font-weight: 600;
	text-decoration: none;
	text-transform: uppercase;
	display: inline-block;
	letter-spacing: 2px;
	outline: none;
}

.w3layouts_more-buttn a:hover {
	color: #000;
}

.w3layouts_more-buttn h3 {
	font-size: 30px;
	color: #000;
	text-align: center;
	margin-top: 21px;
}

.copy {
	padding: 39px 0px;
}

.copy p {
	margin: 0em;
	text-align: center;
	font-size: 17px;
	color: white;
	letter-spacing: 2px;
}

.copy p a {
	color: #0dd0ce;
	text-decoration: none;
}

.copy p a:hover {
	color: #fff;
}
/*--responsive--*/
@media ( max-width :1920px) {
	h1.header-w3ls {
		font-size: 60px;
	}
	.art-right-w3ls h2 {
		font-size: 40px;
	}
}

@media ( max-width :1680px) {
	h1.header-w3ls {
		font-size: 57px;
	}
	.art-right-w3ls h2 {
		font-size: 37px;
	}
}

@media ( max-width :1600px) {
	h1.header-w3ls {
		font-size: 53px;
	}
	.art-right-w3ls h2 {
		font-size: 33px;
	}
}

@media ( max-width :1440px) {
	.art-bothside {
		width: 70%;
	}
	h1.header-w3ls {
		letter-spacing: 3px;
	}
	button[type=submit] {
		width: 37%;
	}
}

@media ( max-width :1366px) {
	.art-left-w3ls, .art-right-w3ls {
		padding: 2em 2em 2em;
	}
	.art-bothside {
		width: 73%;
	}
	h1.header-w3ls {
		font-size: 50px;
	}
	.art-right-w3ls h2 {
		font-size: 31px;
	}
	.form-left-to-w3l input[type="text"], .form-left-to-w3l input[type="password"],
		.form-right-w3ls input[type="password"], .form-right-w3ls input[type="email"]
		{
		padding: 0.8em 0em;
		margin: 0px 0px 16px;
	}
	.w3layouts_more-buttn h3 {
		font-size: 30px;
		margin-top: 18px;
	}
}

@media ( max-width :1280px) {
	.art-bothside {
		width: 75%;
	}
	h1.header-w3ls {
		font-size: 48px;
	}
}

@media ( max-width :1080px) {
	.art-bothside {
		width: 81%;
	}
	.art-right-w3ls h2 {
		font-size: 28px;
	}
	button[type=button] {
		padding: 13px 10px;
		margin: 16px 0px 0px;
	}
}

@media ( max-width :1050px) {
	.art-bothside {
		width: 84%;
	}
	.art-left-w3ls, .art-right-w3ls {
		padding: 1.7em 1.5em 1.8em;
	}
	.w3layouts_more-buttn h3 {
		font-size: 30px;
	}
}

@media ( max-width :1024px) {
	h1.header-w3ls {
		font-size: 45px;
	}
	.w3layouts_more-buttn a {
		font-size: 15px;
		letter-spacing: 1px;
	}
	.copy p {
		font-size: 16px;
	}
}

@media ( max-width :991px) {
	.art-right-w3ls p {
		line-height: 27px;
	}
	.art-bothside {
		width: 86%;
	}
	.form-left-to-w3l input[type="text"], .form-left-to-w3l input[type="password"],
		.form-right-w3ls input[type="password"], .form-right-w3ls input[type="email"]
		{
		margin: 0px 0px 14px;
	}
}

@media ( max-width :900px) {
	.art-bothside {
		width: 94%;
	}
	.copy {
		padding: 33px 0px;
	}
	h1.header-w3ls {
		letter-spacing: 2px;
	}
}

@media ( max-width :800px) {
	h1.header-w3ls {
		font-size: 42px;
	}
	.art-right-w3ls h2 {
		font-size: 24px;
	}
}

@media ( max-width :768px) {
	.art-bothside {
		width: 97%;
	}
	button[type=button] {
		padding: 11px 10px;
		width: 35%;
	}
}

@media ( max-width :767px) {
	.mid-cls {
		flex-direction: column;
		-webkit-flex-direction: column;
	}
	h1.header-w3ls {
		font-size: 40px;
	}
	.art-bothside {
		width: 80%;
	}
	.copy p {
		font-size: 15px;
		letter-spacing: 1px;
	}
	.art-right-w3ls h2 {
		text-align: center;
		margin-bottom: 11px;
	}
}

@media ( max-width :736px) {
	.copy {
		padding: 30px 0px;
	}
}

@media ( max-width :667px) {
	h1.header-w3ls {
		font-size: 37px;
		letter-spacing: 1px;
	}
	.form-left-to-w3l input[type="text"], .form-left-to-w3l input[type="password"],
		.form-right-w3ls input[type="password"], .form-right-w3ls input[type="email"]
		{
		padding: 0.7em 0em;
	}
}

@media ( max-width :640px) {
	.art-bothside {
		width: 83%;
	}
}

@media ( max-width :600px) {
	h1.header-w3ls {
		font-size: 33px;
	}
}

@media ( max-width :568px) {
	.art-bothside {
		width: 85%;
	}
	button[type=submit] {
		font-size: 14px
	}
	.copy p {
		line-height: 31px;
	}
}

@media ( max-width :480px) {
	h1.header-w3ls {
		padding: 25px 0px 22px;
		font-size: 29px;
	}
}

@media ( max-width :440px) {
	.art-left-w3ls, .art-right-w3ls {
		padding: 1.7em 1.5em 1em;
	}
}

@media ( max-width :414px) {
	.art-right-w3ls h2 {
		line-height: 34px;
	}
	.form-left-to-w3l input[type="text"], .form-left-to-w3l input[type="password"],
		.form-right-w3ls input[type="password"], .form-right-w3ls input[type="email"]
		{
		margin: 0px 0px 12px;
	}
}

@media ( max-width :384px) {
	.form-left-to-w3l input[type="text"], .form-left-to-w3l input[type="password"],
		.form-right-w3ls input[type="password"], .form-right-w3ls input[type="email"]
		{
		font-size: 13px;
	}
	.w3layouts_more-buttn h3 {
		font-size: 30px;
	}
}

@media ( max-width :375px) {
	.art-left-w3ls, .art-right-w3ls {
		padding: 1.5em 1.5em 1em;
	}
}

@media ( max-width :320px) {
	button[type=submit] {
		margin: 11px 0px 0px;
	}
	h1.header-w3ls {
		font-size: 26px;
	}
}
/*--//responsive--*/

/* Styles for dialog window */
#small-dialog1 {
	background: #fff;
	padding: 6em 3em;
	text-align: left;
	max-width: 500px;
	margin: 40px auto;
	position: relative;
	text-align: center;
	-webkit-box-shadow: 3px 17px 43px 6px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: 3px 17px 43px 6px rgba(0, 0, 0, 0.75);
	box-shadow: 3px 17px 43px 6px rgba(0, 0, 0, 0.75);
}

#small-dialog-it, #small-dialog-in, #small-dialog-fr, #small-dialog-sh,
	#small-dialog-sf, #small-dialog-su, #small-dialog-me, #small-dialog-ch,
	#small-dialog-pi, #small-dialog-am {
	background: #fff;
	padding: 0px;
	text-align: left;
	max-width: 450px;
	margin: 40px auto;
	position: relative;
	text-align: center;
}

a.play-icon.popup-with-zoom-anim img:hover {
	opacity: 0.5;
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-o-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-ms-transition: 0.5s all;
}

.portfolio-items {
	text-align: center;
	margin: 0 auto;
}

.portfolio-items img {
	width: 100%;
}

.portfolio-items h4 {
	margin: 1em 0;
	font-size: 25px;
	color: #a63d56;
}

.portfolio-items p {
	text-align: justify;
}
/**

/**
 * Fade-zoom animation for first dialog
 */

/* start state */
.my-mfp-zoom-in #small-dialog {
	opacity: 0;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	-webkit-transform: scale(0.8);
	-moz-transform: scale(0.8);
	-ms-transform: scale(0.8);
	-o-transform: scale(0.8);
	transform: scale(0.8);
}
/* animate in */
.my-mfp-zoom-in.mfp-ready #small-dialog {
	opacity: 1;
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}
/* animate out */
.my-mfp-zoom-in.mfp-removing #small-dialog {
	-webkit-transform: scale(0.8);
	-moz-transform: scale(0.8);
	-ms-transform: scale(0.8);
	-o-transform: scale(0.8);
	transform: scale(0.8);
	opacity: 0;
}
/* Dark overlay, start state */
.my-mfp-zoom-in.mfp-bg {
	opacity: 0;
	-webkit-transition: opacity 0.3s ease-out;
	-moz-transition: opacity 0.3s ease-out;
	-o-transition: opacity 0.3s ease-out;
	transition: opacity 0.3s ease-out;
}
/* animate in */
.my-mfp-zoom-in.mfp-ready.mfp-bg {
	opacity: 0.3;
	background: #000;
}
/* animate out */
.my-mfp-zoom-in.mfp-removing.mfp-bg {
	opacity: 0;
}
/**
/* Magnific Popup CSS */
.mfp-bg {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1042;
	overflow: hidden;
	position: fixed;
	background: #fdfdfd;
	opacity: 0.8;
	filter: alpha(opacity = 80);
}

.mfp-wrap {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1043;
	position: fixed;
	outline: none !important;
	-webkit-backface-visibility: hidden;
}

.mfp-container {
	text-align: center;
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	padding: 0 8px;
	overflow-y: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.mfp-container:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
}

.mfp-align-top .mfp-container:before {
	display: none;
}

.mfp-content {
	position: relative;
	display: inline-block;
	vertical-align: middle;
	margin: 0 auto;
	text-align: left;
	z-index: 1045;
}

.mfp-inline-holder .mfp-content, .mfp-ajax-holder .mfp-content {
	width: 100%;
	cursor: auto;
}

.mfp-ajax-cur {
	cursor: progress;
}

.mfp-zoom-out-cur, .mfp-zoom-out-cur .mfp-image-holder .mfp-close {
	cursor: -moz-zoom-out;
	cursor: -webkit-zoom-out;
	cursor: zoom-out;
}

.mfp-zoom {
	cursor: pointer;
	cursor: -webkit-zoom-in;
	cursor: -moz-zoom-in;
	cursor: zoom-in;
}

.mfp-auto-cursor .mfp-content {
	cursor: auto;
}

.mfp-close, .mfp-arrow, .mfp-preloader, .mfp-counter {
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

.mfp-loading.mfp-figure {
	display: none;
}

.mfp-hide {
	display: none !important;
}

.mfp-content iframe {
	width: 100%;
	min-height: 370px;
	border: none;
}

.mfp-preloader {
	color: #cccccc;
	position: absolute;
	top: 50%;
	width: auto;
	text-align: center;
	margin-top: -0.8em;
	left: 8px;
	right: 8px;
	z-index: 1044;
}

.mfp-preloader a {
	color: #cccccc;
}

.mfp-preloader a:hover {
	color: white;
}

.mfp-s-ready .mfp-preloader {
	display: none;
}

.mfp-s-error .mfp-content {
	display: none;
}

button.mfp-close, button.mfp-arrow {
	overflow: visible;
	cursor: pointer;
	border: 0;
	background: #FFF;
	-webkit-appearance: none;
	display: block;
	padding: 0;
	z-index: 1046;
}

button::-moz-focus-inner {
	padding: 0;
	border: 0;
}

.mfp-close {
	width: 23px;
	height: 30px;
	line-height: 25px;
	position: absolute;
	left: -30px;
	top: -30px;
	text-decoration: none;
	text-align: center;
	padding: 0 0 18px 10px;
	color: white !important;
	font-style: normal;
	font-size: 45px;
	outline: none;
	font-family: 'Open Sans', sans-serif;
}

.mfp-close:hover, .mfp-close:focus {
	opacity: 1;
}

.mfp-close-btn-in .mfp-close {
	color: #fff;
	background: none;
}

.mfp-image-holder .mfp-close, .mfp-iframe-holder .mfp-close {
	color: white;
	right: -6px;
	text-align: right;
	padding-right: 6px;
	width: 100%;
}

.login h3, .signup h3 {
	margin: 1em 0;
	color: #a63d56;
}

.login input[type="text"], .login input[type="password"] {
	width: 90%;
	padding: 5px;
	margin: 3px 0;
	x border: 1px solid #a63d56;
	outline: none !important;
}

.signup input[type="text"] {
	width: 44.5%;
	padding: 5px;
	margin: 10px 0;
	outline: none;
	background: #EBEBEB;
	border: solid 1px #222;
}

.signup input.email[type="text"], .signup input[type="password"] {
	width: 90%;
	padding: 5px;
	margin: 10px 0;
	outline: none;
	background: #EBEBEB;
	border: solid 1px #222;
}



@media ( max-width :1440px) {
	#small-dialog1 {
		padding: 5em 3em;
	}
}

@media ( max-width :1280px) {
	#small-dialog1 {
		padding: 4em 3em;
	}
}

@media ( max-width :991px) {
	#small-dialog1 {
		padding: 3em 2.5em;
	}
}

@media ( max-width :768px) {
	#small-dialog1 {
		padding: 2.5em 2em;
	}
}

@media ( max-width :736px) {
	#small-dialog1 {
		padding: 2em 1.5em;
	}
}

@media all and (max-width:667px) {
	.mfp-inline-holder .mfp-content, .mfp-ajax-holder .mfp-content {
		width: 83%;
	}
}

@media all and (max-width:600px) {
	.mfp-inline-holder .mfp-content, .mfp-ajax-holder .mfp-content {
		width: 90%;
	}
}

@media all and (max-width:568px) {
	#small-dialog, #small-dialog1 {
		max-width: 425px;
	}
}

@media all and (max-width:480px) {
	.mfp-inline-holder .mfp-content, .mfp-ajax-holder .mfp-content {
		width: 94%;
	}
	.comments-area textarea {
		height: 100px;
	}
	.login input[type="submit"], .signup input[type="submit"] {
		font-size: 14px;
		width: 20%;
	}
	.mfp-close {
		left: 0;
	}
	@media all and (max-width:440px) {
	}
	@media all and (max-width:375px) {
	}
	@media all and (max-width:320px) {
		.comments-area span.label, .comments-area span.text-field {
			float: none;
			width: 100%;
		}
		.comments-area span {
			padding-bottom: 3px;
		}
		.comments-area input[type="text"], .comments-area textarea {
			width: 92%;
		}
		.comments-area div {
			padding: 2px 0;
		}
		.mfp-content iframe {
			width: 100%;
			min-height: 250px;
		}
		.login input[type="submit"], .signup input[type="submit"] {
			font-size: 12px;
			width: 29%;
		}
		.signup input[type="text"] {
			width: 90%;
		}
		.mfp-close {
			right: 2px;
			top: -30px;
		}
	}
}
.img_area{
	padding: 20px;
}

.select_img{
	padding: 15px;
}

.btemail{
	width: 40px;
	height:30px;
}


/* 중복아이디 존재하지 않는경우 */
.id_input_re_1 {
	color: green;
	display: none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2 {
	color: red;
	display: none;
}
.box-file-input label{
  display:inline-block;
  background:#23a3a7;
  color:#fff;
  padding:0px 15px;
  line-height:35px;
  cursor:pointer;
}

.box-file-input label:after{
  content:"파일등록";
}

.box-file-input .file-input{
  display:none;
}

.box-file-input .filename{
  display:inline-block;
  padding-left:10px;
}
.btimg{
	border: none;
	background-color: white;
	width: 40%;
	padding: 20px -10px;
	letter-spacing: 1px;
	transition: 0.5s all;
	margin: 20px 20px 0px;
	-webkit-transition: 0.5s all;
	-o-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-ms-transition: 0.5s all;
}
</style>
</head>
<body>
	<h1 class="header-w3ls">회원가입</h1>
	<div class="art-bothside">
		<div class="mid-cls">
			<div class="art-right-w3ls">
				<form onsubmit="return checkForm()" action="/member/main/regist" method="post"
					enctype="multipart/form-data">
					<div class="main">
						<div class="form-left-to-w3l">
							<input class="id_input" type="text" name="user_id"
								placeholder="ID" required=" 숫자, 영문 대소문자만 가능합니다." maxlength='15'>
						</div>
						<div>
							<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
								class="id_input_re_2">아이디가 이미 존재합니다.</span>
						</div>
						<div class="main">
							<div class="form-left-to-w3l">
								<input type="password" name="password" placeholder="Password"
									id="password" required="" maxlength='15' minlength = "6">
								<div class="clear"></div>
							</div>
							<div class="form-right-w3ls ">
								<input type="password" placeholder="Confirm Password"
									id="confirm_password" required="" maxlength='15' minlength = "6">
							</div>
						</div>
						<div class="form-left-to-w3l">
							<input type="text" name="name" placeholder="Name" required="" maxlength='15'>
						</div>
						<div class="form-left-to-w3l">
							<input type="text" name="storename" placeholder="상점에 이용하실 상점명을 입력하세요."
								required="" maxlength='15'>
						</div>
						<div class="form-left-to-w3l">
							<input type="hidden" name="store_id" id="store_id" required=""
								value="" readonly>
						</div>
						<!-- 
						<div class="form-left-to-w3l">
							<input type="text" name="phone" id="phone" placeholder="phone"
								required="" maxlength="13">
						</div>
						 -->
						<div class="form-left-to-w3l">
							<input type="text" id="sample6_postcode" placeholder="우편번호"
								readonly> <input type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample6_address" placeholder="주소" readonly><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소"
								name="" maxlength="20"> <input type="text" id="sample6_extraAddress"
								placeholder="참고항목" readonly> <input type="hidden"
								name="addr" placeholder="addr" required="" value="">
						</div>
						<!-- 
						<div class="mail_check_wrap">
						<div class="form-right-w3ls">
							<input type="email" name="email" id="email" class="email" placeholder="Email" required=""
								onmousedown="sendAddr()" maxlength='25'>
						</div>
						 -->
						<!-- 
							<input type="button" name="btemail" id="btemail" class="btemail" value="이메일 인증"><br>
							<input type="text" name="writechk" class="writechk" id="writechk" value="" style="margin: 10px 0px 0px 0px;" ><br>
							<span id="explainsp" style="padding:8px; display:inline-block; color:red">*메일로 보내드린 인증번호 6자리를 입력해주세요*</span>
							<input type="hidden" name="emailchk" class="emailchk" id="emailchk" value="">

						</div>
							-->
						</div>
			</div>
			<div class="art-left-w3ls">
				<h3 style="color:#2b96a4; font-size:35px; font-weight: bold; font-family: '굴림';">상점에 이용할 사진을 선택해주세요!</h3>
				<br>
				<div class="select_img">
					<img style="width: 400px; height: 400px; border: 2px gray solid; border-radius: 70%;"
						id="thumb" class="thumb"
						src="/resources/img/basic.png"
						alt="" value="<%=request.getRealPath("/")%>">
						<!-- 
				<div class="img_area">
					<input type="file" name="photo" required="" id="photo" /><br>
					</div>
					-->
					<br>
					<div class="box-file-input">
					<label><input type="file" name="photo" id="photo" class="file-input" accept="image/*"></label>
					<input type="hidden" value="0" name="filecheck">
					<div id="filename" class="filename">파일을 선택해주세요.</div>
					<!--  <input type="file" name="photo" required="" id="photo" />		-->			
					</div>
					<br>
					<div class="btnn">
						<button type="submit" class="btimg"><img src="/resources/img/signup.png" alt="" style="width:100%; height:230px; cursor:pointer;" title="회원가입"></button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	<script>
	//비밀번호 확인
		var password = document.getElementById("password"), confirm_password = document
				.getElementById("confirm_password");

		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Passwords Don't Match");
			} else {
				confirm_password.setCustomValidity('');
			}
		}

		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;

	</script>
	<script>
	//submit 전 체크
	function checkForm() {
		console.log($(".box-file-input input[name='filecheck']").val());
		if($(".box-file-input input[name='filecheck']").val()==0){
			alert("상점의 사진을 선택해주세요!");
			return false;
		}else{
			sendAddr(); //주소 채우기
			return true;
		}
	}
		// Random Code 생성
		$('input[name=store_id]')
				.attr(
						'value',
						function randomString() {
							const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz{}!?_+/'
							const stringLength = 6
							let randomstring = ''
							for (let i = 0; i < stringLength; i++) {
								const rnum = Math.floor(Math.random()
										* chars.length)
								randomstring += chars.substring(rnum, rnum + 1)
							}
							return randomstring
						});

		//아이디 중복검사
		$('.id_input').on(
				"propertychange change keyup paste input",
				function() {

					//console.log("keyup 테스트");
					var memberId = $('.id_input').val(); // .id_input에 입력되는 값
					var data = {
						user_id : memberId
					} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
					console.log("데이터는?" + memberId);
					$.ajax({
						type : "post",
						url : "/member/memberIdChk",
						data : data,
						success : function(result, status, xhr) {
							// console.log("성공 여부" + result);
							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
							}
						}// success 종료
					}); // ajax 종료
				});// function 종료
				
				/*
				//핸드폰번호 자동 하이픈 생성
				$(document).on("keyup", "#phone", function() {
					$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
				});
				*/
				
				//파일이름
				$(document).on("change", ".file-input", function(){
					   
				    $filename = $(this).val();

				    if($filename == "")
				      $filename = "파일을 선택해주세요.";

				    $(".filename").text($filename);

				  });
				
				//메인 이미지를 변경했을 때 Thumb 화면이 바뀌게 되며
				//이미지 파일을 취소한 경우 기본 이미지인 득근 마켓으로 변경된다.
				$("#photo").on("change", function(e){
					if($("#photo").val() != ""){
						if(!checkImg($("#photo").val())){
							$("#photo").val(null);
							alert("죄송합니다. 득근 마켓은 [jpg]와 [png]의 확장자 파일만을 지원합니다.", function(){});
						}else{
							alert("사용 가능한 이미지 파일입니다.", function(){});
							//이미지 저장하고 화면에 출력하기
							showThumb(e.target); //썸네일 출력하기
							
							console.log($(".box-file-input input[name='filecheck']").val());
							$(".box-file-input input[name='filecheck']").val(1);
							console.log($(".box-file-input input[name='filecheck']").val());
						}
					}else{
						//이미지가 안올려져 있다면 기본 이미지로 수정
						$("#thumb").attr("src", "/resources/img/basic.png");
					}
				});
				
				//이미지의 확장자가 유효한지 검사
				function checkImg(imgname){
					var lastIndex = imgname.lastIndexOf(".");
					var ext = imgname.slice(lastIndex+1, imgname.length); //확장자 구하기
					if(ext.toUpperCase() == "PNG" || ext.toUpperCase() == "JPG"){
						return true;
					}else{
						return false;
					}
				}
				
				//선택한 이미지를 미리보기 화면에 띄우기
				function showThumb(input){
					var reader = new FileReader();
					reader.onload = e => {
						var thumbImg = document.getElementById("thumb");
						thumbImg.src = e.target.result;
					}
					reader.readAsDataURL(input.files[0]);
				}
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    //주소합치기
    function sendAddr(){
    	$("input[name='addr']").val(
    			$("#sample6_postcode").val()+"/"+$("#sample6_address").val()+"/"+$("#sample6_detailAddress").val()+"/"+$("#sample6_extraAddress").val()
        	);
    }

</script>
</body>
</html>