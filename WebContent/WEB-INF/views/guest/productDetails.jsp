<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<title>${viewedProduct.name }</title>
<body>

	<!-- 
Body Section 
-->
	<div class="row">
		<div class="span3" id="sidebar">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${category}">
						<li><a href="<c:url value ="/user/addCart/${viewedProduct.id}"/>"><span
								class="icon-circle-blank"></span>${item.name}</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
				</ul>
			</div>

		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="<c:url value="/home"/>">Trang chủ</a> <span
					class="divider">/</span></li>
				<li><a href="<c:url value="/product"/>">Sản phẩm</a> <span
					class="divider">/</span></li>
				<li class="active">Preview</li>
			</ul>
			<div class="well well-small">
				<div class="row-fluid">
					<div class="span5">
						<div>
							<div class="item">
								<a href="#"> <img style="width: 100%" alt=""
									src="<c:url value="/assets/img/${viewedProduct.img}"/>"></a>
							</div>
						</div>
					</div>
					<div class="span7">
						<h3>${viewedProduct.name}</h3>
						<hr class="soft">

						<form class="form-horizontal qtyFrm" method="get"
							action="<c:url value ="/user/addCart/${viewedProduct.id}"/>">
							<div class="control-group">
								<label class="control-label"><span>Giá</span></label>
								<label class="control-label"><span><fmt:formatNumber
										type="number" groupingUsed="true" value="${viewedProduct.price}" />đ</span></label>
							</div>

							<div class="control-group">
								<label class="control-label"><span>Danh mục</span></label>
								<label class="control-label"><span>${categoryName}</span></label>
							</div>

							<p>${viewedProduct.description}</p>
							<p>
								<button class="shopBtn" type="submit">
									<span class=" icon-shopping-cart"></span> Thêm vào giỏ hàng
								</button>
							</p>
						</form>
					</div>
				</div>
				<hr class="softn clr">


				<ul class="nav nav-tabs" id="productDetail">
					<li class="active"><a href="#home" data-toggle="tab">Chi
							tiết sản phẩm</a></li>
					<li><a href="#profile" data-toggle="tab">Sản phẩm tương tự
					</a></li>
				</ul>
				<div class="tab-content tabWrapper" id="myTabContent">
					<div class="tab-pane fade active in" id="home">
						<h4>${viewedProduct.title}</h4>
						<table class="table table-striped">
							<tbody>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Tên:</td>
									<td class="techSpecTD2">${viewedProduct.name }</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Danh mục:</td>
									<td class="techSpecTD2">${categoryName}</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Giá:</td>
									<td class="techSpecTD2">${viewedProduct.price}</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Ngày bắt đầu bán:</td>
									<td class="techSpecTD2">${viewedProduct.date }</td>
								</tr>
							</tbody>
						</table>
						<p>${viewedProduct.details}</p>

					</div>
					<div class="tab-pane fade" id="profile">

						<c:forEach var="item" items="${relatedProduct}">

							<div class="row-fluid">
								<div class="span2">
									<img alt="" src="<c:url value="/assets/img/${item.img}"/>">
								</div>
								<div class="span6">
									<h5>${item.name }</h5>
									<p>${item.description }</p>
								</div>
								<div class="span4 alignR">
									<form class="form-horizontal qtyFrm">
										<h3>${item.price}đ</h3>
										<br>
										<div class="btn-group">
											<a class="defaultBtn"
												href="<c:url value="/user/addCart/${item.id}"/>"><span
												class=" icon-shopping-cart"></span> Mua hàng</a> <a
												class="shopBtn"
												href="<c:url value="/productDetails/${item.id}"/>">VIEW</a>
										</div>
									</form>
								</div>
							</div>
							<hr class="soft">


						</c:forEach>


						<!--<hr class="soften">-->




					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- Body wrapper -->


</body>