var category = $('div .page-title').children('h2').text();
var limitItems = 3;
var itemslength = $(".items").length;
$(".items:gt(" + (limitItems + -1) + ")").hide();
var productCount = $('div .total-products').find('span').text();
var totalPages = Math.ceil(productCount / limitItems);
// load pagination by totalPages
if (totalPages < 1) {
	totalPages = 1;
}
var pageParameter = $('div .page-title').attr('page');
if(pageParameter > totalPages){ pageParameter = totalPages;}
var btnLoadMore = $('#btnLoadMore');
btnLoadMore.on('click',function(){
	if(pageParameter<totalPages)
		{
		pageParameter++;
		loadProductsByPage(pageParameter);
		}
});
function loadProductsByPage(pageParameter){
	if(pageParameter <= totalPages){
		productPage = limitItems * pageParameter;
		$(".items:gt(0)").hide();
		for( var i = 0 ; i < productPage ; i++)
			{
			$(".items:eq(" + i + ")").show();
			}
		if(pageParameter != 1){updateURL(pageParameter);}
		if(pageParameter == totalPages)
			{
			$('#btnLoadMore').toggleClass('disabled');
			}
	}
}
loadProductsByPage(pageParameter);
//for (var i = 1; i <= totalPages; i++) {
//	$(".pagination").append(
//			"<li class='page-item page-number'><a class='page-link' href='#'>"
//					+ i + "</a></li>");
//}
//$(".pagination")
//		.append(
//				"<li class='page-item next'><a class='page-link' href='#'><i class='fa fa-angle-right'></i></a></li>");
//$(".pagination li:eq(1)").addClass('active');
//$(".pagination .page-number").on("click", function() {
//	if ($(this).hasClass("active")) {
//		return false;
//	} else {
//		var currentPage = $(this).index();
//		updateURL(currentPage);
//		$('.pagination .page-number').removeClass('active');
//		$(this).addClass('active');
//		var grandTotal = limitItems * currentPage;
//		$(".items").hide();
//		for (var i = grandTotal - limitItems; i < grandTotal; i++) {
//			$(".items:eq(" + i + ")").show();
//		}
//	}
//
//});
////  next pagination button click
//$(".next").on("click", function() {
//	var currentPage = $(".pagination .active").index();
//	if (currentPage === totalPages) {
//		return false
//	} else {
//		currentPage++;
//		updateURL(currentPage);
//		$('.pagination .page-number').removeClass('active');
//		$(".pagination li:eq(" + currentPage + ")").addClass('active');
//		var grandTotal = limitItems * currentPage;
//		$(".items").hide();
//		for (var i = grandTotal - limitItems; i < grandTotal; i++) {
//			$(".items:eq(" + i + ")").show();
//		}
//
//	}
//});
////  previouse pagination button click
//$(".previousa").on("click", function() {
//	var currentPage = $(".pagination .active").index();
//	if (currentPage === 1) {
//		return false
//	} else {
//		currentPage--;
//		updateURL(currentPage);
//		$('.pagination .page-number').removeClass('active');
//		$(".pagination li:eq(" + currentPage + ")").addClass('active');
//		var grandTotal = limitItems * currentPage;
//		$(".items").hide();
//		for (var i = grandTotal - limitItems; i < grandTotal; i++) {
//			$(".items:eq(" + i + ")").show();
//		}
//	}
//});
//sort products
$("#sortByselect").on("change", function() {
	sortUsingNestedText($('#mylist'), '.items', 'div', this.value,pageParameter);
});
function sortUsingNestedText(parent, childSelector, keySelector, type,pageParameter) {
	var items = parent.children(childSelector).sort(
			function(a, b) {
				if (type === "best") {
					var vA = $(keySelector, a).attr('id');
					var vB = $(keySelector, b).attr('id');
					return (parseInt(vA) < parseInt(vB)) ? -1
							: (parseInt(vA) > parseInt(vB)) ? 1 : 0;
				}
				if (type === "new") {
					var vA = $(keySelector, a).attr('id');
					var vB = $(keySelector, b).attr('id');
					return (parseInt(vA) > parseInt(vB)) ? -1
							: (parseInt(vA) < parseInt(vB)) ? 1 : 0;
				}
				if (type === "low") {
					var vA = $(keySelector, a).attr('price');
					var vB = $(keySelector, b).attr('price');
					return (parseFloat(vA) < parseFloat(vB)) ? -1
							: (parseFloat(vA) > parseFloat(vB)) ? 1 : 0;
				}
				if (type === "high") {
					var vA = $(keySelector, a).attr('price');
					var vB = $(keySelector, b).attr('price');
					return (parseFloat(vA) > parseFloat(vB)) ? -1
							: (parseFloat(vA) < parseFloat(vB)) ? 1 : 0;
				}
			});
	parent.append(items);
	loadProductsByPage(pageParameter);
	if(pageParameter >= totalPages){$('#btnLoadMore').toggleClass('disabled')} // for toggleClass two times
}
//function loadProductsByPage(page) {
//	if (page === "pageDefault") {
//		$('.pagination .page-number').removeClass('active');
//		$(".pagination li:eq(1)").addClass('active');
//		var grandTotal = limitItems * 1;
//		$(".items").hide();
//		for (var i = grandTotal - limitItems; i < grandTotal; i++) {
//			$(".items:eq(" + i + ")").show();
//		}
//	} else {
//		if (page == null) {
//			page = 1;
//		}
//		if (page > totalPages || page < 1) {
//			if (page < 1) {
//				page = 1;
//			}
//			if (page > totalPages) {
//				page = totalPages;
//			}
//		}
//		$('.pagination .page-number').removeClass('active');
//		$(".pagination li:eq(" + page + ")").addClass('active');
//		var grandTotal = limitItems * page;
//		$(".items").hide();
//		for (var i = grandTotal - limitItems; i < grandTotal; i++) {
//			$(".items:eq(" + i + ")").show();
//		}
//	}
//}
//load Items by page parameter
//loadProductsByPage(pageParameter);

