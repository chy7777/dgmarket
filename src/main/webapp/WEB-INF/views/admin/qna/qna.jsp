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
<body>
<%@ include file="../inc/top_navi.jsp" %>

<div class="container p-3 my-3 bg-dark text-white">
  <h1>Q&A관리 페이지입니다.</h1>
  <p>오늘 등록된 질문은 %n건이며, 답변이 미등록된 질문은 %n건입니다.</p>
  
</div>
<div class="container">
  <h2>Q&A 목록</h2>
  <p>현재 <%=currentPage %> 페이지</p>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>No.</th>
        <th>닉네임</th>
        <th>제목</th>
        <th>답변 여부</th>
        <th>등록일자</th>
      </tr>
    </thead>
    <tbody>
    <%for(int i = for_i; i<for_i+pageSize; i++){ %>
    <%if(num<1)break; %>
      <tr class= "product-bar" onclick="location.href='/admin/main/member/detail?member_id=<%=memberList.get(i).getMember_id()%>';">
        <td><%=num-- %></td>
        <td><%=memberList.get(i).getUser_id() %></td>
        <td><%=memberList.get(i).getName() %></td>
        <td><%=memberList.get(i).getStorename() %></td>
        <td><%=memberList.get(i).getPhone() %></td>
      </tr>
      <%} %>
    </tbody>
  </table>
  <tr>
		<td colspan="6" style = "text-align:center">
		<a href="/admin/main/member?currentPage=<%=firstPage-1%>">◀</a>
			<%for(int i = firstPage; i <= lastPage ; i++){ %>
			<%if(i>totalPage)break; %>
			<a href="/admin/main/member?currentPage=<%=i%>" <%if(currentPage==i){ %>class="pageNum"<%} %>>[<%=i %>]</a>
			<%} %>
		<a href="/admin/main/member?currentPage=<%=lastPage+1%>">▶</a>
		</td>
	</tr>
 </div>
 

</body>
</html>