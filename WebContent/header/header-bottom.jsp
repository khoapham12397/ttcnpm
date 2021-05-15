<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="khoa.code.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<div class="header-bottom">
		<div class="top-nav">
			  <ul class="megamenu skyblue">
				      <li class="active grid"><a  href="productList">Products</a>
					    <div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="productList">Product List</a></li>
										<li><a href="#">Bags</a></li>
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="#">Shirts</a></li>
										<li><a href="#">Vests</a></li>
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Popular Brands</h4>
									<ul>
										<li><a href="#">Ray-Ban</a></li>
										<li><a href="#">Wood Wood</a></li>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
					</li>
					<li><a class="pink"  href="#">ideas</a></li>
				    <li class="grid"><a  href="#">Brands</a>
					   <div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="#">Acecook</a></li>
										<li><a href="#">Omachi</a></li>
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="#">Uniben</a></li>
										<li><a href="#">Unif</a></li>
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Popular Brands</h4>
									<ul>
										<li><a href="#">Vans</a></li>
										<li><a href="#">Balenciaga</a></li>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
			    </li>
			<!-- khi logout thi chi la xoa thong tin khoi session thoi la ok
			
			 -->
			 <li class="grid"><a  href="#">Admin</a>
					   <div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="adminOrders">Update Order</a></li>
										
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="updateProduct?id=-1">Add New Product</a></li>
										<li><a href="updateProduct">Update Product</a></li>
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Popular Brands</h4>
									<ul>
										<li><a href="store.html">Ray-Ban</a></li>
										<li><a href="store.html">Wood Wood</a></li>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
			    </li>	
			 <li class="grid"><a  href="#">Customer</a>
					   <div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="orders">All Orders</a></li>
										<li><a href="updateInfo">Update Information</a></li>
										<li><a href="">Log out</a></li>
										
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="orders?type=1">Recieved Orders</a></li>
										<li><a href="orders?type=3">Success Orders</a></li>
										<li><a href="orders?type=2">Shipping Order</a></li>
										<li><a href="orders?type=4">Removed Order</a></li>
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Popular Brands</h4>
									<ul>
										<li><a href="store.html">Wood Wood</a></li>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
			    </li>
				
			  </ul> 
				</div>
					<div class="cart icon1 sub-icon1">
						<h6 >Shopping Cart:
						<%ShoppingCart cartInfo=(ShoppingCart)request.getSession().getAttribute("cartInfo");
							if(cartInfo!=null && cartInfo.getCount()>0){
						%>
						<span class="item"><%=cartInfo.getCount() %> items</span>
						<span class="rate"><%=cartInfo.getTotalCost() %></span>
						<li><a href="#" class="round"> </a>
						<ul class="sub-icon1 list">
						 
						  <div class="shopping_cart">
						   <%for(CartLineInfo line : cartInfo.getList()){ %>
							  <div class="cart_box">
							   	 <div class="message">
							   	     <div class="alert-close"> </div> 
										<div class="list_img"><img src="<%=line.getProduct().getPathImg()%>" class="img-responsive" alt=""></div>
										<div class="list_desc"><h4><a href="#"><%=line.getProduct().getName() %></a></h4>
										
										<a href="#" class="offer"><%=line.getCount() %> </a>
										</div>
		                              <div class="clearfix"></div>
	                              </div>
	                            </div>
	                           <%} %>
	                        </div>
							  <div class="check_button"><a href="cartInfo">View Cart</a></div>
					      <div class="clearfix"></div>
						</ul>
					</li>
					<%}else{ %>
					<h4>There is no item in your cart</h4>
					<%} %>
</h6>
						
					</div>
			<div class="clearfix"> </div>
		</div>
</body>
</html>