function updateURL(page) {
	if (history.pushState) {
		var newurl = "";
		if (category === "all") {
			var url = window.location.href.split('?page')[0];
			newurl = url + "?page=" + page;
		} else {
			var url = window.location.href.split('&page')[0];
			newurl = url + "&page=" + page;
		}

		window.history.pushState({
			path : newurl
		}, '', newurl);
	}
}
// add cart jquery and add cart in session
function addCart(id, name, price, img, brand) {
	// add cart jquery
	var cardList = $('div .cart-list');
	var card = "<!-- Single Cart Item --><div class='single-cart-item' id='c"
			+ id
			+ "'><a href='#' class='product-image'><img src='"
			+ img
			+ "' class='cart-thumb' alt=''><!-- Cart Item Desc --><div class='cart-item-desc'><span class='product-remove' cid=c"
			+ id
			+ "><i class='fa fa-close' aria-hidden='true'></i></span><span class='badge'>"
			+ brand
			+ "</span><h6>"
			+ name
			+ "</h6><p class='size'>Size: S</p><p class='color'>Color: Red</p><p class='price'>$"
			+ price + "</p></div></a></div>";
	cardList.append(card);
	alert(name + " is added!");
	caculatingCards();
	caculatingSummary();
	// add cart in session
	$.ajax({
		type : 'get',
		url : 'addcart?product=' + id
	});
	return false;
}

// remove cart jquery and remove card in session
$(document).on('click', '.product-remove', function(e) {
	var id = $(this).attr('cid');
	$('#' + id + '').remove();
	caculatingCards();
	caculatingSummary();
	caculatingCheckout(id);
	//remove card in session
	$.ajax({
		type : 'get',
		url : 'removecart?product=' + id.substring(1)
	});
	return false;
});
// count carts
function countCarts(){
	var x = document.getElementsByClassName("single-cart-item").length;
	return x
}
// count carts and add value to icon
function caculatingCards() {
	var x = countCarts();
	var a = $('#rightSideCart').children('span');
	var b = $('#essenceCartBtn').children('span');
	a.text(x);
	b.text(x);
	if(x <= 0){
		$('.checkout-btn .essence-btn').hide();
	}
	else{
		$('.checkout-btn .essence-btn').show();
	}
}
caculatingCards();
// count total bill
function caculatingSummary() {
	var subTotal = 0;
	$("div .single-cart-item").each(
			function(index) {
				subTotal = subTotal
						+ parseFloat($(this).find('p').last().text().substring(
								1));
			});
	var liSubtotal = $('div .cart-amount-summary').find('li').first();
	liSubtotal.children('span').last().text("$" + subTotal);
	var liTotal = $('div .cart-amount-summary').find('li').last();
	liTotal.children('span').last().text("$" + subTotal);
}
caculatingSummary();

// link login, register, history, logout
$('#login').on('click',function(){
	location.href = "http://localhost:8080/WebShop/login";
});
$('#register').on('click',function(){
	location.href = "http://localhost:8080/WebShop/register";
});
$('#yourinfo').on('click',function(){
	location.href = "http://localhost:8080/WebShop/your-info";
});
$('#history').on('click',function(){
	location.href = "http://localhost:8080/WebShop/history";
});
$('#logout').on('click',function(){
	$.ajax({
		type : 'post',
		url : 'logout'
	});
	location.href = "http://localhost:8080/WebShop/"
});
//---------------------------

//-----------------login page
var message = $('#checkValid');
if(message.attr('message') != 'default')
	{
		message.append("<h4 class='text-center'>"+message.attr('message')+"</h4>");
	}
//-----------------register page
// checkout caculating
function caculatingCheckout(id){
	$('#checkout'+id).remove();
	var price = 0;
	var li = $('div .order-details-confirmation').children('ul').children('li');
	var length = li.length;
	for(var i = 1 ; i < length-3 ; i++){
		price = price + parseFloat(li.eq(i).attr('price'));
	}
	li.eq(length-3).children('span').last().text('$'+price);
	li.eq(length-1).children('span').last().text('$'+price);
}
