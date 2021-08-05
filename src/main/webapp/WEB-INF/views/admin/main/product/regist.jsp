<%@page import="ga.dgmarket.gymshopping.domain.TopCategory"%>
<%@page import="java.util.List"%>
<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<TopCategory> topCategoryList = (List)request.getAttribute("topCategoryList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../../inc/bootstrap.jsp" %>
<%@ include file="../../inc/designscript.jsp" %>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <!-- Navbar -->
<%@ include file="../../inc/top_navi.jsp" %>
  <!-- /.navbar -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
		<!--등록폼 시작-->
			<div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">상품 등록</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name="form1">
                <div class="card-body">
                  <div class="form-group">
                    
                    <label for="exampleInputEmail1">카테고리</label>
						
	                        <select class="form-control" name="top_category_id">
	                        	<option value="0">카테고리 선택</option>
	                        	<%for(TopCategory topCategory : topCategoryList){ %>
	                        	<option value="<%=topCategory.getTop_category_id()%>"><%=topCategory.getTop_name() %></option>
	                        	<%} %>
	                        </select>
                      
                    </div>                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">상품명</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" value="" name="product_name">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">브랜드</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="" name = "brand">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">가격</label>
                    <input type="number" class="form-control" id="exampleInputPassword1" value="" name = "price" >
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">수량</label>
                    <input type="number" class="form-control" id="exampleInputPassword1" value="" name = "product_inven" >
                  </div>
                  <div class="form-group">
                  <label for="exampleInputPassword1">상세정보</label>
                    <textarea class="form-control" placeholder="상품 상세정보" name="product_detail"></textarea>
                  </div>                  
                  <div class="form-group">
                    <label for="exampleInputFile">사진 등록</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile" name="photo">
                        <label class="custom-file-label" for="exampleInputFile">파일을 선택하세요</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">업로드</span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-primary" onClick="regist()">등록</button>
                  <button type="button" class="btn btn-primary" onClick="del()">삭제</button>
                  <button type="button" class="btn btn-primary" onClick="location.href='/admin/main/productlist';">목록</button>
                </div>
              </form>
            </div>		
		<!--등록폼 종료-->
      </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <script>
	function regist() {
		$("form").attr({
			action:"/admin/product/regist",
			method:"POST",
			enctype:"multipart/form-data"
		});
		$("form").submit();
	}  
  </script>
</html>