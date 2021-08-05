<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedTag"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedProductImg"%>
<%@page import="java.util.List"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedFavorites"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedProductExtend"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Map map = (HashMap)request.getAttribute("map");
	UsedProductExtend productExtend = (UsedProductExtend)map.get("usedProductExtend");
	UsedFavorites favorites = (UsedFavorites)map.get("usedFavorites");
	List<UsedProductImg> imgList = (List)map.get("imgList");
	List<UsedTag> tagList = (List)map.get("tagList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제품 상세보기</title>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" alt></script>
<!-- bootbox cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
<style>
    .wrapper{
        width: 60%;
        margin: auto;
    }

    .tag_container{
        padding-top: 35px;
    }

    .content_container{
        width: 100%;
        margin-top: 35px;
    }

    .button_container{
        border: 1px solid black;
        border-radius : 5px;
        width : 98%;
        position : absolute;
        bottom : 0px;
        right : 0px;
        left : 0px;
    }

    hr{
        border: 0px;
        height: 3px;
        background: black;
    }

    .carousel-inner img {
        width: 100%;
        height: 600px;
        object-fit: cover;
        border: 3px solid black;
    }
    
    </style>
<script>
//상품 한 건 삭제 처리
function del(used_product_id){
	bootbox.confirm("정말로 삭제하시겠습니까?", function(flag){
		if(flag){
			location.href="/member/used/product/delete?used_product_id="+used_product_id;
		}
	});
}

//거래 상태 변경
function soldout(used_product_id){
	bootbox.confirm("상품의 상태를 [거래완료]로 바꾸시겠습니까?", function(flag){
		if(flag){
			location.href="/member/used/product/soldout?used_product_id="+used_product_id;
		}
	});
}

//상품 찜 추가
function addFavorites(used_product_id){
	$.ajax({
		url :	"/member/used/product/addfavorites?used_product_id="+used_product_id,
		type : "GET",
		success : function(){
			bootbox.alert("상품을 [찜]하였습니다.", function(){
				location.href = "/member/used/product/detail?used_product_id=<%=productExtend.getUsed_product_id()%>";
			});
		}
	});
}

//찜 삭제
function delFavorites(used_favorites_id){ 
	$.ajax({
		url :	"/member/used/product/delfavorites?used_favorites_id="+used_favorites_id,
		type : "GET",
		success : function(){
			bootbox.alert("찜을 [취소]하였습니다.", function(){
				location.href = "/member/used/product/detail?used_product_id=<%=productExtend.getUsed_product_id()%>";
			});
		}
	});
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
	
    <div class="wrapper">
        <!-- 상품의 태그를 보여줄 박스 -->
        <div class="tag_container">
            <h3>Hash TAG</h3>
            <!-- 실제 태그 꺼내서 반복문 돌리기 -->
            <% if (tagList != null && tagList.size() != 0){%>
	            <%if((tagList.get(0).getTag_name()).equals("")){ %>
	            	<span style="padding-right: 15px;"><a href="/member/used/main">등록된 태그가 없습니다.</a></span>
	            <%} else {%>
		            <%for(UsedTag usedTag : tagList){%>
		            	<span style="padding-right: 15px;"><a href="/member/used/main/search?type=tag_name&keyword=<%=usedTag.getTag_name() %>">#<%=usedTag.getTag_name() %></a></span>
		            <% } %>
	            <% } %>
            <% } %>
        </div>
        <hr>

        <!-- 상품의 정보와 추천 상품을 보여줄 컨테이너 -->
        <div class="content_container">
            <!-- 상품 정보를 담는 컨테이너 -->
            <div class="product_container">
                <div class="row">
                    <!-- 제품 이미지 넣기 -->
                    <div class="col-sm-6">
                        <!-- 제품의 이미지를 여러 개 등록 했을 때  -->
                        <div id="demo" class="carousel slide" data-ride="carousel">
                            <!-- 이미지의 링크를 담당! 반복문 돌려야함-->
                            <ul class="carousel-indicators">
                            	<%for(int i = 0; i < imgList.size(); i++){ %>
                            		<%if(i == 0) {%>
	                                	<li data-target="#demo" data-slide-to="<%=i %>" class="active"></li>                            		
                            		<%} else{%>
	                                	<li data-target="#demo" data-slide-to="<%=i%>"></li>
	                                <%} %>
                                <%} %>
                            </ul>

                            <!-- 등록한 이미지만큼! 반복문 돌려야 함 -->
                            <div class="carousel-inner">
                            	<%for(int i = 0; i < imgList.size(); i++){ %>
                            		<%UsedProductImg productImg = imgList.get(i); %>
	                                <%if(i==0){ %>
		                                <div class="carousel-item active">
		                                    <img src="/resources/data/used/product/img/<%= productImg.getUsed_img()%>" alt="">
		                                </div>
	                                <%} else {%>
		                                <div class="carousel-item">
		                                    <img src="/resources/data/used/product/img/<%= productImg.getUsed_img()%>" alt="">
		                                </div>
	                                <% } %>
                                <%} %>
                            </div>
                        </div>
                    </div>
                    <!-- 상품의 이름, 가격, 설명을 담는 컨테이너 -->
                    <div class="col-sm-6">
                        <!-- 제품명 넣기 -->
                        <p><h3><strong><%= productExtend.getUsed_product_name() %></strong></h3></p>
                        <!-- 가격 넣기 -->
                        <p><h1><strong><%= productExtend.getUsed_product_price() %>원</strong></h1></p>
                        <br>
                        <p><h5><strong>제품 설명</strong></h5></p>
                        <hr style="border: 0px; height: 3px; background: black;">
                        <!-- 제품 설명 넣기 -->
                        <p><h5><strong>
                            <%=productExtend.getUsed_product_detail() %>
                        </strong></h5></p>
                        <br>
                        <br>
                        <br>
                        <div class="button_container text-center" >
                        	<%if(productExtend.getMember_id()!=mem.getMember_id()){ %>
	                            <p><h5><strong>판매자 : <a href="/member/used/store?member_id=<%=productExtend.getMember_id()%>">[<%= productExtend.getStorename() %>]</a></strong></h5></p> 
	                            <div class="btn-group" style="width : 100%;">
	                                <!-- 찜 갯수 넣기 사용자가 찜을 했는지 안했는지에 따라 버튼과 뱃지 색 바꾸기 -->
	                                <% if(productExtend.getFavorites_id()==0){ %>
	                                	<button type="button" class="btn btn-success" onclick="addFavorites(<%=productExtend.getUsed_product_id()%>)">찜하기 
	                                	<%if(favorites != null){ %>        
	                                		<span class="badge badge-danger"><%=favorites.getCount() %></span></button>								
										<%} else {%>       
	                                		<span class="badge badge-danger">0</span></button>								
										<% } %>   
	                                <%} else { %>
	                                	<button type="button" class="btn btn-danger" onclick="delFavorites(<%=productExtend.getFavorites_id()%>)">찜취소하기
	                                	<%if(favorites != null){ %>        
	                                		<span class="badge badge-success"><%=favorites.getCount() %></span></button>								
										<%} else {%>       
	                                		<span class="badge badge-secondary">0</span></button>								
										<% } %>
	                                <% } %>       
	                                <button type="button" class="btn btn-success" onclick="location.href='#'">연락하기</button>
	                            </div>
                            <%} else {%>
                            	<p><h5><strong>상태 변경</strong></h5></p> 
	                            <div class="btn-group" style="width : 100%;">
                           	 		<button type="button" class="btn btn-success" onclick="del(<%=productExtend.getUsed_product_id()%>)">상품삭제</button>
                        		</div>
                            <% } %>
                    </div>
                </div>
            </div>
            <hr style="margin-top: 35px;">
            <!-- 보고 있는 상품과 유사한 상품을 추천하는 컨테이너 -->
            <div class="other_container">
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            </div>
        </div>

    </div>
</body>
</html>