<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="khoa.code.model.*" %>
<%@ page  import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Mihstore A Ecommerce Category Flat Bootstarp Resposive Website Template | Contact :: w3layouts</title>
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
			<%CustomerInfo cus=(CustomerInfo)request.getSession().getAttribute("customer");
				if(cus==null){
			%>
			<h6><a href="login">Login</a><b>|</b><a href="register">Register</a></h6>
			<%}else{ %>
			<h6>Welcome <%=cus.getCustomerName() %></h6>
			<%} %>
		</div>
		<div class="content">
			<!---->
		<div class="contact" >
				<div class="col-md-8 contact-top">
				
				<%if(request.getParameterMap().containsKey("type")){
				int type=Integer.valueOf(request.getParameter("type"));
						if(type==1){
					%>
					<h1>Received Orders</h1>
					<%}else if(type==2){ %>
					<h1>Shipping Orders</h1>
					
					<%}else if(type==3){ %>
					<h1>Success Orders</h1>
					<%}else { %>
					<h1>Canceled Orders</h1>
					<%}} %>
					
					<% ArrayList<Order> orders= (ArrayList<Order>)request.getAttribute("orders");
						for(Order od: orders){
					%>
					<div style="border-bottom: 1px solid; ">
						
						<table class="table table-bordered">
							<tr>
								<th>Order ID</th>
								<td><%=od.getOrderId() %></td>
							</tr>
							<tr>
								<th>Order Date</th>
								<td><%=od.getTime() %></td>
							</tr>
							<tr>
								<th>Order Total Cost</th>
								<td><%=od.getCount() %></td>
							</tr>
						</table>
						<h3>Order Details</h3>
						<table class="table table-striped">
							<tr>
								<th>Product</th>
								<th>Price</th>
								<th>Count</th>
								<th>Option</th>
							</tr>
						<%for(OrderItem oi : od.getOrderItems()){ %>
							<tr>
								
								<td><%=oi.getProduct().getName() %></td>
								<%if(oi.getProduct().getDiscount()>0){ %>
								<td><%= oi.getProduct().getCost()%> -<%= oi.getProduct().getDiscount()%>%</td>
								<%}else{ %>
								<td><%= oi.getProduct().getCost() %></td>
								<%} %>
								<td><%=oi.getCount() %></td>
								<%if(od.getStatus()==1){
									Product p=oi.getProduct();
							
									float val=(float)(od.getCount() -oi.getCount()*(100-p.getDiscount())*p.getCost()/100);
									%>
								<td><a style="color: red;" href="removeOrder?itemId=<%= oi.getId()%>&val=<%= val%>&orderId=<%= od.getOrderId()%>" onclick="return confirm('Are you sure to delete this item?')">Delete Item</a></td>		
								<%} %>
							</tr>
						<%} %>
						</table>
						<%if(od.getStatus()==1){ %>
						<a href="removeOrder?orderId=<%= od.getOrderId()%>" onclick="return confirm('Are you sure to remove this order?')" style="color: red; font-size:20px;"><b>Remove Order</b></a>
						<%} %>
					</div>	
					<%} %>	
					<br>
				<!-- khong can phai them san pham??? -->
					
				</div>
				<div class="col-md-4 contact-bottom">
					<h3>Info</h3>
					<ul class="social ">
						<li><span>124 Avenue Street, Los angeles,California </span></li>
						<li><span>+ 00 123 456 7890</span></li>
						<li><a href="mailto:info@example.com">info@example.com</a></li>
					</ul>
							
					<div class="map">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d37494223.23909492!2d103!3d55!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x453c569a896724fb%3A0x1409fdf86611f613!2sRussia!5e0!3m2!1sen!2sin!4v1415776049771"></iframe>
					</div>
				</div>
			<div class="clearfix"> </div>
			</div>

		</div>
		<!---->
		<footer>
			<jsp:include page="/footer/footerlevel1.jsp"></jsp:include>
		</footer> 
	</div>

	<!---->

</body>
</html>