<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<% 
	Member member = (Member) session.getAttribute("member");
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" alt></script>
<!-- bootbox cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
<!-- 아이콘 처리 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- bootbox cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
<style>
.container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}

.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%;
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}

</style><script>
var ws = null;
var msg_history = null;


function openSocket(){ //대화를 위한 소켓 오픈
	if(ws !== null){
        writeResponse("WebSocket is already opened.");
        return;
    }
    //웹소켓 객체 만드는 코드
    ws = new WebSocket("ws://localhost:9999/used/chat");
    ws.onopen = function(event){
        if(event.data === undefined){
        	writeResponse("대화방에 연결 됐습니다.");
      		return;
        }
        writeResponse(event.data);
    };
    
    //메시지를 수신 받는 곳
    ws.onmessage = function(event){
    	console.log("내가 수신 받는 메시지"+event.data);
    	var list = event.data.split(",");
    	console.log("list : "+list);
    	var sender = list[0];
    	console.log("sender : "+sender); //0이면 내가 보낸 메시지
    	var name = list[1];
    	console.log("name : "+name);
    	var msg = list[2];
    	console.log("msg : "+msg);
    	
    	if(sender == 0){ //내가 보낸 메시지
    		myMsg(name, msg);
    	} else if(sender == 1){ //상대가 보낸 메시지
    		yourMsg(name, msg);
    	}else { //메시지 종류가 아니라면
    		writeResponse(event.data);    		
    	}
    };
    
    ws.onclose = function(event){
    }
}

//메시지 전송
function send(){
	var text = document.getElementById("messageinput").value+",<%=member.getStorename()%>";
	console.log("send()함수 호출 입니다. 전송 값은 : "+text);
	ws.send(text);		 //메시지 전송
	text = "";
	document.getElementById("messageinput").value = "";
}
 
function closeSocket(){
	ws.close();
}
 
function writeResponse(text){
	msg_history.innerHTML += "<br/>"+text;
}
 
function clearText(){
	console.log(msg_history.parentNode);
	msg_history.parentNode.removeChild(msg_history);
}

function myMsg(name, msg){
	var date = new Date();
	var hours = date.getHours(); // 시
	var minutes = date.getMinutes();  // 분
	var seconds = date.getSeconds();  // 초

	var year = date.getFullYear(); // 년도
	var month = date.getMonth() + 1;  // 월
	var date = date.getDate();  // 날짜

	var time = hours+" : "+minutes+" : "+seconds+" | "+year+"-"+month+"-"+date;
	
	var tag = "<div class='outgoing_msg' style='margin-top : 20px;'>";
	tag += "<div class='sent_msg'>";
	tag += "<p>["+name+"] : "+msg+"</p>";
	tag += "<span class='time_date'> "+time+" </span>";
	tag += "</div>";
	tag += "</div>";
	msg_history.innerHTML += tag;
	$("#msg_history").scrollTop($("#msg_history")[0].scrollHeight); //스크롤 제일 아래로 이동
}

function yourMsg(name, msg){
	var date = new Date();
	var hours = date.getHours(); // 시
	var minutes = date.getMinutes();  // 분
	var seconds = date.getSeconds();  // 초

	var year = date.getFullYear(); // 년도
	var month = date.getMonth() + 1;  // 월
	var date = date.getDate();  // 날짜

	var time = hours+" : "+minutes+" : "+seconds+" | "+year+"-"+month+"-"+date;
	
	var tag = "<div class='incoming_msg' style='margin-top : 20px;'>";
	tag += "<div class='received_msg'>";
	tag += "<div class='received_withd_msg'>";
	tag += "<p>["+name+"] : "+msg+"</p>";
	tag += "<span class='time_date'> "+time+" </span>";
	tag += "</div>";
	tag += "</div>";
	tag += "</div>";
	msg_history.innerHTML += tag;
	$("#msg_history").scrollTop($("#msg_history")[0].scrollHeight);
}


$(function(){
	bootbox.alert("단체 채팅방은 페이지 새로 고침, 이동 시 대화 기록이 사라집니다.", function(){
		msg_history = document.getElementById("msg_history");
		openSocket();		
	});
	
	//엔터로 채팅 보내기
	document.getElementById("messageinput").addEventListener("keyup", function(){
		if(event.keyCode == 13){
			send();
		}
	});
});
</script>
</head>
<body onbeforeunload="javascript:closeSocket()">
	<%@ include file="../../inc/top_navi.jsp" %>
	<%@ include file="../inc/top_navi.jsp" %>
	<%@ include file="../inc/side_controll.jsp" %>
<!-- <input type="text" id="receiver" value="">  --><!-- 메세지를 받게 될 사람의 아이디 넣기 -->
<div class="container">
	<div class="messaging">
		<div class="inbox_msg">
			<div class="inbox_people">
			<div class="headind_srch">
				<div class="recent_heading">
					<h2>채팅목록</h2>
				</div>
			</div>
			<div class="inbox_chat">
			
			 <!-- 채팅 방 한건 시작  -->
			<div class="chat_list">
				<div class="chat_people">
					<div class="chat_img"> <img src="https://cdn0.iconfinder.com/data/icons/education-flat-7/128/37_Basketball-256.png" alt="sunil"> </div>
					<div class="chat_ib">
						<h5>[상대의 상점이름] <span class="chat_date">마지막 대화 시간 올 예정</span></h5>
						<p>여기에 마지막으로 나눈 대화 내용 올 예정</p>
					</div>
				</div>
			</div>
			</div>
			<!-- 채팅 방 한건 끝  -->

			</div>
			<div class="mesgs">
				<div class="msg_history" id ="msg_history">
					                 
					<!-- 조건문을 통해 내가 보낸 메시지 라면...
					<div class="outgoing_msg">
						<div class="sent_msg">
							<p>Test which is a new approach to have all
							  solutions</p>
							<span class="time_date"> 11:01 AM    |    June 9</span>
						</div>
					</div>
					<!-- 내가 보낸 메시지 끝 -->
					
					<!-- 상대가 보낸 메세지라면 
					<div class="incoming_msg">
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>Test, which is a new approach to have</p>
								<span class="time_date"> 11:01 AM    |    Yesterday</span>
							</div>
						</div>
					</div>
					<!-- 상대가 보낸 메시지 끝 -->
				  
				
				</div>
				<div class="type_msg">
					<div class="input_msg_write">
						<input type="text" class="write_msg" id="messageinput" placeholder="Type a message" />
						<button class="msg_send_btn" type="button" onclick="send()"><i class="fas fa-paper-plane"></i></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>