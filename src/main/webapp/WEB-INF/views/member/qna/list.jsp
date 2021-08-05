<%@page import="ga.dgmarket.gymshopping.domain.Qna"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member member = (Member) session.getAttribute("member");
	List<Qna> qnaList = (List)request.getAttribute("qnaList");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#myInput {
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 89%;
	font-size: 16px;
	padding: 8px 15px 3px 10px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#mySelect{
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 10%;
	padding: 6px 15px 2px 10px;
	font-size: 18px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable {
border-collapse: collapse;
width: 100%;
border: 1px solid #ddd;
font-size: 18px;
}
#myTable th, #myTable td {
text-align: center;
padding: 15px;
font-weight: bold;
}

#myTable tr {
border-bottom: 1px solid #ddd;
}

#myTable tr.qna_header, #myTable tr:hover {
background-color: #f1f1f1;
}


body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

.reply_bt{
	background-color: #04AA6D;
	color: white;
	padding: 0;

	border: none;
	cursor: pointer;
	opacity: 0.9;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 아이콘 처리 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- bootbox cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
<!-- 커스텀 CSS -->
<link rel="stylesheet" href="/resources/css/style.css">
<!-- 폰트어썸 -->
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script>
function myFunction() {
	var input, filter, table, tr, td, i, txtValue;
	input = document.getElementById("myInput");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable");
	tr = table.getElementsByTagName("tr");

	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[$("#mySelect").val()];
		if (td) {
			txtValue = td.textContent || td.innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}       
	}
}

var modal = document.getElementById('id01');
var modal2 = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}else if(event.target == modal2){
		modal2.style.display = "none";
	}
}

//게시글 등록
function regist(){
	if($("#notice_content").val() == ""){
		bootbox.alert("댓글을 입력해주세요.", function(){});
		return;
	}
	$("#form1").attr({
		action : "/member/qna/regist",
		method : "POST"
	});
	$("#form1").submit();
}

//댓글 등록 요청
function reply(){
	if($("#reply_content").val() == ""){
		bootbox.alert("댓글을 입력해주세요.", function(){});
		return;			
	}
	$("#form2").attr({
		action : "/member/qna/reply",
		method : "POST"
	});
	$("#form2").submit();
	
}

//댓글 더보기
function showReply(tr){
	if($('.'+tr).is(":visible")){ //display none이 아닐 경우
		$('.'+tr).css("display", "none");
	}else{ //none일 경우
		$('.'+tr).css("display", ""); //크롬이나 표준 에서는 block을 명시하지 않고 비워둬야함....
	};
}

//댓글 폼을 전송하기 전에 내가 선택한 행의 qna_id를 val에 넣어 전송
function changeQna_id(qna_id){
	$("#form2_qna_id").val(qna_id);
}

//원글 삭제하기
function deleteQna(qna_id){
	bootbox.confirm("게시글을 삭제하시겠습니까?", function(e){
		if(e){
			$.ajax({
				url : "/member/qna/delete",
				type : "post",
				data : {
					"qna_id" : qna_id
				},
				success : function(result){
					bootbox.alert("삭제를 완료했습니다.", function(){
						location.href="/member/qna/list";	
					});						
				}
			});
		}
	});
}

//댓글 삭제하기
function deleteReply(qna_id){
	bootbox.confirm("댓글을 삭제하시겠습니까?", function(e){
		if(e){
			$.ajax({
				url : "/member/qna/reply/delete",
				type : "post",
				data : {
					"qna_id" : qna_id
				},
				success : function(result){
					bootbox.alert("삭제를 완료했습니다.", function(){
						location.href="/member/qna/list";	
					});			
				}
			});
		}
	});
}

function loadNotice(){
    $(".main_notice:hidden").slice(0, 10).show();
    if($(".main_notice:hidden").length == 0){
        $("#notice_bt").css("display", "none");
    }
}

$(function(){
	loadNotice();
});
</script>
</head>
<body>
	<%@ include file="../inc/top_navi.jsp" %>
<!-- 케러셀 시작 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: 0px">
		<%@include file="../inc/carousel.jsp" %>
	</div>
<div style="width: 80%; margin: auto;">
<select name="" id="mySelect">
	<option value="1" selected>내용</option>
	<option value="2">작성자</option>
	<option value="3">작성일시</option>
</select>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="게시글의 제목이나 내용을 검색하세요" title="Type in a name">
</div>

