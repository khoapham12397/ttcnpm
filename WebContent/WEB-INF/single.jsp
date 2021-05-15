<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="khoa.code.model.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<title>Mihstore A Ecommerce Category Flat Bootstarp Resposive Website Template | Single :: w3layouts</title>
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
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
		<script>
		
			//khi
			jQuery(document).ready(function($){
				
				$('#etalage').etalage({
					thumb_image_width: 300,
					thumb_image_height: 400,
					source_image_width: 900,
					source_image_height: 1200,
					show_hint: true,
					click_callback: function(image_anchor, instance_id){
						alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
					}
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
		<%Product p=(Product)request.getAttribute("product"); %>
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

			<div class="col-md-9">
			<div class="col-md-5 single-top">	
						<ul id="etalage">
							<li>
								<a href="optionallink.html">
									<img class="etalage_thumb_image img-responsive" src="<%=p.getPathImg() %>" alt="" >
									<img class="etalage_source_image img-responsive" src="<%=p.getPathImg() %>" alt="" >
								</a>
							</li>
							
						</ul>

					</div>	
					<div class="col-md-7 single-top-in">
						<div class="single-para">
						
							<h4><%=p.getName() %></h4>
							<div class="para-grid">
								<span  class="add-to"><%=p.getCost() %></span>
								<a href="BuyProduct?idProduct=<%=String.valueOf(p.getId())%>" class=" cart-to">Add to Cart</a>					
								<div class="clearfix"></div>
							 </div>
							 <table class="table table-striped"> 
							 	<tr>
							 		<th>Count</th>
							 		<td><%=p.getCount() %></td>
							 	
							 	</tr>
							 	<tr>
							 		<th>Brand</th>
							 		<td><%=p.getBrand() %></td>
							 	</tr>
							 	<tr>
							 		<th>Manufacture date</th>
							 		<td><%=p.getCreateDate() %></td>
							 	</tr>
							 	<tr>
							 		<th>Discount</th>
							 		<td><%=p.getDiscount() %></td>
							 	</tr>
							 	<tr>
							 		<th>Exp</th>
							 		<td>6 months</td>
							 	</tr>
							 </table>
							
							
							<div class="available">
								<h6>Available Options :</h6>
								<ul>
									
								<li>Size:<select>
									<option>Large</option>
									<option>Medium</option>
									<option>small</option>
									<option>Large</option>
									<option>small</option>
								</select></li>
								<li>Cost:
										<select>
										<option>U.S.Dollar</option>
										<option>Euro</option>
									</select></li>
							</ul>
						</div>
							
								
								<div class="cart-an" style="font-size: 17px;">
								Mì tôm chua cay là hương vị mì ăn liền yêu thích và quen thuộc đối với người Việt. Tuy vậy, ít ai biết rằng Hảo Hảo là thương hiệu đầu tiên giới thiệu hương vị này tại thị trường Việt từ 20 năm về trước.<br>
Với Hảo Hảo, bạn sẽ có những trải nghiệm hoàn toàn khác biệt với sợi mì dai ngon kết hợp với nước súp đậm đà, mang đến cái ngon đầy xúc cảm ngay từ lúc chế biến cho đến khi thưởng thức xong. 
								
								</div>
							<div class="share">
							<h4>Share Product :</h4>
							<ul class="share_nav">
								<li><a href="#"><img src="images/facebook.png" title="facebook"></a></li>
								<li><a href="#"><img src="images/twitter.png" title="Twiiter"></a></li>
								<li><a href="#"><img src="images/rss.png" title="Rss"></a></li>
								<li><a href="#"><img src="images/gpluse.png" title="Google+"></a></li>
				    		</ul>
						</div>
						</div>
					</div>
				<div class="clearfix"> </div>
 <ul id="flexiselDemo1">
 			<%ArrayList<Product> mProducts=(ArrayList<Product>)request.getAttribute("mProducts"); 
 				for(Product p1 : mProducts){
 			%>
 			
			<li><img src="<%= p1.getPathImg() %>" /><div class="grid-flex"><a href="productDetail?id=<%= p1.getId() %>"><%= p1.getName() %></a><p><%= p.getCost() %></p></div></li>
			<%} %>
			</ul>
	    <script type="text/javascript">
		 $(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
<!---->

<!---->
			</div>
<div class="col-md-3 col-md">
			<div class=" possible-about">
					<h4>Sort Products</h4>
						
						<div>
							<ul class="place">
								
								<li class="sort"> <span>Brands</span></li>
								<li class="by"><img src="images/do.png" alt=""></li>
								<div class="clearfix"> </div>
							</ul>
							
				<div class="single-bottom">
						<a href="#">
							<input type="checkbox"  id="nike" value="">
							<label for="nike"><span></span><b>Acecook</b></label>
						</a>
						<a href="#">
							<input type="checkbox"  id="nike1" value="">
							<label for="nike1"><span></span> <b>Omachi</b></label>
						</a>
						<a href="#">
							<input type="checkbox"  id="nike2" value="">
							<label for="nike2"><span></span><b>Unif</b></label>
						</a>
						<a href="#">
							<input type="checkbox"  id="nike3" value="">
							<label for="nike3"><span></span> <b>Uniben</b></label>
						</a>
						<a href="#">
							<input type="checkbox"  id="nike4" value="">
							<label for="nike4"><span></span><b>Sparx</b></label>
						</a>
					</div>

						</div>
						
						<div class="tab5">
							<ul class="place">
								
								<li class="sort">Sort by <span>rating</span> </li>
								<li class="by"><img src="images/do.png" alt=""></li>
								<div class="clearfix"> </div>
							</ul>
							<div class="star-at">
							<div class="two">
								<a href="#"> <i></i>  </a>	
								<a href="#"> <i></i>  </a>
								<a href="#"> <i></i>  </a>
								<a href="#"> <i></i>  </a>
								<a href="#"> <i></i>  </a>
							</div>
							<div class="two">
								<a href="#"> <i></i>  </a>	
								<a href="#"> <i></i>  </a>
								<a href="#"> <i></i>  </a>
								<a href="#"> <i></i>  </a>
								
							</div>
							<div class="two">
								<a href="#"> <i></i>  </a>	
								<a href="#"> <i></i>  </a>
								<a href="#"> <i></i>  </a>
								
							</div>
							<div class="two">
								<a href="#"> <i></i>  </a>	
								<a href="#"> <i></i>  </a>
								
							</div>
							</div>
						
						</div>
						
						<!--script-->
						<script>
							$(document).ready(function(){
								$(".tab1 .single-bottom").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab4 .single-bottom").hide();
								$(".tab5 .star-at").hide();
								$(".tab1 ul").click(function(){
									$(".tab1 .single-bottom").slideToggle(300);
									$(".tab2 .single-bottom").hide();
									$(".tab3 .w_nav2").hide();
									$(".tab4 .single-bottom").hide();
									$(".tab5 .star-at").hide();
								})
								$(".tab2 ul").click(function(){
									$(".tab2 .single-bottom").slideToggle(300);
									$(".tab1 .single-bottom").hide();
									$(".tab3 .w_nav2").hide();
									$(".tab4 .single-bottom").hide();
									$(".tab5 .star-at").hide();
								})
								$(".tab3 ul").click(function(){
									$(".tab3 .w_nav2").slideToggle(300);
									$(".tab4 .single-bottom").hide();
									$(".tab5 .star-at").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})
								$(".tab4 ul").click(function(){
									$(".tab4 .single-bottom").slideToggle(300);
									$(".tab5 .star-at").hide();
									$(".tab3 .w_nav2").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})	
								$(".tab5 ul").click(function(){
									$(".tab5 .star-at").slideToggle(300);
									$(".tab4 .single-bottom").hide();
									$(".tab3 .w_nav2").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})	
							});
						</script>
						<!-- script -->
					</div>
					<div class="content-bottom-grid">
					
					<div class="clearfix"> </div>
				</div>
				
					
				<!---->
				<div class="money">
					<h3>Payment Options</h3>
						<ul class="money-in">
						<li><a href="single.html"><img class="img-responsive" src="images/p1.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p2.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p3.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p4.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p5.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p6.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p1.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p4.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p2.png" title="name" alt=""></a></li>

						</ul>
					</div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<!---->
		<footer>
			<jsp:include page="/footer/footerlevel1.jsp"></jsp:include>
		</footer> 
	</div>

	<!---->
	
</body>
</html>