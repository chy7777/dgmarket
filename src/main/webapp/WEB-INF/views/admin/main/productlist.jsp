<%@page import="ga.dgmarket.gymshopping.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Product> productList = (List)request.getAttribute("productList");
	int totalRecord = productList.size();
	int blockSize = 10; //한번에 보여질 최대 페이지 수
	int pageSize = 10; //한번에 보여질 최대 요소 수 (게시글..회원 등등)
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize);
	int currentPage = 1;//현재 페이지(디폴트)
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int firstPage = currentPage-((currentPage-1)%blockSize);
	int lastPage = firstPage+(blockSize-1);
	int num = totalRecord - (currentPage-1)*(pageSize);
	int for_i = (currentPage-1)*10;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다..</title>
<%@ include file="../inc/bootstrap.jsp" %>
<style>
/* Change background color of buttons on hover */
.product-bar:hover {
  background-color: #ddd;
}
</style>
</head>
<body>
<%@ include file="../inc/top_navi.jsp" %>

<div class="container p-3 my-3 bg-dark text-white">
  <h1>상품목록 페이지입니다.</h1>
  <!-- regdate 대상으로 groupby 해서 값 찾기? -->
</div>
<div class="container">
  <h2>전체 상품 목록</h2>
  <p>현재 등록된 상품 수는 총 <%=productList.size() %>건입니다. </p>
  
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>No.</th>
        <th>미리보기</th>
        <th>카테고리</th>
        <th>상품명</th>
        <th>브랜드</th>
        <th>가격</th>
        <!--  어떤 항목 추가할지..
        <th>주소</th>
        <th>이메일</th>
        <th>가입일자</th>
         -->
      </tr>
    </thead>
    <tbody>
    <%for(int i = for_i; i<for_i+pageSize; i++){ %>
    <%if(num<1)break; %>
      <tr class= "product-bar" onclick="location.href='/admin/main/product/detail?product_id=<%=productList.get(i).getProduct_id()%>';">
        <td><%=num-- %></td>
        <td><img src="\resources\data\product\img\<%=productList.get(i).getProduct_img()%>" width="50px" height="50px"> </td>
        <td><%=productList.get(i).getTopCategory().getTop_name() %></td>
        <td><%=productList.get(i).getProduct_name() %></td>
        <td><%=productList.get(i).getBrand() %></td>
        <td><%=productList.get(i).getPrice() %></td>
      </tr>
      <%} %>
    </tbody>
  </table>
 </div>
  <tr>
		<td colspan="6" style = "text-align:center">
		<%if(firstPage > 1){ %>
		<a href="/admin/main/productlist?currentPage=<%=firstPage-1%>">◀</a>
		<%}else{ %>
		<a href="/admin/main/productlist?currentPage=1">◀</a>		
		<%} %>
			<%for(int i = firstPage; i <= lastPage ; i++){ %>
			<%if(i>totalPage)break; %>
			<a href="/admin/main/productlist?currentPage=<%=i%>" <%if(currentPage==i){ %>class="pageNum"<%} %>>[<%=i %>]</a>
			<%} %>
		<%if(totalPage - lastPage > 10){ %>
		<a href="/admin/main/productlist?currentPage=<%=lastPage+1%>">▶</a>
		<%}else{ %>
		<a href="/admin/main/productlist?currentPage=<%=totalPage%>">▶</a>
		<%} %>
		</td>
	</tr>

</body>
</html>