<table id="myTable" style="text-align: center; width: 80%; margin: auto">
	<tr>
		<th></th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일시</th>
		<th></th>
	</tr>
	<% for(Qna qna : qnaList) {%> <!-- 꺼내온 게시글 만큼 돌리기 -->
		<% String regdate = qna.getRegdate().substring(0, 10); %>		
		<% if(qna.getDepth() == 0 ){ %> <!-- 원글이라면 -->
			<tr class="main_notice" style="background-color: #f2f2f2; display: none;">
				<td><button id="<%= qna.getQna_id() %>" class="reply_bt" onclick="document.getElementById('id02').style.display='block'; changeQna_id(<%= qna.getQna_id() %>)">답변달기</button></td>
			<% if(qna.getMember_id() == member.getMember_id()){ %> <!-- 내가 작성한 글이라면 -->
				<td onclick="deleteQna(<%=qna.getQna_id()%>)"><%= qna.getContent() %></td>
			<% } else {%><!-- 내가 작성한 글이 아니라면 -->
				<td><%= qna.getContent() %></td>
			<% } %>
			<%if(qna.getUser_grade() == 7){ %> <!-- 탈퇴한 회원이라면 -->
				<td>[탈퇴한 회원]</td>
			<%} else{ %>
				<td>[<%= qna.getWriter() %>]</td>
			<% } %>
				<td>[<%= regdate %>]</td>
				<td onclick="showReply('tr<%=qna.getTeam()%>')">댓글보기[<%= qna.getCnt() %>]</td>
			</tr>
		<% } else { %> <!-- 댓글이라면 -->
			<tr class="tr<%=qna.getTeam()%>" style="display: none;">			
				<td>
					<img alt=""  width="50px"
						src="https://user-images.githubusercontent.com/67699933/127851598-34f615cd-0a57-407a-b4ab-ef696e553146.png">
				</td>
			<% if(qna.getMember_id() == member.getMember_id()) { %><!-- 내가 작성한 댓글이라면 -->
				<td onclick="deleteReply(<%=qna.getQna_id()%>)"><%= qna.getContent() %></td>
			<% } else { %> <!-- 내가 작성한 댓글이 아니라면 -->
				<td><%= qna.getContent() %></td>
			<% } %>
			<%if(qna.getUser_grade() == 7){ %> <!-- 탈퇴한 회원이라면 -->
				<td>[탈퇴한 회원]</td>
			<%} else{ %>
				<td>[<%= qna.getWriter() %>]</td>
			<% } %>
				<td>[<%= regdate %>]</td>
				<td></td>
			</tr>
		<% } %>
	<% } %>
	<tr>
		<td colspan="6">
			<button onclick="document.getElementById('id01').style.display='block'" style ="width: 10%; float: right;">게시글 작성</button>
			<button onclick="loadNotice()" id="notice_bt" style ="width: 10%">더보기</button>
		</td>
	</tr>
</table>

<div id="id01" class="modal">
	<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	<form id="form1" class="modal-content">
		<div class="container">
			<h1>게시글 작성하기</h1>
			<hr>
			<label for="psw-repeat"><b>내용</b></label>
			<textarea id="notice_content"  maxlength="50" cols="30" rows="10" name="content" style="width: 100%;" placeholder="게시글의 내용을 입력하세요."></textarea>
			<input type="hidden" name="member_id" value=<%=member.getMember_id()%>>
			<div class="clearfix">
				<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
				<button type="button" class="signupbtn" onclick="regist()">등록</button>
			</div>
		</div>
	</form>
</div>

<div id="id02" class="modal">
	<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
	<form id="form2" class="modal-content">
		<div class="container">
			<h1>답글 작성하기</h1>
			<hr>
			<label for="psw-repeat"><b>답변의 내용을 입력하세요.</b></label>
			<textarea id="reply_content" maxlength="50" cols="30" rows="10" name="content" style="width: 100%;" placeholder="게시글의 내용을 입력하세요."></textarea>
			<input type="hidden" name="member_id" value=<%=member.getMember_id()%>>
			<input type="hidden" name="qna_id" id="form2_qna_id" value="">

			<div class="clearfix">
				<button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">취소</button>
				<button type="button" class="signupbtn" onclick="reply()">등록</button>
			</div>
		</div>
	</form>
</div>
	<!--  푸터 시작   -->
	<%@include file="../inc/footer.jsp" %>
	<!--  푸터 끝   -->
</body>
</html>
