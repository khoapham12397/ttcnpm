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
		<div style="height: 20px;"></div>
		<div class="content">
		<h2 style="margin-left: 20px;">
    				Cart Information
    	</h2>
		<div class="check-out">
			<%ShoppingCart cartInfo=(ShoppingCart)request.getSession().getAttribute("cartInfo");
			if(cartInfo.getCount()==0){	
					
			%>
    	    <h4 class="title">Shopping cart is empty</h4>
    	    <p class="cart-out">You have no items in your shopping cart.<br>Click<a href="index.html"> here</a> to continue shopping</p>
    		<%}else{ 
    			ArrayList<CartLineInfo> cartLines=cartInfo.getList();
    			//co biet khi em bao anh di di la chi mong anh se o lai la de nghe rang thieu vang em anh se 
    			//buon lo ra sao ???
    		
    		%>
    			
       			<table class="table table-striped">
    				<tr>
    					<th>Product Name</th>
    					<th>Product ID</th>
    					<th>Product Price</th>
    					<th>Product Count</th>
    					
    				</tr>
    				<%for(CartLineInfo line: cartLines){ %>
    				
    				<tr>
    					<td><%=line.getProduct().getName() %></td>	
    					<td><%=line.getProduct().getId() %></td>
    					<td><%= line.getProduct().getCost() %></td>
    					<td>
    						<form action="BuyProduct" method="GET">
    							<input type="hidden" name="idProduct" value="<%=String.valueOf(line.getProduct().getId()) %>"/>
    							<input type="text" value="<%=line.getCount() %>" name="soluong"/>
    							<input type="submit" value="update"/>
    						</form>
    					</td>
    							
    				</tr>
    				<% }%>
    			</table>
    		
    		<% } %>
    	</div>
			<div style="float: left; margin-left: 40px; font-size: 25px; color: blue;"><a href="productList" style="color: blue;">Product List</a></div>
			<div style="margin-left: 700px; font-size: 25px; color: blue;"><a href="OrderProduct" style="color: blue;">Proceed to Order</a></div><br>
			<div style="clear: left;"></div>
		</div>
		
		
		
		<!-- co the thuc hien chuyen huong tu day -->
		
		<footer>
			<jsp:include page="/footer/footerlevel1.jsp"></jsp:include>
		</footer> 
	</div>

	<!---->
</body>
</html>