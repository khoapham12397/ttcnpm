<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="khoa.code.model.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Trang chủ</title>
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
<script>
	$(document).ready(function(){
	$(".megamenu").megamenu();
	});
	
	function logoutAd(){
		$.ajax({url: 'logout?type=1',method: 'GET'}).done(function(res){
			alert(res);
		});
	}
	function logoutCus(){
		$.ajax({url: 'logout?type=0',method: 'GET'}).done(function(res){
			alert(res);
		})
	}
	
	</script>				

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
		<form action="" method="GET">
				<input type="text" name="keyword" id="keySearch" autocomplete="off" style="width: 800px; height: 40px; border-radius: 20px; border: 1px solid;"/>
				<input type="submit" value="Find"/>
				<input type="hidden" name="type" value="keyword"/>
				
		</form>
			<%CustomerInfo cus=(CustomerInfo)request.getSession().getAttribute("customer");
				if(cus==null){
			%>
			<h6><a href="login">Login</a><b>|</b><a href="register">Register</a></h6>
			<%}else{ %>
			<h6>Welcome <%=cus.getCustomerName() %> | <button  style="background-color: Transparent; border: none;" id="logoutCus" onclick="logoutCus()">Logout</button> | <button style="background-color: Transparent; border: none;" id="logoutAdmin" onclick="logoutAd()">Logout Admin</button></h6>
			
			
			<%} %>
		</div>
		<div class="content">
			
			<div class="col-md-9">
			<div class="shoe">
				<img class="img-responsive" src="images/banner_migoi.png" alt="" >
				
			</div>
			<%ArrayList<Product> list=(ArrayList<Product>)request.getAttribute("products"); %>
			
				<div class="content-bottom">
					<h3>Top products</h3>
					<div class="bottom-grid">
					
					<%
						int sl;if(list.size()>9) sl=9;else sl=list.size();
						
					for(int i=0;i<sl;i++){ 
						Product p=list.get(i);
					%>
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="productDetail?id=<%=p.getId() %>"><img class="img-responsive1" src="<%=p.getPathImg()%>" alt="" >
								<%if(p.getDiscount()>0) {%>
								<div class="five">
									<h6 >-<%= p.getDiscount() %>%</h6>
								</div>
								<%} %>
								<div class="pre">
									<p><%=p.getName() %></p>
									<span><%=p.getCost() %></span>
									<div class="clearfix"> </div>
								</div>
								</a>
							</div>
						</div>
					<%} %>	
					
					
					</div>
					<div><a style="margin-left:750px; margin-top:20px; font-size: 17px;" href="#">More</a></div>
				</div>
				
				<%ArrayList<Product> news=null;
				news=(ArrayList<Product>) request.getAttribute("newProducts");
				if(news!=null){
				//khi co qua nhieu san pham ben trong kho thi can phan trang ra ???
				//khi do can phai???
				//lay them san pham thi no se bat dau get tu 
				%>
				
				<div class="content-bottom">
					<div style="height: 10px;"></div>
					<h3>New Products</h3>
					<div class="bottom-grid">
						<%for(Product p: news){ %>
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="productDetail?id=<%=p.getId() %>"><img class="img-responsive1" src="<%=p.getPathImg()%>" alt="" >
								<%if(p.getDiscount()>0) {%>
								<div class="five">
									<h6 >-<%= p.getDiscount() %>%</h6>
								</div>
								<%} %>
								<div class="pre">
									<p><%=p.getName() %></p>
									<span><%=p.getCost() %></span>
									<div class="clearfix"> </div>
								</div>
								</a>
							</div>
						</div>
						<%} %>
					</div>		
				</div>
				<%} %>
				
			
			</div>
			
			<div class="col-md-3 col-md">
			<div class=" possible-about">
					<h4>Filter Products</h4>
						<div class="tab1">
							<ul class="place">
								
								<li class="sort">Filter <span>price</span></li>
								<li class="by"><img src="images/do.png" alt=""></li>
									<div class="clearfix"> </div>
							</ul>
							<div class="single-bottom">
						
						
						<a href="productList?type=price&down=200&up=300">
							
							<label for="brand"><span></span><b>Rs.200-Rs.300</b></label>
						</a>
						<a href="productList?type=price&down=150&up=200">
							
							<label for="brand1"><span></span> <b>Rs.150-Rs.200</b></label>
						</a>
						<a href="productList?type=price&down=100&up=150">
							
							<label for="brand2"><span></span> <b>Rs.100-Rs.150</b></label>
						</a>
						<a href="productList?type=price&down=50&up=100">
							
							<label for="brand3"><span></span> <b>Rs.50-Rs.100</b></label>
						</a>
						<a href="productList?type=price&down=10&up=50">
							
							<label for="brand4"><span></span><b>Rs.50-below</b></label>
						</a>
						
					</div>

						</div>
						<div class="tab2">
							<ul class="place">
								
								<li class="sort">Filter <span>brands</span></li>
								<li class="by"><img src="images/do.png" alt=""></li>
								<div class="clearfix"> </div>
							</ul>
							
				<div class="single-bottom">
						
						<% ArrayList<String> brands=(ArrayList<String>)request.getAttribute("brands");
							if(brands!=null){
								
							for(int i=0;i<brands.size();i++){			
						%>
						<a href="productList?type=brand&brand_code=<%=(i+1) %>">
							<label for="nike"><span></span><b><%=brands.get(i) %></b></label>
						</a>
						<%} }%>
					</div>

						</div>
						
						<div class="tab4">
							<ul class="place">
								
								<li class="sort">Filter by <span>flavour</span> </li>
								<li class="by"><img src="images/do.png" alt=""></li>
								<div class="clearfix"> </div>
							</ul>
							<div class="single-bottom">
						
						
						<a href="productList?type=flav&flav=1">
							
							<label for="up"><span></span><b>Chua Cay</b></label>
						</a>
						<a href="productList?type=flav&flav=2">
							
							<label for="up1"><span></span> <b>Vị Sườn</b></label>
						</a>
						<a href="productList?type=flav&flav=3">
							
							<label for="up2"><span></span> <b>Vị Bò</b></label>
						</a>
						<a href="productList?type=flav&flav=4">
							
							<label for="up3"><span></span> <b>Vị Gà</b></label>
						</a>
						<a href="productList?type=flav&flav=5">
							<label for="up4"><span></span><b>Vị Tôm</b></label>
						</a>
						
						<a href="#">
							<label for="up3"><span></span> <b>Lẩu Thái</b></label>
						</a>
					</div>
						</div>
						<div class="tab5">
							<ul class="place">
								
								<li class="sort">Filter by <span>rating</span> </li>
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
					<h3>Best Sellers</h3>
					<%ArrayList<Product> bestSells=(ArrayList<Product>) request.getAttribute("bestSells");
						for(int i=0;i<3;i++){
					%>
						<div class="latest-grid">
						<div class="news">
							<a href="#"><img class="img-responsive2" src="<%=bestSells.get(i).getPathImg() %>" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6><a href="productDetail?id=<%=bestSells.get(i).getId()%>"><%=bestSells.get(i).getName()%></a></h6>
							
							<ul>
								<li>Price: <span><%=bestSells.get(i).getCost() %></span>/ </li>
								<li>Country: <span>VN</span></li>
							</ul>
						</div>
					<div class="clearfix"> </div>
				</div>
					<%} %>
					
				
					</div>
				<!---->
				<div class="money">
					<h3>Payment Options</h3>
						<ul class="money-in">
						<li><a href="#"><img class="img-responsive" src="images/p1.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive" src="images/p2.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive" src="images/p4.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive" src="images/p5.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive" src="images/p6.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive" src="images/p1.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive" src="images/p4.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive" src="images/p2.png" title="name" alt=""></a></li>

						</ul>
					</div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<!---->
		
	 </div>
	<!---->
	<script type="text/javascript">
	function autocomplete(inp, arr) {
		  /*the autocomplete function takes two arguments,
		  the text field element and an array of possible autocompleted values:*/
		  var currentFocus;
		  /*execute a function when someone writes in the text field:*/
		  inp.addEventListener("input", function(e) {
		      var a, b, i, val = this.value;
		      /*close any already open lists of autocompleted values*/
		      closeAllLists();
		      if (!val) { return false;}
		      currentFocus = -1;
		      /*create a DIV element that will contain the items (values):*/
		      a = document.createElement("DIV");
		      a.setAttribute("id", this.id + "autocomplete-list");
		      a.setAttribute("class", "autocomplete-items");
		      /*append the DIV element as a child of the autocomplete container:*/
		      this.parentNode.appendChild(a);
		      /*for each item in the array...*/
		      for (i = 0; i < arr.length; i++) {
		        /*check if the item starts with the same letters as the text field value:*/
		        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
		          /*create a DIV element for each matching element:*/
		          b = document.createElement("DIV");
		          b.setAttribute("style","background-color: white;");
		          /*make the matching letters bold:*/
		          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
		          b.innerHTML += arr[i].substr(val.length);
		          /*insert a input field that will hold the current array item's value:*/
		          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
		          /*execute a function when someone clicks on the item value (DIV element):*/
		          b.addEventListener("click", function(e) {
		              /*insert the value for the autocomplete text field:*/
		              inp.value = this.getElementsByTagName("input")[0].value;
		              /*close the list of autocompleted values,
		              (or any other open lists of autocompleted values:*/
		              closeAllLists();
		          });
		          a.appendChild(b);
		        }
		      }
		  });
		  /*execute a function presses a key on the keyboard:*/
		  inp.addEventListener("keydown", function(e) {
		      var x = document.getElementById(this.id + "autocomplete-list");
		      if (x) x = x.getElementsByTagName("div");
		      if (e.keyCode == 40) {
		        /*If the arrow DOWN key is pressed,
		        increase the currentFocus variable:*/
		       
		        currentFocus++;
		        /*and and make the current item more visible:*/
		        addActive(x);
		      } else if (e.keyCode == 38) { //up
		        /*If the arrow UP key is pressed,
		        decrease the currentFocus variable:*/
		        currentFocus--;
		        /*and and make the current item more visible:*/
		        addActive(x);
		      } else if (e.keyCode == 13) {
		        /*If the ENTER key is pressed, prevent the form from being submitted,*/
		        e.preventDefault();
		        if (currentFocus > -1) {
		          /*and simulate a click on the "active" item:*/
		          if (x) {
		        	  x[currentFocus].click();
		   //     	  x[currentFocus].setAttribute("style","background-color: blue;");
		          }
		        }
		      }
		  });
		  function addActive(x) {
		    /*a function to classify an item as "active":*/
		    if (!x) return false;
		    /*start by removing the "active" class on all items:*/
		    removeActive(x);
		    if (currentFocus >= x.length) currentFocus = 0;
		    if (currentFocus < 0) currentFocus = (x.length - 1);
		    /*add class "autocomplete-active":*/
		    x[currentFocus].classList.add("autocomplete-active");
		    x[currentFocus].setAttribute("style","background-color: blue;");
		  }
		  function removeActive(x) {
		    /*a function to remove the "active" class from all autocomplete items:*/
		    for (var i = 0; i < x.length; i++) {
		    x[i].setAttribute("style","background-color: white;");
		      x[i].classList.remove("autocomplete-active");
		    }
		  }
		  function closeAllLists(elmnt) {
		    /*close all autocomplete lists in the document,
		    except the one passed as an argument:*/
		    var x = document.getElementsByClassName("autocomplete-items");
		    for (var i = 0; i < x.length; i++) {
		      if (elmnt != x[i] && elmnt != inp) {
		        x[i].parentNode.removeChild(x[i]);
		      }
		    }
		  }
		  /*execute a function when someone clicks in the document:*/
		  document.addEventListener("click", function (e) {
		      closeAllLists(e.target);
		  });
		}
		var names=['hao hao','hao hao tom chua cay','hao hao sa te','hao hao suon heo','omachi','omachi xot bo ham'
			,'miliket','milliket den','miliket trang','miliket den 2 tom','miliket sa te','miliket tom chua cay','kokomi','hao hao xao','omachi suon ham'
			];
		autocomplete(document.getElementById("keySearch"),names);
		
		</script>
	<jsp:include page="/footer/footerlevel1.jsp"></jsp:include>
		
</body>
</html>