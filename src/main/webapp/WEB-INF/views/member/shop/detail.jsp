<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@page import="java.util.jar.Attributes.Name"%>
<%@page import="ga.dgmarket.gymshopping.domain.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Product product = (Product)request.getAttribute("product");
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Favicon  -->
<link rel="icon" href="/resources/img/reallogo.png">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/resources/css/core-style.css">
<link rel="stylesheet" href="/resources/style.css">
<!-- 폰트어썸 -->
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<!-- Responsive CSS -->
<link href="/resources/css/responsive.css" rel="stylesheet">
<!-- Popper js -->
<script src="/resources/js/popper.min.js"></script>
<!-- Plugins js -->
<script src="/resources/js/plugins.js"></script>
<!-- Active js -->
<script src="/resources/js/active.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 커스텀 CSS -->
<link rel="stylesheet" href="/resources/css/style.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
    href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Nanum+Pen+Script&family=Single+Day&display=swap"
    rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<!--     
    font-family: 'Black Han Sans', sans-serif;
    font-family: 'Jua', sans-serif;
    font-family: 'Nanum Pen Script', cursive;
    font-family: 'Single Day', cursive; 
    font-family: 'Nanum Gothic Coding', monospace;  -->
    <title>상세보기</title>
</head>
<body>
    <!-- 헤더 시작 -->
    <div id="header" >
		<%@include file="../inc/top_navi.jsp" %>
	</div>
	<!-- 헤더 끝 -->
    <div class="row">
        <div class="col-sm-2" ></div>
        <div class="col-sm-8" id="product-detail">
            <!-- 상세보기 설명 시작-->
            <div class="row" id="product-desc">
                <div class="col-sm-5" id="product-img"> 
                    <img class="img-fluid" src="/resources/data/product/img/<%=product.getProduct_img()%>" alt="img">
                </div>
                <div class="col-sm-7" id="product-choice">
                    <hr class="top-line">
                    <div class="product-name">
                        <h2 style="margin-left: 20px; margin-bottom: 15px;"><%=product.getProduct_name()%> <span class="badge badge-secondary">Hot</span></h2>
                    </div>
                    <hr style="background-color: rgb(186, 186, 186); height: 2/1px; margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4" id="product-price">판매가</div>
                        <div class="col-sm-6" id="product-price" style="font-weight: bold; color: rgb(214, 6, 208);"><%=product.getPrice()%>원</div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">배송비</div>
                        <div class="col-sm-6" id="ship-cost">5000</div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">적립금</div>
                        <div class="col-sm-6"><%=Math.round(product.getPrice()*0.01)%></div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">제조사</div>
                        <div class="col-sm-6"><%=product.getBrand() %></div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
                    <div class="row" style="background: rgb(221, 221, 221); margin-left: 0%; margin-right: 0%;">
                        <!-- <div class="col-sm-4">상품선택</div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <select class="form-control select2 select2-danger" data-dropdown-css-class="select2-danger" style="width: 100%;">
                                  <option selected="selected">(필수)옵션을 선택해주세요</option>
                                  <option>아령 5kg X 2 기본 세트(+0)</option>
                                  <option>아령 10kg X 2, 5kg X 2 세트(+5000) </option>
                                  <option>아령 10kg X 2, 5kg X 2, 3kg X 2 세트(+8000)</option>
                                  <option>바벨 10kg X 2, 5kg X 2 기본 세트(+15000)</option>
                                  <option>바벨 20kg X 2, 10kg X 2, 5kg X 2 세트(+20000)</option>
                                </select>
                              </div>
                        </div> -->
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">

                    <div class="row" style="width: 100%;">
                        <div class="col-md-6" style=" margin-left: 30px;">상품명</div>
                        <div class="col-md-2" id="product-number">&nbsp&nbsp상품수</div>
                        <div class="col-md-3" style="margin-left: 30px; padding-left: 40px;"> 가격</div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
                    <div class="row" style="background: rgb(221, 221, 221); margin-left: 0%; margin-right: 0%;">
                        <div class="col-md-6" >&nbsp&nbsp<%=product.getProduct_name()%></div>
                        <div class="col-md-3">
                            <form class="cart clearfix mb-50 d-flex" method="post" >
                                <div class="quantity" ondragstart="false" id="detail-form">
                                	<input type="hidden" name="product_id" value="<%=product.getProduct_id()%>">
                                    <input type="hidden" name="member_id" value="<%=member.getMember_id()%>">
                                	<span class="qty-minus" ondragstart="false" style="cursor: pointer;" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false; "><i class="fa fa-minus" aria-hidden="true" onclick="changePrice(-1);"></i></span>
                                    <input type="number" style="background-color: white;" ondragstart="false" class="qty-text" id="qty" step="1" min="1" max="12" name="ea" value="1" disabled/>
                                    <span class="qty-plus" ondragstart="false" style="cursor: pointer;"onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false; "><i class="fa fa-plus" aria-hidden="true" onclick="changePrice(1);"></i></span>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-3" id="total-price"><%=product.getPrice()%></div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">

                </div>
            </div>
            <!-- 상세보기 설명 끝 -->

            <!-- 상세보기 장바구니 시작-->
            <div class="row" id="product-cart" style="height: 300px">
                <div class="col-sm-5" id="product-block"></div>
                <div class="col-sm-7" id="product-cart">
                    <div class="row">
                        <div class="col-sm-4" style="padding: 5px;"><button type="button" class="btn btn-dark" id="detail-bt" onclick="location.href='/member/cart/list'">장바구니 가기</button></div>
                        <div class="col-sm-4" style="padding: 5px;"><button type="button" class="btn btn-light"  id="detail-bt" onClick="addCart()">장바구니담기</button></div>
                        <div class="col-sm-4" style="padding: 5px;"><button type="button" class="btn btn-light"  id="detail-bt">관심상품</button></div>
                    </div>
                </div>
            </div>
            <!-- 상세보기 장바구니 끝 -->


        </div>
        <div class="col-sm-2" ></div>
    </div>

<script>

/* 수량 변경시 가격변경*/
function changePrice(a){
	//수량 int형으로 변환
	var ea= $("#detail-form input[type='number']").val() 
	ea=ea*1+a;
	
	if(ea==0){
		return
	}
		
	var product_price=<%=product.getPrice()%> //상품금액
	var tag=ea*product_price;//상품금액*수량
	var price = document.getElementById("total-price");
	price.innerHTML= tag;
}


/* 장바구니에 담기(비동기) */
function addCart(){
	var json={
		product_id:$("#detail-form input[name='product_id']").val(),
		member_id:$("#detail-form input[name='member_id']").val(), 
		ea:$("#detail-form input[name='ea']").val()
	};

	$.ajax({
		url:"/member/cart",
		type:"POST",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(json),
		success:function(result, status, xhr){
			console.log("서버로 부터 전송된 데이터 ", json);
			if(result.resultCode==1){
				if(confirm("장바구니에 상품이 담겼습니다.\n장바구니로 이동하시겠습니까??")){
					location.href="/member/cart/list";
				}
			}else if(result.resultCode==0){
				alert("장바구니에 상품이 담기지 않았습니다.\n문제가 지속될 경우 관리자에 문의하세요");
			}
		},
		//서버의 에러가 발생했을때 (500, 401,404..즉 요청을 성공할수 없는 심각한 200 초과의 에러들.. )
		error:function(xhr, status, error){
			console.log("서버에서 심각한 에러가 발생하여, 요청 자체를 처리할 수 없었다!", status);
		}			
	});		
}






</script>
</body>
</html>







