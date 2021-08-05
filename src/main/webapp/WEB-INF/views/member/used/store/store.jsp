<%@page import="ga.dgmarket.gymshopping.domain.UsedReview"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedProductImg"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
	Map<String, Object> storeMap = (Map)request.getAttribute("storeMap");
	
	Member storeMember = (Member)storeMap.get("member");
	List<UsedProductImg> productList = (List)storeMap.get("productList");
	List<UsedProductImg> favoritesList = (List)storeMap.get("favoritesList");
	List<UsedReview> reviewList = (List)storeMap.get("reviewList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=storeMember.getStorename() %></title>
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
<style>
.wrapper{
    margin: auto;
    width: 60%;
    border-left: 2px solid black;
    border-right: 2px solid black;
    border-top: 2px solid black;
    border-bottom : 2px solid black;
    margin-top: 35px
}

.user_container{
    border: 2px solid black;
    width : 40%;
    margin : auto;
    border-radius: 7px;
}

.content_container{
    width : 90%;
    margin-top: 50px;
    padding-left : 35px;
    padding-right: 35px;
    margin : auto;
}
.card img{
    width: 100%;
    height: 200px;
}

.reviewTr{
	display: none;
}

</style>
<script>

$(function(){
	loadReview();
});

//상점 ID 복사하기
function copyLink(){
    var linkText = document.getElementById("link");
    linkText.setAttribute("type" , "text");
    linkText.select();
    document.execCommand("copy");
    linkText.setAttribute("type" , "hidden");
    bootbox.alert("상점-ID 복사를 완료했습니다.", function(){});
}

//리뷰 등록하기
function registReview(){
	$.ajax({
		"url" : "/member/used/store/review/regist",
		"type" : "post",
		data : {
			"member_id" : <%=storeMember.getMember_id()%>, 
			"writer_id" : <%=member.getMember_id()%>,
			"content" : $("input[name='content']").val()
		},
		success : function (result, xhr, status){
			bootbox.alert("리뷰를 등록했습니다.", function(){
				location.href = "/member/used/store?member_id=<%=storeMember.getMember_id()%>"; //새로고침			
			});
		},
		error : function(status, xhr, er)	{
		}	
	});
}

//내가 쓴 리뷰 한 건 삭제
function deleteReview(used_review_id){
	
	bootbox.confirm("리뷰를 삭제하시겠습니까?", function(flag){
		if(flag){ //리뷰 삭제를 원한다면.
			$.ajax({
				"url" : "/member/used/store/review/delete?used_review_id="+used_review_id,
				"type" : "GET",
				success : function (result, xhr, status){
					bootbox.alert("리뷰를 삭제했습니다.", function(){
						location.href = "/member/used/store?member_id=<%=storeMember.getMember_id()%>"; //새로고침			
					});
				},
				error : function(status, xhr, er)	{
				}	
			});	
		}
	});
}

function loadReview(){
	console.log($(".reviewTr:hidden").length);
    $(".reviewTr:hidden").slice(0, 4).show();
    if($(".reviewTr:hidden").length == 0){
        $("#load").css("display", "none");
    }
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
	
    <!-- 상점의 주소를 복사할 수 있는 주소 링크를 담아놓는 곳 -->
    <!-- session을 조회해서 상점ID 넣기 currTime으로 주소 구하면 될 듯 -->
    <div class="wrapper text-center" style="padding-top: 50px;">
	    <input type="hidden" id="link" value="<%=storeMember.getStore_id()%>">
        <!-- 상점 주인의 정보를 나타내는 박스 -->
        <div class="user_container">
            <!-- 회원가입을 할 때 등록한 사진이 들어올 곳 : 사진이 저장되는 곳 물어보기 (하연)----------------------------------------------------------------------------->
            <img src="/resources/data/<%=storeMember.getProfile_img() %>" class="rounded-circle" style="margin-top: 25px;" alt="Cinque Terre" width="304" height="236"> 
            <div class="alert alert-success" style="width: 100%; margin: auto; margin-top: 25px;">
                <!-- 상점명이 들어올 곳! -->
                <strong>[<%=storeMember.getStorename() %>]님의 상점<a href="javascript:copyLink();"><i class="far fa-copy" style="margin-left: 5px;"></i></a></a></strong> 
            </div>
        </div>

        <!-- 개인상점에서 카테고리를 선택할 수 있는 네비 -->
        <div class="category_container" style="margin: auto; width: 100%; margin-top: 20px; margin-bottom: 20px;">
            <ul class="nav justify-content-center">
                <%  if(member.getMember_id()==storeMember.getMember_id()) { %> <!-- 본인의 상점일 때 보이는 메뉴 -->
                <li class="nav-item">
                    <a class="nav-link" href="/member/used/main/search?type=store_name&keyword=<%=storeMember.getStorename()%>"><h5>판매목록</h5></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/member/used/main/favorites?member_id=<%=storeMember.getMember_id()%>"><h5>찜목록</h5></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:bootbox.alert('1:1채팅은 서비스는 9월 오픈 예정입니다.', function(){});"><h5>채팅목록</h5></a>
                </li>
                <%  }else{ %>
                <li class="nav-item">
                    <a class="nav-link" href="#"><h5>판매목록</h5></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:bootbox.alert('1:1채팅은 서비스는 9월 오픈 예정입니다.', function(){});"><h5>1 : 1 대화하기</h5></a>
                </li>
                <% } %><!-- 다른 사람의 상점일 때 보이는 메뉴 -->
            </ul>
        </div>

        <hr>
	 	<!-- 내가 등록한 상품과 찜한 상품, 상품 후기를 볼 수 있는 박스 -->
	        <div class="content_container" style="padding-top: 30px;">
        		<%if(productList.size() != 0) {%> <!-- 등록한 상품이 있다면 -->
	            <!-- 내가 등록한 제품 미리보기 박스 -->
	            <div class="product_box">
	                <!-- 더보기 글씨 넣기 -->
	                <div class="row text-left">
	                    <div class="col-sm-10"><h4>[<%=storeMember.getStorename() %>]님의 판매 상품</h4></div>
	                    <div class="col-sm-2"><h5><a href="/member/used/main/search?type=store_name&keyword=<%=storeMember.getStorename()%>">더보기+</a></h5></div>
	                </div>
	                
	                <div class="row text-center">
	                	<%for(int i = 0; i < productList.size(); i++){ %> <!-- 상품 미리보기 -->
	                		<%if(i > 2) break; %>
		                	<%UsedProductImg usedProductImg = (UsedProductImg)productList.get(i); %>
		                    <!--하나의 상품을 나타낼 박스-->
		                    <div class="col-sm-4">
		                        <div class="card">
		                            <!-- 상품 이미지가 올 곳 + 이미지 클릭 시 상품 상세보기 이동 -->
		                            <img src="/resources/data/used/product/img/<%=usedProductImg.getUsed_img() %>"
		                            style="border-radius: 5px; border: solid 3px black;"
		                            onclick="location.href='/member/used/product/detail?used_product_id=<%=usedProductImg.getUsed_product_id()%>'" alt="<%=usedProductImg.getUsed_product_id()%>">
		                        </div>            
		                    </div>
	                    <%} %>
	                </div>
	            </div>
            <%}else{ %> <!-- 등록한 상품이 없다면 -->
	            <!-- 내가 등록한 제품 미리보기 박스 -->
	            <div class="product_box">
	                <!-- 더보기 글씨 넣기 -->
	                <div class="row text-left">
	                    <div class="col-sm-10"><h4>판매 중인 상품이 아직 없습니다.</h4></div>
	                </div>
				</div>
			<% } %>


            <!-- if(세션의 멤버 아이디와 현재 페이지가 같아야 보여질 찜){} -->
            <!-- 내가 찜한 제품 미리보기 박스 -->
            <%if(member.getMember_id()==storeMember.getMember_id()){ %> <!-- 내 상점이라면 -->
            	<%if(favoritesList.size() != 0) {%> <!-- 찜한 상품이 있다면 -->
		            <div class="favorites_container" style="margin-top: 60px;">
		                <!-- 더보기 글씨 넣기 -->
		                <div class="row text-left">
		                    <div class="col-sm-10"><h4>[<%=storeMember.getStorename() %>]님이 찜한 상품</h4></div>
		                </div>
		                <div class="row text-center">
		                    <%for(int i = 0; i < favoritesList.size(); i++){ %> <!-- 찜한 상품 미리보기 -->
		                    	<%if(i > 2) break; %>
		                		<%UsedProductImg usedProductImg = (UsedProductImg)favoritesList.get(i); %>
			                    <!--하나의 상품을 나타낼 박스-->
			                    <div class="col-sm-4">
			                        <div class="card">
			                            <!-- 상품 이미지가 올 곳 + 이미지 클릭 시 상품 상세보기 이동 -->
			                            <img src="/resources/data/used/product/img/<%=usedProductImg.getUsed_img() %>"
			                            style="border-radius: 5px; border: solid 3px black;"
			                            onclick="location.href='/member/used/product/detail?used_product_id=<%=usedProductImg.getUsed_product_id()%>'" alt="">
			                        </div>            
			                    </div>
		              		<% } %>
		                </div>
		            </div>
	            <%} else {%> <!-- 찜한 상품이 없다면 -->
	      			<div class="favorites_container" style="margin-top: 60px;">
		                <!-- 더보기 글씨 넣기 -->
		                <div class="row text-left">
		                    <div class="col-sm-12"><h4>찜한 상품이 아직 없습니다.</h4></div>
		                </div>
	      			</div>
				<%} %>     
            <%} %>
            
            
            <!-- 상품 후기를 미리볼 수 있는 컨테이너 -->
            <% if(reviewList.size() != 0) { %> <!-- 작성된 후기가 있다면 -->
				<div class="review_container" style="margin-top: 60px; margin-bottom: 50px">
				    <div class="row text-left">
				        <div class="col-sm-10"><h4>[<%=storeMember.getStorename() %>]님 상점 이용 후기</h4></div>
				    </div>
				    <table class="table" style="width: 100%">
				        <thead>
				            <tr>
				                <th>후기</th>
				                <th>작성자</th>
				                <th>작성일</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<%for(int i = 0; i < reviewList.size(); i++){ %>
				        		<% UsedReview review = (UsedReview)reviewList.get(i); %>
				        		<%if(review.getWriter_id() == member.getMember_id()) {%>
						        	<tr class="reviewTr" style="background-color: ivory;" onclick="deleteReview(<%= review.getUsed_review_id()%>)">
						        <% } else {%>    
						        	<tr class="reviewTr">
						        <% } %>
						                 <td><%=review.getContent() %></td>
						                 <td><%=review.getWriter() %></td>
						                 <td><%=review.getRegdate() %></td>
						             </tr>
				            <%} %>
				            <% if(member.getMember_id()!=storeMember.getMember_id()){ %> <!-- 내 상점이 아니라면 -->
					            <tr>
						            <td colspan="2">
						            	<input type="text" maxlength="40" name="content" placeholder="40자 이내의 짧은 이용후기를 남겨주세요." style="width: 100%">
						            </td>
						            <td>
						            	<button style="background-color: #5cb85c; color: white" onclick="registReview()">등록</button>
						            </td>				             
						        </tr>
					        <% } %>
						</tbody>
				    </table>
				    <div id="load"><h5><a href="javascript:loadReview();">더보기+</a></h5></div>
				</div>	
            <%} else { %> <!-- 작성된 후기가 없다면 -->
				<div class="review_container" style="margin-top: 60px; margin-bottom: 50px">
					<div class="row text-left">
						<div class="col-sm-10"><h4>등록된 후기가 아직 없습니다.</h4></div>
						<table class="table" style="width: 100%">
							<% if(member.getMember_id()!=storeMember.getMember_id()){ %> <!-- 내 상점이 아니라면 -->
							<tr>
				             	<td colspan="2">
				             		<input type="text" maxlength="40" name="content" placeholder="40자 이내의 짧은 이용후기를 남겨주세요." style="width: 100%">
				             	</td>
				             	<td>
				             		<button style="background-color: #5cb85c; color: white" onclick="registReview()">등록</button>
				             	</td>				             
				            </tr>
				            <% } %>
						</table>
					</div>
				</div>
            <% } %>
        </div>
    </div>
</body>
</html>