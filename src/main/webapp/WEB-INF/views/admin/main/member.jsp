<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Member> memberList = (List)request.getAttribute("memberList");
	int cnt = (int)(request.getAttribute("cnt"));
	int totalRecord = memberList.size();
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
</head>
<style>
/* Change background color of buttons on hover */
.product-bar:hover {
  background-color: #ddd;
}
.pageNum{
	color: red;
}
</style>
<body>
<%@ include file="../inc/top_navi.jsp" %>

<div class="container p-3 my-3 bg-dark text-white">
  <h1>회원관리 페이지입니다.</h1>
  <!-- regdate 대상으로 groupby 해서 값 찾기? -->
  <p>최근 한 달 간 가입한 고객의 수는 <%=cnt %>명입니다. </p>
</div>
<div class="container">
  <h2>회원 목록</h2>
  <p>검색된 결과 : <%=memberList.size() %> 건</p>
  <p>현재 <%=currentPage %> 페이지</p>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>No.</th>
        <th>프로필</th>
        <th>ID</th>
        <th>이름</th>
        <th>닉네임</th>
        <th>전화번호</th>
        <th>주소</th>
        <th>이메일</th>
        <th>가입일자</th>
      </tr>
    </thead>
    <tbody>
    <%for(int i = for_i; i<for_i+pageSize; i++){ %>
    <%if(num<1)break; %>
      <tr class= "product-bar" onclick="location.href='/admin/main/member/detail?member_id=<%=memberList.get(i).getMember_id()%>';">
        <td><%=num-- %></td>
        <td><img src="\resources\data\<%=memberList.get(i).getProfile_img()%>" width="50px" height="50px"> </td>
        <td><%=memberList.get(i).getUser_id() %></td>
        <td><%=memberList.get(i).getName() %></td>
        <td><%=memberList.get(i).getStorename() %></td>
        <td><%=memberList.get(i).getPhone() %></td>
        <td><%=memberList.get(i).getAddr() %></td>
        <td><%=memberList.get(i).getEmail() %></td>
        <td><%=memberList.get(i).getRegdate() %></td>
      </tr>
      <%} %>
    </tbody>
  </table>
  <tr>
		<td colspan="6" style = "text-align:center">
		<%if(firstPage > 1){ %>
		<a href="/admin/main/member?currentPage=<%=firstPage-1%>">◀</a>
		<%}else{ %>
		<a href="/admin/main/member?currentPage=1">◀</a>		
		<%} %>
			<%for(int i = firstPage; i <= lastPage ; i++){ %>
			<%if(i>totalPage)break; %>
			<a href="/admin/main/member?currentPage=<%=i%>" <%if(currentPage==i){ %>class="pageNum"<%} %>>[<%=i %>]</a>
			<%} %>
		<%if(totalPage - lastPage > 10){ %>
		<a href="/admin/main/member?currentPage=<%=lastPage+1%>">▶</a>
		<%}else{ %>
		<a href="/admin/main/member?currentPage=<%=totalPage%>">▶</a>
		<%} %>
		</td>
	</tr>
 </div>
 

</body>
</html>