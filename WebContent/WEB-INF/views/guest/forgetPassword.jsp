<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<!-- 
Body Section 
-->
	<div class="row">
		<div class="span3" id="sidebar">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${category}">
						<li><a href="<c:url value ="/product/${item.id}"/>"><span
								class="icon-circle-blank"></span>${item.name}</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="cart.html"><strong>Total
								Amount <span class="badge badge-warning pull-right"
								style="line-height: 18px;">$448.42</span>
						</strong></a></li>
				</ul>
			</div>

			<div class="well well-small alert alert-warning cntr">
				<h2>50% Discount</h2>
				<p>
					only valid for online order. <br> <br> <a
						class="defaultBtn" href="#">Click here </a>
				</p>
			</div>
			<div class="well well-small">
				<a href="#"><img alt="payment method paypal"
					src="assets/img/paypal.jpg"></a>
			</div>

			<a class="shopBtn btn-block" href="#">Upcoming products <br>
				<small>Click to view</small></a> <br> <br>
			<ul class="nav nav-list promowrapper">
				<li>
					<div class="thumbnail">
						<a title="Mua hàng" class="zoomTool"
							href="<c:url value="/productDetails/${item.id}"/>"><span class="icon-search"></span>
							QUICK VIEW</a> <img alt="bootstrap ecommerce templates"
							src="assets/img/bootstrap-ecommerce-templates.png">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a> <span
									class="pull-right">$22.00</span>
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
				<li>
					<div class="thumbnail">
						<a title="Mua hàng" class="zoomTool"
							href="<c:url value="/productDetails/${item.id}"/>"><span class="icon-search"></span>
							QUICK VIEW</a> <img alt="shopping cart template"
							src="assets/img/shopping-cart-template.png">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a> <span
									class="pull-right">$22.00</span>
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
				<li>
					<div class="thumbnail">
						<a title="Mua hàng" class="zoomTool"
							href="<c:url value="/productDetails/${item.id}"/>"><span class="icon-search"></span>
							QUICK VIEW</a> <img alt="bootstrap template"
							src="assets/img/bootstrap-template.png">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a> <span
									class="pull-right">$22.00</span>
							</h4>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="index.html">Home</a> <span class="divider">/</span></li>
				<li class="active">FORGOT YOUR PASSWORD</li>
			</ul>
			<div class="well well-small">
				<h3>FORGOT YOUR PASSWORD</h3>
				<hr class="soft">

				Please enter the e-mail address used to register. We will e-mail you
				your new password.<br> <br> <br>


				<form class="form-inline">
					<label class="control-label" for="inputEmail">E-mail
						address</label> <input class="span4" type="text" placeholder="Email">
					<button class="shopBtn block" type="submit">Send My
						Password</button>
				</form>
			</div>
		</div>
	</div>


</body>