<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<title>List View</title>
<body>
	<script>
		document.getElementById("nav-listView").className = "active";
	</script>
	<!-- 
Body Section 
-->
	<div class="row">
		<div class="span3" id="sidebar">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${category}">
						<li><a href="<c:url value ="/user/product/${item.id}"/>"><span
								class="icon-circle-blank"></span>${item.name}</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="cart.html"><strong>Total
								Amount <span class="badge badge-warning pull-right"
								style="line-height: 18px;">$448.42</span>
						</strong></a></li>
				</ul>
			</div>

			<div class="well well-small">
				<a href="#"><img alt="payment method paypal"
					src="assets/img/paypal.jpg"></a>
			</div>

		</div>
		<div class="span9">
			<div class="well well-small">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/a.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/b.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/c.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/d.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/e.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/f.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/g.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/h.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/i.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/a.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
				<div class="row-fluid">
					<div class="span2">
						<img alt="" src="assets/img/b.jpg">
					</div>
					<div class="span6">
						<h5>Product Name</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$140.00</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a class="defaultBtn" href="<c:url value="/productDetails/${item.id}"/>"><span
									class=" icon-shopping-cart"></span> Mua hàng</a> <a
									class="shopBtn" href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>