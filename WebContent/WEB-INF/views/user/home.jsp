<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<title>Home</title>
<body>
	<script>
		document.getElementById("nav-home").className = "active";
		document.getElementById("homeActive").className = "active";
	</script>
	<!-- 
Body Section 
-->
	<div class="row">
		<div class="span3" id="sidebar">
			<div class="well well-small">
				<ul class="nav nav-list">

					<c:forEach var="item" items="${category}">
						<li><a
							href="<c:url value ="/user/product/category/${item.id}"/>"><span
								class="icon-circle-blank"></span>${item.name}</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="cart.html"><strong>Tổng
								cộng <span class="badge badge-warning pull-right"
								style="line-height: 18px;"><fmt:formatNumber
										type="number" groupingUsed="true" value="${totalPriceCart}" />đ</span>
						</strong></a></li>

				</ul>
			</div>

			<div class="well well-small">
				<a href="#"><img alt="payment method paypal"
					src="<c:url value="/assets/img/paypal.jpg"/>"></a>
			</div>


		</div>
		<div class="span9">
			<div class="well np">
				<div class="carousel slide homCar" id="myCarousel">
					<div class="carousel-inner">

						<c:forEach var="item" items="${homeslide}" varStatus="index">

							<c:if test="${index.first }">
								<div class="item active">
							</c:if>
							<c:if test="${not index.first }">
								<div class="item">
							</c:if>
							<img style="width: 100%" alt="${item.caption}"
								src="<c:url value = "/assets/img/${item.img}"/>">
							<div class="carousel-caption">
								<!-- <h4></h4>-->
								<p>
									<span>${item.content}</span>
								</p>
							</div>
					</div>
					</c:forEach>

				</div>
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev">‹</a> <a class="right carousel-control"
					href="#myCarousel" data-slide="next">›</a>
			</div>
		</div>
		<!--
New Products
-->
		<div class="well well-small">
			<h3>New Products</h3>
			<hr class="soften">

			<div class="row-fluid">



				<c:forEach var="item" items="${newProduct}" varStatus="count">
					<c:if test="${count.index%3==0 }">
						<ul class="thumbnails">
					</c:if>
					<li class="span4">
						<div class="thumbnail">

							<a title="Mua hàng" class="zoomTool" style="display: none;"
								href="<c:url value="/user/productDetails/${item.id}"/>"><span
								class="icon-search"></span> QUICK VIEW</a> <a
								href="<c:url value="/user/productDetails/${item.id}"/>"><img
								alt="" src="<c:url value="/assets/img/${item.img}"/>"></a>
							<div class="caption cntr">
								<p>${item.name }</p>
								<p>
									<strong> <fmt:formatNumber type="number"
											groupingUsed="true" value="${item.price}" />đ
									</strong>
								</p>
								<h4>
									<a title="Mua hàng" class="shopBtn"
										href="<c:url value ="/user/addCart/${item.id}"/>"> Thêm
										vào giỏ hàng </a>
								</h4>
								<br class="clr">
							</div>
						</div>
					</li>
					<c:if test="${count.index%3==2}">
						</ul>
					</c:if>
				</c:forEach>

			</div>
		</div>

		<hr>
		<div class="well well-small">
			<a class="btn btn-mini pull-right" href="#">View more <span
				class="icon-plus"></span></a> Best selling Products
		</div>
	</div>
	</div>

</body>