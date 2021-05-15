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
					
					function validateForm(){
						var res=true;
						var name=document.forms["infoForm"]['name'].value;
						if(name=='') {
							res=false;
						}
					
						
						var cost=document.forms["infoForm"]['cost'].value;
						
						if(isNaN(cost)) {
							res=false;
						}
						var count=document.forms['infoForm']['count'].value;
						if(isNaN(count)) res=false;
						var dis=document.forms['infoForm']['discount'].value;
						if(isNaN(dis)) res=false;
						var brand=document.forms['infoForm']['brand'].value;
						if(isNaN(brand)) res=false;
						if(res==false) alert('Please fill in the appropriate information');
						return res;
					}
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

			<div class="col-md-9">
					<%Product p=null;
					p=(Product)request.getAttribute("product"); 
						
					%>
					<div class="col-md-7 single-top-in">
						<div class="single-para">
						<%if(p!=null){ %>
						 <form action="uploadFile" method="POST" enctype="multipart/form-data">
								 <div class="form-group">
    						    	<label>Choose Image</label>
    						    	<input type="file" name="photo" />
    						    </div>
    						    <button type="submit" class="btn btn-primary">Upload File</button>
								</form>
							<form action="updateProduct" method="POST" name="infoForm" onSubmit="return validateForm()">
								<div class="form-group">
            						<label>Product name</label>
            						<input type="text" name="name" class="form-control" value="<%= p.getName()%>"/>
    						    </div>
    						    <div class="form-group">
            						<label>Cost</label>
            						<input type="text" name="cost" class="form-control" value="<%= p.getCost()%>"/>
    						    </div>
								<div class="form-group">
            						<label>Discount</label>
            						<input type="text" name="discount" class="form-control" value="<%= p.getDiscount()%>"/>
    						    </div>
								<div class="form-group">
            						<label>Brand</label>
            						<input type="text" name="brand" class="form-control" value="<%= p.getBrand()%>"/>
    						    </div>
								<div class="form-group">
            						<label>Count</label>
            						<input type="text" name="count" class="form-control" value="<%= p.getCount()%>"/>
    						    </div>
    						    <div class="form-group">
            						<label>Manufacture Date</label>
            						<input type="text" name="nsx" class="form-control" value="<%= p.getCreateDate()%>"/>
    						    </div>
    						   	<div class="form-group">
            						<label>Path Image</label>
            						<input type="text" name="imgPath" class="form-control" value="<%= p.getPathImg()%>"/>
    						    </div>
    						    
    						    <input type="hidden" name="id" value="<%= p.getId()%>"/>
    						    
    						   	
								
    						    <%String file=(String)request.getSession().getAttribute("imgPath");
    						    	if(file!=null){
    						    %>
    						    <input type="hidden" name="pathImg" value="<%= file%>"/>
    						    <%} %>
								<button type="submit" class="btn btn-primary">Update</button>
								
							</form>
							<br>
							<a style="clear: left;" class="cart-an" href="updateProduct?id=<%=p.getId()%>&type=delete" onclick="return confirm('Are you sure to delete this product?')">Remove</a>
								
														
							<%} %>
							
							
								
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
					
						<!-- viec truy xuat server lien tuc khong hay ti nao ??? -->
						<!-- nen ton tai ajax  -->
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
					<h3>Dictionary</h3>
					<div class="latest-grid">
						<table class="table table-striped">
							<tr>
								<th>Code</th>
								<th>Brand Name</th>
							</tr>
							<tr>
								<td>1</td>
								<td>Acecook</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Omachi</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Unif</td>
							</tr>
							<tr>
								<td>4</td>
								<td>Uniben</td>
							</tr>
						</table>
					</div>
					<div class="latest-grid">
						<table class="table table-striped">
							<tr>
								<th>Code</th>
								<th>Flavour</th>
							</tr>
							<tr>
								<td>1</td>
								<td>Chua Cay</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Vị Sườn</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Vị Bò</td>
							</tr>
							<tr>
								<td>4</td>
								<td>Vị Gà</td>
							</tr>
							<tr>
								<td>5</td>
								<td>Vị Tôm</td>
							</tr>
						</table>
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