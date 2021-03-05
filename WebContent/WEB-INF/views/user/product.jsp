<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<head>
<title>Product</title>
<style>
.pagination {
	display: inline-block;
	margin: 0 auto;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: dodgerblue;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>


</head>
<body>
	<script>
		document.getElementById("nav-product").className = "active";
	</script>
	<!-- 
Body Section 
-->
	<div class="row">
		<div class="span3" id="sidebar">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${category}">
						<li><a href="<c:url value ="/user/product/category/${item.id}"/>"><span
								class="icon-circle-blank"></span>${item.name}</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="cart.html"><strong>Tổng cộng <span class="badge badge-warning pull-right"
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
			<!-- 
Products
-->
			<div class="well well-small">
				<div class="row">
					<span style="margin-left: 25px;">Danh sách sản phẩm</span> <select
						class="pull-right">
						<option>A - Z</option>
						<option>Cao - Thấp</option>
					</select>
				</div>
				<h3>Our Products</h3>
				<c:forEach var="item" items="${productByPageId}" varStatus="count">
					<c:if test="${count.index%3==0}">
						<div class="row-fluid">
							<ul class="thumbnails">
					</c:if>
					<li class="span4">
						<div class="thumbnail">
							<a class="overlay" href="<c:url value="/user/productDetails/${item.id}"/>"></a> <a
								title="Mua hàng" class="zoomTool" href="<c:url value="/user/productDetails/${item.id}"/>"><span
								class="icon-search"></span> QUICK VIEW</a> <a
								href="<c:url value="/user/productDetails/${item.id}"/>"><img alt=""
								src="<c:url value="/assets/img/${item.img}"/>"></a>
							<div class="caption cntr">
								<p>${item.name }</p>
								<p>
									<strong> <fmt:formatNumber
										type="number" groupingUsed="true" value="${item.price}" />đ</strong>
								</p>
								<h4>
									<a title="Mua hàng" class="shopBtn" href="<c:url value ="/user/addCart/${item.id}"/>"> Thêm vào giỏ hàng </a>
								</h4>
								<br class="clr">
							</div>
						</div>
					</li>
					<c:if test="${count.index%3==2}">
						</ul>
			</div>
			</c:if>
			</c:forEach>

		</div>
		<div class="pagination">
			<a href="#">&laquo;</a>
			<c:forEach var="item" items="${linkOfPage}" varStatus="count">
				<c:choose>
					<c:when test="${count.count==activePage}">
						<a class="active" href="<c:url value="/user${item }"/>">${count.count}</a>
					</c:when>
					<c:otherwise><a href="<c:url value="/user${item }"/>">${count.count}</a></c:otherwise>
				</c:choose>
			</c:forEach>
			<a href="#">&raquo;</a>
		</div>
	</div>



</body>