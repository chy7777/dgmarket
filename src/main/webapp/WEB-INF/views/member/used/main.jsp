<%@page import="ga.dgmarket.gymshopping.domain.UsedProductExtend"%>
<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
	List<UsedProductExtend> usedProductList = (List)request.getAttribute("usedProductList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>중고거래 메인</title>
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
	body{
		height: 1000px;
	}
    .jumbotron {
        color: #fff;
        padding:  25px;
    }

    .row{
        padding-left: 250px;
        padding-right: 250px;
    }

    .col-xl-3{
        margin-top: 25px;
        display: none;
    }

    .card-header div{
        margin-right: 0px;
    }

    img{
        width: 100%;
        height: 250px;
        object-fit: cover;
    }

    .card{
        border: black 1px solid;

    }

    hr{
        border: 0px;
        height: 3px;
        background: black;
    }

    input:focus, select:focus ,#search_bt:focus{
        outline: none;
    }

</style>
<script>
$(function(){
    //최초 상품 4개를 보여주기
    loadProduct();
   
    //더 보기 버튼 클릭 시 발생 이벤트
    $("#load").click(function(e){
        e.preventDefault(); //새로고침을 막아주는 함수
        loadProduct(e);
    });
});

//상품 더보기를 선택할 시 숨겨져 있던 상품 보여주기
function loadProduct(e){
    $(".col-xl-3:hidden").slice(0, 4).show();
    if($(".col-xl-3:hidden").length == 0){
        $("#load").css("display", "none");
    }
}

//찜을 추가하는 메서드
function addFavorites(used_product_id){
	//class를
	//danger로 바꿔주고 onclick을 delFavorites으로 바꿔줘야함
	//그리고 반환값으로 방금 넣은 last index번호를 받자
	var div = document.getElementById(used_product_id);
	if(div.className == "btn-success"){
		$.ajax({
			url : "/member/used/product/addfavorites?used_product_id="+used_product_id,
			type : "GET",
			success : function(data){
				div.className = "btn-danger";
				div.addEventListener("click", function(){
					delFavorites(used_product_id , data);
				});
				bootbox.confirm("상품을 [찜]하였습니다. 찜 목록으로 이동하시겠습니까?", function(flag){
					if(flag){
						location.href = "/member/used/store?member_id=<%=member.getMember_id()%>";
					}else{
						location.href="/member/used/main"; //새로고침
					}
				});
			}
		});
	}
}

//찜을 삭제하는 메서드
function delFavorites(used_product_id, used_favorites_id){
	var div = document.getElementById(used_product_id);
	if(div.className == "btn-danger"){
		$.ajax({
			url : "/member/used/product/delfavorites?used_favorites_id="+used_favorites_id,
			type : "GET",
			success : function(){
				div.className = "btn-success";
				div.addEventListener("click", function(){
					addFavorites(used_product_id);
				});
				bootbox.alert("찜을 [취소]하였습니다.", function(){});
			}
		});
	}
}
</script>
</head>
<body>
	<%@ include file="../inc/top_navi.jsp" %>
	<!-- 중고거래 top_navi -->
	<%@ include file="./inc/top_navi.jsp" %>
	<!-- 중고거래 side_controll -->
	<%@ include file="./inc/side_controll.jsp"  %>
   
    <!-- 중고상품의 이미지, 정보 등을 볼 수 있는 하나의 박스 -->
    <!-- 페이징 처리와 비슷하게 한 번에 4개의 상품만을 노출 시키고 +버튼을 눌렀을 때 다음 4개의 상품을 노출 시킬 계획 -->
    <!-- cuur 같은 변수를 만들고 +버튼을 누를 때 마다 1씩 증가 시키고 새로고침을 해도 cuur은 유지되게 만들어야 함 -->

    <div class="row text-center" id="product_box">
        <!--하나의 상품을 나타낼 박스-->
        <% if(usedProductList.size() == 0){ %>
        <h1 style="margin: auto">검색되는 상품이 없습니다.</h1>
        <% } %>
        <% for(UsedProductExtend usedProduct : usedProductList){ %>
        <div class="col-xl-3">
            <div class="card">
                <!-- 상품명이 올 곳 -->
                <div class="card-header">
                    <!-- 찜을 했냐 안했냐에 따라서 버튼의 색이 달라지고, 클릭 시 찜의 유무 바뀜 -->
                    <!-- 클릭 시 changeLike() 함수 호출 -->
                    <%if(usedProduct.getMember_id() != member.getMember_id()){ %>
	                    <%if(usedProduct.getFavorites_member()==0){ %>
		                    <div class="btn-success" id="<%=usedProduct.getUsed_product_id() %>" style="font-size: 25px; margin-bottom: 5px;" 
			                    onclick="addFavorites(<%=usedProduct.getUsed_product_id()%>)">
			                    ♥
		                    </div>
	                    <%} else { %>
		                    <div class="btn-danger" id="<%=usedProduct.getUsed_product_id() %>" style="font-size: 25px; margin-bottom: 5px;"
			                    onclick="delFavorites(<%=usedProduct.getUsed_product_id() %>, <%=usedProduct.getFavorites_id()%>)">
			                    ♥
		                    </div>
	                    <%} %>
                    <% }else {%>
                    	<div class="btn-success" id="<%=usedProduct.getUsed_product_id() %>" style="font-size: 25px; margin-bottom: 5px;"
		                    onclick="location.href='/member/used/store?member_id=<%=member.getMember_id()%>'">
		                    내 등록 상품
	                    </div>
                    <% } %>
                    <strong><%= usedProduct.getUsed_product_name() %></strong>
                </div>
                <!-- 상품 이미지가 올 곳 -->
                <img src="/resources/data/used/product/img/<%= usedProduct.getUsed_img() %>" alt="">
                <div class="card-body">
                    <!-- 상품 가격 올 곳 -->
                    <h5 class="card-title">
                    	<% if(usedProduct.getUsed_product_price() != 0){ %>
                    		<%= usedProduct.getUsed_product_price() %>
                    	<% }else{%>
                    	<strong>무료나눔</strong>
                    	<% } %>
                    </h5>
                    <p class="card-text">
                        <!-- 판매자 아이디 올 곳+링크는 판매자 상점으로 이동 -->
                        판매자 : <a href='/member/used/store?member_id=<%=usedProduct.getMember_id()%>'>[<%=usedProduct.getStorename()%>]</a>
                    </p>
                    <!-- 상품의 상세보기로 이동 -->
                    <a href="/member/used/product/detail?used_product_id=<%=usedProduct.getUsed_product_id()%>" class="btn btn-success">상세보기</a>
                </div>
            </div>            
        </div>   
        <% } %>            
    </div>    
    <div id="product_bt" style="width: 100%; height: 100px; padding-top: 35px;" class="text-center">
        <div class="btn btn-success center" id="load" onclick="">더보기</div>
    </div>
</body>
</html>