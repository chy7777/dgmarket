<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>중고 상품 등록페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>

<style>
.wrapper {
	width: 70%;
	margin: auto;
}

.thumb_container {
	width: 100%;
	height: 500px;
	background-size: 100% 500px;
}

hr {
	border: 0px;
	height: 3px;
	background: black;
	width: 100%;
}

.table-active {
	width: 30%;
	box-sizing: border-box;
}

ul {
	padding: 2px 0;
}

ul li {
	display: inline-block;
	margin: 0 2px;
	font-size: 16px;
	letter-spacing: -.5px;
}

ul li.tag-item{
	padding : 2px 6px;
	color: black;
}

.tag-item:hover {
	background-color: #262626;
	color: #fff;
}

.del-btn {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
}

</style>
<script>
	var tag = {};
	var counter = 0;
   
	$(document).ready(function(){
		
		//등록 버튼을 눌렀을 때 호출
		$("#registBt").on("click", function(){
			if(registCheck()){regist();}
			
		});
		
		//메인 이미지를 변경했을 때 Thumb 화면이 바뀌게 되며
		//이미지 파일을 취소한 경우 기본 이미지인 득근 마켓으로 변경된다.
		$("#mainImg").on("change", function(e){
			if($("#mainImg").val() != ""){
				if(!checkImg($("#mainImg").val())){
					$("#mainImg").val(null);
					bootbox.alert("죄송합니다. 득근 마켓은 [jpg]와 [png]의 확장자 파일만을 지원합니다.", function(){});
				}else{
					bootbox.alert("사용 가능한 이미지 파일입니다.", function(){});
					//이미지 저장하고 화면에 출력하기
					showThumb(e.target); //썸네일 출력하기
				}
			}else{
				//이미지가 안올려져 있다면 기본 이미지로 수정
				$("#thumb").attr("src", "https://user-images.githubusercontent.com/67699933/126874025-4002c1e3-6105-4489-9325-8bf03b7233f0.png");
			}
		});
		
		$("#subImg").on("change", function(){
			if($("#subImg").val() != ""){ //만약 파일이 올려져 있다면
				if(!checkImg($("#subImg").val())){ //파일의 확장자명이 유효하지 않다면
					$("#subImg").val(null);
					bootbox.alert("죄송합니다. 득근 마켓은 [jpg]와 [png]의 확장자 파일만을 지원합니다.", function(){});
				}else{ //파일의 확장자명이 유효할 때
					bootbox.alert("사용 가능한 이미지 파일입니다.", function(){});
					
				}					
			}
		});
		
		//태그를 입력하고 스페이스 바 or enter키 입력 시 동작하며
		//태그를 추가하는 작업을 진행한다.
		$("#input_tag").on("keypress", function (e) {
			var self = $(this);
			// input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
			if (e.key === "Enter" || e.keyCode == 32) {
				var tagValue = self.val(); // 값 가져오기
				
				// 입력 값이 없으면 동작 불가능
				if (tagValue !== "") {
					//태그의 최대 갯수는 4로 제한
					if($("li").length < 4){
						// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
						var result = Object.values(tag).filter(function (word) {
							return word === tagValue;
						});
						
						//태그 중복 검사
						if (result.length == 0) { 
							$("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' index='"+counter+"'>x</span></li>");
							addTag(tagValue);
							self.val("");
							createTagArr();
						} else {
							bootbox.alert("태그가 중복 됩니다.", function(){});
						}
					}else{
						bootbox.alert("태그는 최대 4개 등록 가능합니다.", function(){});
					}
				}
				e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
			}
		});

        //글씨 뒤에 있는 x글자 클릭 시 삭제 기능
        $(document).on("click", ".del-btn", function (e) {
            var index = $(this).attr("index");
            tag[index] = "";
            $(this).parent().remove();
			createTagArr();

        });
	});


	//제품을 등록하기 전 유효성 검사 진행
	//상품명, 가격, 상품설명, 메인 이미지의 존재 여부에 대한 유효성 등 진행
	function registCheck(){
		if($("input[name='used_product_name']").val().trim() == ""){ // 상품명 입력했는지
			bootbox.alert("상품명을 입력해주세요.", function(){});
		}else if($("input[name='used_product_price']").val().trim() == ""){ //가격 입력 검사 
			bootbox.alert("상품의 가격을 입력해주세요.", function(){});
		}else if(isNaN($("input[name='used_product_price']").val())){ //가격 숫자입력 했는지
			bootbox.alert("가격은 숫자만 입력하세요.", function(){})
		}else if($("textarea[name='used_product_detail']").val().length < 15){ //상품 설명의 길이
			bootbox.alert("상품 설명은 최소 15자 이상 입력해주세요.", function(){});
		}else if($("input[name='mainImg']").val() == null || $("input[name='mainImg']").val() == ""){
			bootbox.alert("메인 이미지를 선택 해주세요.", function(){});
		}else{
			if($("input[name='tag']").val() == "" || $("input[name='tag']").val() == null){
				bootbox.confirm("Tag를 추가하시면 상품이 더 많은 사용자에게 노출됩니다.<br>tag없이 등록 하시겠습니까?", function(flag){
					if(flag) regist();
				});
			}else{
				regist();
			}
		}
		
	}
	
	//등록 버튼을 눌렀을 때 상품 등록을 요청한다.
	function regist() {
		$("form").attr({
			"action" : "/member/used/product/regist",
			"method" : "post",
			"enctype" : "multipart/form-data"
		});
		$("form").submit();
	}
	
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
	
	//태그 비동기 방식으로 추가.
	function addTag (value) {
		tag[counter] = value; // 태그를 Object 안에 추가
		counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	}

	//tag 안에 있는 값을 하나의 뭉치로 만들어서 value에 담는다.
	//이 value를 전달 받은 controller에서 split을 통해 나눌 예정
	function createTagArr () {
		var list = document.getElementById("tag-list").getElementsByTagName("li");
		var result = "";
		for(var i = 0; i < list.length; i++){
			if(i == list.length-1){
				var val = (list[i].innerText).slice(0, list[i].innerText.length-1);
				result += val;
			}else{
				var val = (list[i].innerText).slice(0, list[i].innerText.length-1);
				result += val+",";
			}
		}
		$("#tag").val(result);
		console.log($("#tag").val());
	}
	
