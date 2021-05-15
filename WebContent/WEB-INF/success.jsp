<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="khoa.code.model.*" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<title>Mihstore A Ecommerce Category Flat Bootstarp Resposive Website Template | Cart :: w3layouts</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<!--//fonts-->
<!--//slider-script-->
<script>$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.message').fadeOut('slow', function(c){
	  		$('.message').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close1').on('click', function(c){
		$('.message1').fadeOut('slow', function(c){
	  		$('.message1').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close2').on('click', function(c){
		$('.message2').fadeOut('slow', function(c){
	  		$('.message2').remove();
		});
	});	  
});
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event){		
							event.preventDefault();
							$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
						});
					});
				</script>
				<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>		
</head>
<body> 
<!--header-->
	<div class="container">
		<!-- header-top -->
		<jsp:include page="/header/header-top.jsp"></jsp:include>
		<!-- header-top -->
		<!-- header-bottom -->
		<jsp:include page="/header/header-bottom.jsp"></jsp:include>
		<!-- header-bottom -->
		<div class="page">
		</div>
		
		<div class="content">
			<h3>Order Success</h3><br>
			<h3>E-Invoice</h3><br>
			<div>
			<%ShoppingCart cartInfo=(ShoppingCart) request.getAttribute("cartInfo"); 
				ArrayList<CartLineInfo> list= cartInfo.getList();
				double total=0;
			%>
				<table class="table table-striped">
					<tr>
						<th>STT</th>
						<th>Product Name</th>
						<th>Count</th>
						<th>Unit Price</th>
						<th>Discount</th>
						<th>Cost</th>
					</tr>
					<%for(int i=0;i<list.size();i++){
						%>
						<tr>
						<%int count= list.get(i).getCount();Product p= list.get(i).getProduct();
							double m= p.getCost()*count*(100-p.getDiscount())/100;
							total+=m;
						%>
							<td><%=i+1 %></td>
							<td><%=p.getName()%></td>
							<td><%=count %></td>
							<td><%=p.getCost() %></td>
							<td><%=p.getDiscount() %></td>
							<td><%=m%></td>
						</tr>
					<%}%>
					<tr>
						<td colspan="5">Total Money</td>
						<td><%=total%></td>
					</tr>
				</table>
			<br>
			<p>Thank you for your choice. Please track the order to update info.
			</p>
			<br>
			</div>
			<br>
			<h3><a href="productList">Go to Product List</a></h3>
		</div>
		
		
		
		<footer>
			<jsp:include page="/footer/footerlevel1.jsp"></jsp:include>
		</footer> 
	</div>

	<!---->
</body>
</html>