<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="ga.dgmarket.gymshopping.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Cart> cartList=(List)request.getAttribute("cartList");
	Member member=(Member)session.getAttribute("member");
	String item_name=null;
	if(cartList.size()>0){
		Cart cart_first = cartList.get(0);
		item_name=cart_first.getProduct().getProduct_name();				
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- jQuery -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Favicon  -->
<link rel="icon" href="/resources/img/reallogo.png">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/resources/css/core-style.css">
<link rel="stylesheet" href="/resources/style.css">
<!-- 폰트어썸 -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- Responsive CSS -->
<link href="/resources/css/responsive.css" rel="stylesheet">
<!-- Popper js -->
<script src="/resources/js/popper.min.js"></script>
<!-- Plugins js -->
<script src="/resources/js/plugins.js"></script>
<!-- Active js -->
<script src="/resources/js/active.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
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
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap"
   rel="stylesheet">
<!--     
    font-family: 'Black Han Sans', sans-serif;
    font-family: 'Jua', sans-serif;
    font-family: 'Nanum Pen Script', cursive;
    font-family: 'Single Day', cursive; 
    font-family: 'Nanum Gothic Coding', monospace;  -->
<title>장바구니</title>

<!-- Favicon  -->
<link rel="icon" href="img/reallogo.png">
<script>
/* 수량 변경시 가격변경*/
function changePrice(a,b){
		//수량 int형으로 변환
		var ea= $("#ea_"+b).text();
		var price=$("#price_"+b).val();
		ea=ea*1+a;
		price=price*1
		
		if(ea==0){
		   return
		}
		//갯수 갱신
		var product_ea = document.getElementById("ea_"+b);
		product_ea.innerHTML=ea;
		//하나의 아이템의 총액 갱신
		var total_price= document.getElementById("total_price_"+b);
		total_price.innerHTML=ea*price+"원"
		//전체 총액 갱신
		var len = $("div[name='total_price']").length;
		var basket_price = 0;
		for(var i = 0; i < len; i++){
			var div=$("div[name='total_price']")[i];
			var text = div.innerText;
			var pure_price=text.substring(0, text.length-1);
			basket_price += pure_price*1;

		}
		var real_total_price= document.getElementById("real_total_price");
		real_total_price.innerHTML=basket_price+"원"
		
}


//주문 요청 메서드
$(function(){
	var bt = document.getElementById("ord");
	bt.addEventListener("click", function(){
		<%if(cartList.size()==0){%>
		alert("아이템이없어요");
		return
		<%}%>
		
		console.log("들어온다");
		/* 총 수량 계산 */
		var len = $("span[name='ea']").length;
		var basket_ea = 0;
		var basket_total_price=0;
		var basket_ship_price=0;
		var basket_discount=0;
		for(var i = 0; i<len; i++){
			var span=$("span[name='ea']")[i];
			var ea = span.innerText;
			basket_ea += ea*1;
		}
		var total_ea=basket_ea;
		console.log("총수량",total_ea);
		
		/* 총액+배송비-할인가 계산 */
		
		//값 받아오기
		var real_total_price= document.getElementById("real_total_price").innerText;
		var ship_money= document.getElementById("ship_money").innerText;
		var discount=document.getElementById("discount").innerText;
		
		//"원" 빼고 int형변환
		basket_total_price=real_total_price.substring(0, real_total_price.length-1)*1;
		basket_ship_price=ship_money.substring(0, ship_money.length-1)*1;
		basket_discount=discount.substring(1, discount.length-1)*1;

		
		var totalprice=basket_total_price+basket_ship_price-basket_discount; //계산결과 반환
		
		
		var name="<%=member.getName()%>";
		var addr="<%=member.getAddr() %>";
		

		
		$.ajax({
			url:"/member/order",
			type:"POST",
			data:{
				"name":name,
				"product_name":"<%=item_name%>",
				"ea":total_ea,
				"totalprice":totalprice,
				"addr":addr
			},
			success:function(result, status, xhr){
			console.log("서버로 부터 전송된 데이터 ");
			location.href="/member/shop/order"
			},
			error:function(xhr, status, error){
				console.log("서버에서 심각한 에러가 발생하여, 요청 자체를 처리할 수 없었다!", status);
			}			
		});	
		
	});
});


</script>
</head>
<body>
   <!-- 헤더 시작 -->
   <div id="header">
      <%@include file="../inc/top_navi.jsp"%>
   </div>
   <!-- 헤더 끝 -->
            <!-- 장바구니 왼쪽 섹션 시작 -->
            <div class="row" style="margin-top: 20px">
                <div><i class="fas fa-check-circle" style="margin-left: 30px; font-size: 25px; color: purple;"></i></div>
                <div class="col-sm-1+1/2" style="margin-left: 1%;">전체선택(<%=cartList.size()%>/<%=cartList.size()%>)</div>
                <div class="" style="color: rgb(157, 157, 157); font-weight: bold;">&nbsp;&nbsp;&nbsp;I</div>
                <div class="col-sm-1" style="padding-left: 0px;">&nbsp;&nbsp;선택삭제</div>
            </div>
            <hr id="cart-line" style="background-color: rgb(186, 186, 186); height: 1px; width: 75%;">
            <div class="row" id="cart-main">
            <!-- 아이템 1개 시작 -->
                <div class="col-sm-9" style="overflow: scroll; height: 100%" >
                    <div class="row">
                     <%for(int i=0; i<cartList.size(); i++){ %>
                     <%Cart cart = cartList.get(i); %>
                     <input type="hidden" id="price_<%=i %>" value=<%=cart.getProduct().getPrice()%>>
                        <div class="col-sm-2" id="cart-check">
                            <i class="fas fa-check-circle" style="margin-left: 15px; font-size: 25px; color: purple;"></i>
                            <img src="/resources/data/product/img/<%=cart.getProduct().getProduct_img()%>" class="img-thumbnail" id="product-thumbnail">
                        </div>
                        <div class="col-sm-3" id="cart-detail" name="item_name">
                            <%=cart.getProduct().getProduct_name() %>
                        </div>
                        <div class="col-sm-3" style="margin-top: 50px;">
                            <div id="cart-count">
                            <i class="fas fa-minus" id="minus" onclick="changePrice(-1,<%=i%>)"></i>
                            &nbsp;&nbsp;&nbsp;<span name="ea" id="ea_<%=i%>"><%=cart.getEa() %></span> &nbsp;&nbsp;&nbsp;
                            <i class="fas fa-plus" id="plus" onclick="changePrice(1,<%=i%>)"></i>
                            </div>
                        </div>
                        <div class="col-sm-3" name="total_price" style="margin-top: 50px; margin-left: 5%; font-size: 18px;" id="total_price_<%=i%>">
                            <%=cart.getProduct().getPrice()*cart.getEa()%>원
                        </div>
                      <%} %>
                    </div>
                </div>
                <!-- 아이템 한개 끝 -->
            <!-- 장바구니 왼쪽 섹션 끝-->
            <!-- 장바구니 오른쪽 섹션 시작 -->            
                <div class="col-sm-3" style="border: 1px solid rgb(214, 214, 214);">
                    <div style="margin-top: 20px; font-size: 30px; height: 70px; color: rgb(126, 126, 126);">
                        <i class="fas fa-map-marker-alt" ></i>
                        배송지
                    </div>
                    <div style="height: 100px;"><%=member.getAddr() %></div>
                    <div id="location"><button type="button" class="btn btn-outline-success">배송지 변경</button></div>
                    <div class="row" style="height: 140px; padding-top: 20px; margin-top: 50px; background: rgb(240, 240, 240);">
                        <div class="col-sm-7" style="font-size: 15px; line-height: 30px; padding-left: 50px; ">상품금액</div>
                        <div class="col-sm-5" id ="real_total_price" style="font-size: 20px;  text-align: right;" >
                        <%int totalprice=0; %>
                        <%for(int i=0; i<cartList.size(); i++){ %>
                        <%Cart cart = cartList.get(i);%>
                        <%totalprice+=cart.getProduct().getPrice()*cart.getEa();%>
                        <%} %>
                        <%=totalprice%>원
                        </div>
                        <div class="col-sm-7" style="font-size: 15px; line-height: 30px; padding-left: 50px;">상품할인금액</div>
                        <div class="col-sm-5" id="discount" style="font-size: 20px;  text-align: right;">-2000원</div>
                        <div class="col-sm-7" style="font-size: 15px; line-height: 30px; padding-left: 50px;">배송비</div>
                        <div class="col-sm-5" id="ship_money" style="font-size: 20px;  text-align: right; ">5000원</div>
                    </div>
                    <hr style="width: 100%; padding: 0%; margin-left: 0%">
                    <div id="product-order"><button type="button" class="btn btn-success" id="ord">주문하기</button></div>
                </div>
            <!-- 장바구니 오른쪽 섹션 끝-->          
            </div>
        </div>
        <div class="col-sm-2" ></div>
    </div>
    <!--  푸터 시작   -->
	<%@include file="../inc/footer.jsp" %>
	<!--  푸터 끝   -->
    

</body>
</html>













