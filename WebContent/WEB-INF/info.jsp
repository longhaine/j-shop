<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp"></jsp:include>
<body>
<%
	String message = (String) request.getAttribute("message");
	if(message == null){message = "default";}
	JSONObject user = (JSONObject) session.getAttribute("user");
	String userName = "";
	String userAddress ="";
	String userPhone = "";
	if(user != null)
	{
		userName = user.getString("name");
		userAddress = user.getString("address");
		userPhone = user.getString("phone");
	}

%>
<jsp:include page="banner.jsp"></jsp:include>
	<div class="checkout_area section-padding-80">
		<div class="container">
			<div id="checkValid" message="<%=message%>"></div>
			<div class="row">
				<div class="col-12 col-md-6">
					<div class="checkout_details_area mt-50 clearfix">
						<div class="cart-page-heading mb-30">
							<h5>Billing Address</h5>
						</div>
						<form action="your-info" method="post">
							<div class="row">
								<div class="col-12 mb-3">
									<label for="your_name">Your Name <span>*</span></label> <input
										type="text" class="form-control" id="yourname" value="<%=userName %>" name="name"
										required>
								</div>

								<div class="col-12 mb-3">
									<label for="address">Address<span>*</span></label> <input
										type="text" class="form-control" id="address" value="<%=userAddress %>"
										required name="address">
								</div>

								<div class="col-12 mb-3">
									<label for="phone_number">Phone No <span>*</span></label> <input
										type="number" class="form-control" id="phone_number" min="0"
										value="<%=userPhone %>" name="phone">
								</div>
							    <div class="form-group">        
							      <div class="col-sm-offset-2 col-sm-10">
							        <button type="submit" class="btn btn-default">Submit</button>
							      </div>
							    </div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>