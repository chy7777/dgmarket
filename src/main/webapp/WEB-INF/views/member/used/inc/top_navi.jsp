<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member mem = (Member)session.getAttribute("member");
%>    
<script type="text/javascript">
	$(function(){
		$("#getMainByKeyword").on("click", function(){
			var type = $("select").val();
			var keyword = $("#keyword").val();
			if(keyword == "" || keyword == null){ 
				bootbox.alert("검색어를 입력해주세요.", function(){});
			}else{
				if(type == "max_price" && isNaN(keyword)){
					bootbox.alert("최대 금액은 숫자를 입력하세요.", function(){});	
				}else if(type == "max_price" && isNaN(keyword)){
					bootbox.alert("최소 금액은 숫자를 입력하세요.", function(){});	
				}else{
					location.href = "/member/used/main/search?type="+type+"&keyword="+keyword;			
				}
			}
		});
	});
</script>
<div class="row text-center" style="width :80%; margin:auto; margin-top: 40px; 
margin-bottom: 35px; padding-left: 250px; padding-right: 250px;">
	<div class="col-sm-1">
		<select style="height: 30px">
			<option value="product_name" selected="true">상품명</option>
			<option value="tag_name">태그명</option>			
			<option value="store_name">상점명</option>
			<option value="store_id">상점ID</option>
			<option value="max_price">상한가</option>
			<option value="min_price">하한가</option>
		</select>
	</div>
	<div class="col-sm-2" style="width: 100%">
		<input id="keyword" maxlength="10" type="text" placeholder="검색어">				
	</div>
	<div class="col-sm-1">
		<button id="getMainByKeyword" style="background-color: #5cb85c; color: white">검색</button>
	</div>
	<div class="col-sm-1">
	</div>
	<div class="col-sm-1">
		<span onclick="location.href='/member/used/main'"><h4><strong>메인</strong></h4></span>
	</div>
	<div class="col-sm-1">
		<span onclick="location.href='/member/used/product/registForm'"><h4><strong>등록</strong></h4></span>
	</div>
	<div class="col-sm-1">
		<span onclick="location.href='/member/used/store?member_id=<%=mem.getMember_id()%>'"><h4><strong>상점</strong></h4></span>
	</div>
	<div class="col-sm-1">
		<span onclick="location.href='/member/used/chat/list'"><h4><strong>대화</strong></h4></span>
	</div>
</div>
 <hr style="border: black 1px solid">