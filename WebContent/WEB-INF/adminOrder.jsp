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
			<h6><a href="#">Page Title</a><b>|</b>Page description The quick, brown <span class="for">fox jumps over a lazy dog. DJs flock by when TV ax quiz prog.</span></h6>
		</div>
		<div class="content">
			<!---->
		<div class="contact" >
				<div class="col-md-8 contact-top">
					
					<% ArrayList<Order> orders= (ArrayList<Order>)request.getAttribute("orders");
						for(Order od: orders){
					%>
					<div style="border-bottom: 1px solid;">
						<h5>Order ID: <%=od.getOrderId() %></h5>
						<table class="table table-bordered">
											
							<tr>
								<th>Customer Name</th>
								<td><%=od.getCusInfo().getCustomerName()%></td>
							</tr>
							<tr>
								<th>Customer Phone</th>
								<td><%=od.getCusInfo().getCustomerPhone() %></td>
							</tr>
							<tr>
								<th>Order Date</th>
								<td><%=od.getTime() %></td>
							</tr>
							
							<tr>
								<th>Order Total Cost</th>
								<td><%=od.getCount() %></td>
							</tr>
							
							<tr>
								<th>Order Status</th>
								<%if(od.getStatus()==1){ %>
								<td>Received</td>
								<%}else if(od.getStatus()==2){ %>
								<td>Shipping</td>
								
								<%}else if(od.getStatus()==3){  %>
								<td>Success</td>
								<%}else { %>
								<td>Removed</td>
								<%} %>
							</tr>
							
						</table>
						<table class="table table-striped">
							<tr>
								<th>Product Name</th>
								<th>Unit Cost</th>
								<th>Count</th>
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
								
								<%} %>
							</tr>
						<%} %>
						</table>
						<%if(od.getStatus()==1){ %>
						<table>
							<tr>
								<td>
								<form action="adminOrders" method="POST" onSubmit="return confirm('Are you sure to remove this order?')" >
									<input type="hidden" name="orderId" value="<%= od.getOrderId()%>"/>
									<input type="submit" value="Remove" name="delete"/>
								</form>
								</td>
								<td>
								<form action="adminOrders" method="POST" onSubmit="return confirm('Are you sure to finish package this order?')">
									<input type="hidden" name="orderId" value="<%= od.getOrderId()%>"/>
									<input type="submit" value="Finish Pagkage" name="pagkage"/>
								</form>
								</td>	
							</tr>
							
						</table>
						
						<%}else if(od.getStatus()==2){ %>
						<form action="adminOrders" method="POST" onSubmit="return confirm('Are you sure to finish payment this order?')">
							<input type="hidden" name="orderId" value="<%= od.getOrderId()%>"/>
							<input type="submit" value="Finish Payment" name="finish"/>
						</form>
						<%} %>
					</div>	
					<%} %>	
					<br>
				
					
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
	

</body>
</html>