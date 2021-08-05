<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<String> side_navi_img_list = new ArrayList();
	List<Integer> side_navi_id_list = new ArrayList();

	String img1 = (String) session.getAttribute("img1");
	String img2 = (String) session.getAttribute("img2");
	String img3 = (String) session.getAttribute("img3");

	
	if(img3 != null && img3 != ""){
		side_navi_img_list.add(img3);
		side_navi_id_list.add((Integer)session.getAttribute("id3"));
	}
	
	if(img2 != null && img2 != ""){
		side_navi_img_list.add(img2);
		side_navi_id_list.add((Integer)session.getAttribute("id2"));
	}
	
	if(img1 != null && img1 != ""){
		side_navi_img_list.add(img1);
		side_navi_id_list.add((Integer)session.getAttribute("id1"));
	}

%>
<script>
var controllDiv;
$(function(){
    controllDiv = document.getElementById("controllDiv");
    controllDiv.style.left = window.innerWidth-(controllDiv.offsetWidth+100)+"px";
    controllDiv.style.top = ((window.innerHeight/2)-130+window.scrollY)+"px";

    $(window).resize(function(){
        controllDiv.style.left = window.innerWidth-(controllDiv.offsetWidth+100)+"px";
        controllDiv.style.top = ((window.innerHeight/2)-130+window.scrollY)+"px";
    });

    $(window).scroll(function(){
        controllDiv.style.top = (window.innerHeight/2)-130+"px";
        console.log("div 탑 위치"+controllDiv.offsetTop);
        console.log("스크롤 위치"+window.scrollY);
        console.log("더한 값"+(controllDiv.offsetTop+window.scrollY));
        var divTop = controllDiv.offsetTop+window.scrollY;
        controllDiv.style.top = divTop+"px";
    });
    
    $("#x").on("click", function(){
    	console.log("gd");
    	$.ajax({
    		"url" : "/member/used/product/delSession",
    		"type" : "get",
    		success : function(){
    			document.getElementById("imgBox").innerHTML = "";
    		}
    	});
    });
});

</script>
<div id="controllDiv" style="width: 150px; position: absolute; border: 2px solid black; text-align: center;">
	<div><strong>최근 본 상품 </strong><span id="x">x<span></div>
	<div id="imgBox">
	<% for(int i = 0; i < side_navi_img_list.size(); i++){ %>
		<img alt="" src="/resources/data/used/product/img/<%=side_navi_img_list.get(i)%>"
			style="width: 140px; height: 120px;" onclick="location.href='/member/used/product/detail?used_product_id=<%=side_navi_id_list.get(i)%>'">
	<% } %>
	</div>
</div>













