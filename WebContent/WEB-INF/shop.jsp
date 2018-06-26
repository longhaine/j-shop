<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
<jsp:include page="banner.jsp"></jsp:include>
<%
	String gender = (String) request.getAttribute("gender");
	JSONArray categories = (JSONArray) request.getAttribute("categories");
	JSONArray products = (JSONArray) request.getAttribute("products");
	int productCount = products.length();
	String categoryParameter = (String)request.getAttribute("categoryParameter");
	String pageParameter =request.getParameter("page");
%>
    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb_area bg-img" style="background-image: url(img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="page-title text-center">
                        <h2><%=categoryParameter %></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Shop Grid Area Start ##### -->
    <section class="shop_grid_area section-padding-80">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop_sidebar_area">

                        <!-- ##### Single Widget ##### -->
                        <div class="widget catagory mb-50">
                            <!-- Widget Title -->
                            <h6 class="widget-title mb-30">Catagories</h6>
                            <p><a href="<%=gender%>">All</a></p>
                            <!--  Catagories  -->
                            <div class="catagories-menu">
                                <ul id="menu-content2" class="menu-content collapse show">
                                    <!-- Single Item -->
                                    <li data-toggle="collapse" data-target="#View by Category">
                                        <a href="#">View by Category</a>
                                        <ul class="sub-menu collapse show" id="View by Category">
                                            <%
                                            	for(int i = 0,length=categories.length() ; i < length ; i++)
                                            	{
                                            		JSONObject category = categories.getJSONObject(i);
                                            		String nameG = category.getString("gender");
                                            		if(nameG.equals("both") || nameG.equals(gender))
                                            		{
                                            			String name = category.getString("name");
                                            		
                                            %>
                                            <li><a href="<%=gender%>?category=<%=name%>"><%=name %></a></li>
                                            <%
                                            		}
                                            	}
                                            %>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- ##### Single Widget ##### -->
                        <div class="widget price mb-50">
                            <!-- Widget Title -->
                            <h6 class="widget-title mb-30">Filter by</h6>
                            <!-- Widget Title 2 -->
                            <p class="widget-title2 mb-30">Price</p>

                            <div class="widget-desc">
                                <div class="slider-range">
                                    <div data-min="49" data-max="360" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="49" data-value-max="360" data-label-result="Range:">
                                        <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                    </div>
                                    <div class="range-price">Range: $49.00 - $360.00</div>
                                </div>
                            </div>
                        </div>

                        <!-- ##### Single Widget ##### -->
                        <div class="widget color mb-50">
                            <!-- Widget Title 2 -->
                            <p class="widget-title2 mb-30">Color</p>
                            <div class="widget-desc">
                                <ul class="d-flex">
                                    <li><a href="#" class="color1"></a></li>
                                    <li><a href="#" class="color2"></a></li>
                                    <li><a href="#" class="color3"></a></li>
                                    <li><a href="#" class="color4"></a></li>
                                    <li><a href="#" class="color5"></a></li>
                                    <li><a href="#" class="color6"></a></li>
                                    <li><a href="#" class="color7"></a></li>
                                    <li><a href="#" class="color8"></a></li>
                                    <li><a href="#" class="color9"></a></li>
                                    <li><a href="#" class="color10"></a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- ##### Single Widget ##### -->
                        <div class="widget brands mb-50">
                            <!-- Widget Title 2 -->
                            <p class="widget-title2 mb-30">Brands</p>
                            <div class="widget-desc">
                                <ul>
                                    <li><a href="#">Asos</a></li>
                                    <li><a href="#">Mango</a></li>
                                    <li><a href="#">River Island</a></li>
                                    <li><a href="#">Topshop</a></li>
                                    <li><a href="#">Zara</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop_grid_product_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="product-topbar d-flex align-items-center justify-content-between">
                                    <!-- Total Products -->
                                    <div class="total-products">
                                        <p><span><%=productCount %></span> products found</p>
                                    </div>
                                    <!-- Sorting -->
                                    <div class="product-sorting d-flex">
                                        <p>Sort by:</p>
                                        <form action="#" method="get">
                                            <select name="select" id="sortByselect">
                                                <option value="best">Best Match</option>
                                                <option value="new">Newest</option>
                                                <option value="low">Price: $ - $$</option>
                                                <option value="high">Price: $$ - $</option>
                                            </select>
                                            <input type="submit" class="d-none" value="">
                                        </form>                                     
                                    </div>
                                    
                                </div>
                            </div>
                        </div>

                        <div class="row" id="mylist">
							<%
								for(int i = 0 ; i < productCount ; i++)
								{
									JSONObject product = products.getJSONObject(i);
									String name = product.getString("name");
									float price = product.getFloat("price");
									String image = product.getString("image");
									String nameB = product.getString("nameB");
									int id = product.getInt("id");
							%>
                            <!-- Single Product -->
                            <div class="col-12 col-sm-6 col-lg-4 items">
                                <div class="single-product-wrapper" nameI="<%=name%>" priceI="<%=price%>">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <img src="<%=image%>1.jpg" alt="">
                                        <!-- Hover Thumb -->
                                        <img class="hover-img" src="<%=image%>2.jpg" alt="">

                                        <!-- Favourite -->
                                        <div class="product-favourite">
                                            <a href="#" class="favme fa fa-heart"></a>
                                        </div>
                                    </div>

                                    <!-- Product Description -->
                                    <div class="product-description">
                                        <span><%=nameB %></span>
                                        <a href="product?id=<%=id%>">
                                            <h6><%=name %></h6>
                                        </a>
                                        <p class="product-price">$<%=price %></p>

                                        <!-- Hover Content -->
                                        <div class="hover-content">
                                            <!-- Add to Cart -->
                                            <div class="add-to-cart-btn">
                                                <a href="#" class="btn essence-btn">Add to Cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
							<%	} %>
                            

                        </div>
                    </div>
                    <!-- Pagination -->
                    <nav aria-label="navigation">
                        <ul class="pagination mt-50 mb-70">
                            <li class="page-item previousa"><a class="page-link" href="#"><i class="fa fa-angle-left"></i></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <script>
    	var category= '<%=categoryParameter%>';
		var limitItems = 6;
		var itemslength = $(".items").length;
		$(".items:gt("+(limitItems+ -1)+")").hide();
		var totalPages = Math.ceil(<%=productCount%> / limitItems);
		for(var i = 1 ; i <= totalPages ; i++){
	    	$(".pagination").append("<li class='page-item page-number' onclick='updateURL("+i+");'><a class='page-link' href='#'>"+ i +"</a></li>");
		}
		$(".pagination").append("<li class='page-item next'><a class='page-link' href='#'><i class='fa fa-angle-right'></i></a></li>");
		$(".pagination li:eq(1)").addClass('active');
		$(".pagination .page-number").on("click",function(){
			if($(this).hasClass("active"))
				{
				return false;
				}
			else
				{
				var currentPage = $(this).index();
		        $('.pagination .page-number').removeClass('active');
		        $(this).addClass('active');
		        var grandTotal = limitItems* currentPage;
		        $(".items").hide();
		        for(var i = grandTotal - limitItems ; i < grandTotal ; i++)
		        	{
		        	$(".items:eq("+i+")").show();
		        	}
				}

		});
		
		//load pageParameter
		refreshItems(<%=pageParameter%>);
		//load pageParameter
		
    	$(".next").on("click",function(){
    		var currentPage = $(".pagination .active").index();
    		if(currentPage === totalPages)
    			{
    			return false
    			}
    		else
    			{
    			currentPage++;
    			updateURL(currentPage);
		        $('.pagination .page-number').removeClass('active');
		        $(".pagination li:eq("+currentPage+")").addClass('active');
		        var grandTotal = limitItems* currentPage;
		        $(".items").hide();
		        for(var i = grandTotal - limitItems ; i < grandTotal ; i++)
		        	{
		        	$(".items:eq("+i+")").show();
		        	}
		        
    			}
    	});
    	$(".previousa").on("click",function(){
    		var currentPage = $(".pagination .active").index();
    		if(currentPage === 1)
    			{
    			return false
    			}
    		else
    			{
    			currentPage--;
    			updateURL(currentPage);
		        $('.pagination .page-number').removeClass('active');
		        $(".pagination li:eq("+currentPage+")").addClass('active');
		        var grandTotal = limitItems* currentPage;
		        $(".items").hide();
		        for(var i = grandTotal - limitItems ; i < grandTotal ; i++)
		        	{
		        	$(".items:eq("+i+")").show();
		        	}
    			}
    	});
    	$("#sortByselect").on("change",function(){
				sortUsingNestedText($('#mylist'), '.items', 'div',this.value);
				refreshItems("pageDefault");
    	});
    	function sortUsingNestedText(parent, childSelector, keySelector,type) {
    	    var items = parent.children(childSelector).sort(function(a, b) {
    	    	if(type === "best")
    	    		{
        	        var vA = $(keySelector, a).attr('nameI');
        	        var vB = $(keySelector, b).attr('nameI');
        	        return (vA < vB) ? -1 : (vA > vB) ? 1 : 0;
    	    		}
    	    	if(type === "new")
    	    		{
        	        var vA = $(keySelector, a).attr('nameI');
        	        var vB = $(keySelector, b).attr('nameI');
        	        return (vA > vB) ? -1 : (vA < vB) ? 1 : 0;
    	    		}
    	    	if(type === "low")
    	    		{
        	        var vA = $(keySelector, a).attr('priceI');
        	        var vB = $(keySelector, b).attr('priceI');
        	        return (parseFloat(vA) < parseFloat(vB)) ? -1 : (parseFloat(vA) > parseFloat(vB)) ? 1 : 0;
    	    		}
    	    	if(type === "high")
	    		{
        	        var vA = $(keySelector, a).attr('priceI');
        	        var vB = $(keySelector, b).attr('priceI');
        	        return (parseFloat(vA) > parseFloat(vB)) ? -1 : (parseFloat(vA) < parseFloat(vB)) ? 1 : 0;
	    		}
    	    });
    	    parent.append(items);
    	}
    	function refreshItems(page){
    		if(page === "pageDefault"){
		        $('.pagination .page-number').removeClass('active');
		        $(".pagination li:eq(1)").addClass('active');
		        var grandTotal = limitItems* 1;
		        $(".items").hide();
		        for(var i = grandTotal - limitItems ; i < grandTotal ; i++)
		        	{
		        	$(".items:eq("+i+")").show();
		        	}
    		}
    		else{
            	if(page == null){ page = 1;}
            	if(page > totalPages || page < 1){
            		if(page < 1){page =1;}
            		if(page > totalPages){page = totalPages;}
            	}
		        $('.pagination .page-number').removeClass('active');
		        $(".pagination li:eq("+page+")").addClass('active');
		        var grandTotal = limitItems * page;
		        $(".items").hide();
		        for(var i = grandTotal - limitItems ; i < grandTotal ; i++)
		        	{
		        	$(".items:eq("+i+")").show();
		        	}
    		}
    	}
        function updateURL(page) {
            if (history.pushState) {
            	var newurl = "";
            	if(category === "all"){
            		var url = window.location.href.split('?page')[0];
                   	newurl = url + "?page="+page;	
            	}
            	else{
            		var url = window.location.href.split('&page')[0];
            		newurl = url + "&page="+page;	
            	}

                window.history.pushState({path:newurl},'',newurl);
            }
          }
    </script>
    <!-- ##### Shop Grid Area End ##### -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>