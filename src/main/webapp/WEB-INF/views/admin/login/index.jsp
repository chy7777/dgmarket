<%@page import="java.util.ArrayList"%>
<%@page import="ga.dgmarket.gymshopping.domain.Admin"%>
<%@page import="ga.dgmarket.gymshopping.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Product> productList = (List)request.getAttribute("product");
	Product product = productList.get(0);
	Product product1 = (Product)request.getAttribute("product1");
	Product product2 = (Product)request.getAttribute("product2");
	Product product3 = (Product)request.getAttribute("product3");
	Admin admin = (Admin)session.getAttribute("admin");
	List<Product> cntList = (List)request.getAttribute("productCount");
	
	List<String> date = new ArrayList();
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
	Calendar cal = Calendar.getInstance();
		date.add(sdf.format(cal.getTime()));
	for(int i = -2 ; i <= 0 ; i ++){
		cal.add(Calendar.DAY_OF_MONTH, -1);
		date.add(sdf.format(cal.getTime()));
	}	
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
  <h1>득근마켓 관리자 페이지입니다.</h1>
<%if(admin!=null){ %>  
  <p>안녕하세요! 
  <%=admin.getName()%>
   님, 오늘도 좋은 하루 보내세요.</p>
  <%}else{ %>  
  <h1>잘못된 접근방식입니다.</h1>
  <%} %>
  <div id="stickchart"></div>
  <br>
  <div id="stickchart2"></div>
</div>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
	  var data = google.visualization.arrayToDataTable([
	        ['날짜', '등록된 상품 수', { role: 'style' } ],
	        ['<%=date.get(3)%>', <%=product3.getCnt()%>, 'color: blue'],
	        ['<%=date.get(2)%>', <%=product2.getCnt()%>, 'color: blue'],
	        ['<%=date.get(1)%>', <%=product1.getCnt()%>, 'color: blue'],
	        ['<%=date.get(0)%>', <%=product.getCnt()%>, 'color: blue']
	      ]);

	  var data2 = google.visualization.arrayToDataTable([
	        ['날짜', '등록된 총 상품 수', { role: 'style' } ],
	        <%for(int i = 3 ; i >= 0 ; i--){%>
	        ['<%=date.get(i)%>', <%=cntList.get(3-i).getCnt()%>, 'color: grey'],
		    <%}%>
	        ]);

	      var options = {
	        width: 600,
	        height: 400,
	        legend: { position: 'top', maxLines: 3 },
	        bar: { groupWidth: '75%' },
	        legend: {position : "none"},
	      };

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.ColumnChart(document.getElementById('stickchart'));
  chart.draw(data, options);
  var chart2 = new google.visualization.ColumnChart(document.getElementById('stickchart2'));
  chart2.draw(data2, options);
}
</script>
</body>
</html>