</script>
</head>
<body>
	<!-- 득근 마켓 top_navi -->
	<%@ include file="../../inc/top_navi.jsp" %>
	<!-- 중고거래 top_navi -->
	<%@ include file="../inc/top_navi.jsp" %>
	<!-- 중고거래 side_controll -->
	<%@ include file="../inc/side_controll.jsp"  %>
	
	<!-- 전체를 감싸는 컨테이너 -->
	<div class="wrapper">
		<h2 style="margin-top: 35px;">
			<strong>제품 등록</strong>
		</h2>

		<hr>
		<!-- 제품 등록을 위한 컨테이너 -->
		<div class="row text-center">
			<!-- 등록할 제품 이미지의 썸네일을 보여줄 컨테이너 -->
			<div class="col-xl-6">
				<img style="width: 100%; height: 670px; border: 2px black solid;"
					id="thumb" src="https://user-images.githubusercontent.com/67699933/126874025-4002c1e3-6105-4489-9325-8bf03b7233f0.png" alt="">
			</div>
			<!-- 제품 등록을 위한 컨테이너 -->
			<div class="col-xl-6" style="font-size: 23px;">
				<!-- 제품등록을 위한 입력 폼 -->
				<form>
					<!-- 데이터 전송 시 가져 갈 등록자 정보 -->
					<input type="hidden" name="member_id" value="<%=member.getMember_id()%>">
					
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="table-active" style="vertical-align: middle;">제품명</td>
								<td><input type="text" name="used_product_name"
									maxlength="20" placeholder="제품명을 입력하세요." style="width: 90%;">
									<label for="" style="font-size: 13px; color: red;">*제품명은
										1자부터 최대 20자까지 등록 가능합니다.</label></td>
							</tr>
							<tr>
								<td class="table-active" style="vertical-align: middle;">판매가격</td>
								<td><input type="text" name="used_product_price"
									maxlength="6" placeholder="가격을 입력하세요." style="width: 90%;">
									<label for="" style="font-size: 13px; color: red;">*등록 가능한 금액은 100원 ~ 999,999원입니다.</label></td>
							</tr>
							<tr>
								<td class="table-active" style="vertical-align: middle;">제품설명</td>
								<td><textarea name="used_product_detail" maxlength="100"
										style="width: 100%; height: 150px;" name="used_product_detail" id=""></textarea>
									<label for="" style="font-size: 13px; color: red;">*제품
										설명 외의 내용 기재 시 게시물이 삭제 될 수 있습니다.</label></td>
							</tr>
							<tr>
								<td class="table-active" style="vertical-align: middle;">대표이미지</td>
								<td><input type="file" name="mainImg" id="mainImg"
									style="font-size: 18px;"></td>
							</tr>
							<tr>
								<td class="table-active" style="vertical-align: middle;">추가이미지</td>
								<td><input type="file" name="subImg" id="subImg"
									style="font-size: 18px;"></td>
							</tr>
							<tr height="113px">
								<td style="vertical-align: middle;" class="table-active">
									<input type="hidden" name="tag" id="tag"></input>
            						<input type="text" id="input_tag" maxlength="8" size="15" placeholder="태그입력" />
								</td>							
								<td>
									<ul id="tag-list">
        							</ul>
								</td>							
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="btn-group"
				style="width: 40%; margin: auto; margin-top: 15px;">
				<!-- 찜 갯수 넣기 사용자가 찜을 했는지 안했는지에 따라 버튼과 뱃지 색 바꾸기 -->
				<button type="button" id="registBt" class="btn btn-secondary">등록하기</button>
				<button type="button" class="btn btn-secondary"
					onclick="location.href='/member/used/main'">돌아가기</button>
			</div>
		</div>
		<hr>
	</div>
</body>
</html>