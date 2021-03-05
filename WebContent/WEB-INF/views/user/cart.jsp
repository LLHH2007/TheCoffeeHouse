<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<title>Cart</title>
<body>
	<script>
		document.getElementById("cartActive").className = "active";
	</script>
	<!-- 
Body Section 
-->
	<div class="row">
		<div class="span12">
			<ul class="breadcrumb">
				<li><a href="<c:url value="/user/home"/>">Home</a> <span class="divider">/</span></li>
				<li class="active">Check Out</li>
			</ul>
			<div class="well well-small">
				<h1>
					Giỏ hàng <small class="pull-right"> <c:choose>
							<c:when test="${empty totalQuantityCart}">
            				0
         				</c:when>
							<c:otherwise>
            				${totalQuantityCart}
         				</c:otherwise>
						</c:choose> sản phẩm trong giỏ hàng
					</small>
				</h1>
				<hr class="soften">

				<table class="table table-bordered table-condensed">
					<thead>
						<tr>
							<th>Sản phẩm</th>
							<th>Mô tả</th>
							<th>Danh mục</th>
							<th>Avail.</th>
							<th>Đơn giá</th>
							<th>Số lượng</th>
							<th>Chỉnh sửa</th>
							<th>Xóa</th>
							<th>Thành tiền</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty cart }">
							<c:forEach var="item" items="${cart}">

								<td><img width="100" alt=""
									src="<c:url value="/assets/img/${item.value.product.img}"/>"></td>
								<td>${item.value.product.name}
								</td>
								<td>${item.value.categoryName }</td>
								<td><span class="shopBtn"><span class="icon-ok"></span></span>
								</td>
								<td>${item.value.product.price}</td>
								<td><input type="number" min="0" max="100" class="span1"
									id="quantity-${item.value.product.id}" style="max-width: 34px"
									type="text" size="16" placeholder="1"
									value="${item.value.quantity}">
								<td><button data-id="${item.key }"
										class="btn btn-mini btn-danger edit-cart" type="button"
										href="<c:url value="/user/editCart/${item.value.product.id}"/>">
										<span class="icon-edit"></span>
									</button></td>
								<td><a class="btn btn-mini btn-danger" type="button"
									href="<c:url value="/user/deleteCart/${item.value.product.id}"/>">
										<span class="icon-remove"></span>
								</a></td>
								<td>${item.value.totalPrice}</td>
								</tr>

							</c:forEach>
						</c:if>



						<tr>
						<tr>
							<td colspan="8" class="alignR">Tổng cộng:</td>
							<td class="label label-primary"><c:choose>
									<c:when test="${empty totalQuantityCart}">
            							0đ
         							</c:when>
									<c:otherwise>
            							${totalPriceCart}đ
         							</c:otherwise>
								</c:choose>
						</tr>


					</tbody>
				</table>
				<br> <a class="shopBtn btn-large"
					href="<c:url value="/user/product"/>"><span
					class="icon-arrow-left"></span> Tiếp tục mua sắm </a> <a
					class="shopBtn btn-large pull-right"
					href="<c:url value="/user/checkOut"/>">Thanh
					toán <span class="icon-arrow-right"></span>
				</a>

			</div>
		</div>
	</div>
	<content tag="script"> <script>
		$(".edit-cart").on("click", function() {
			var id = $(this).data("id");
			var quantity = $("#quantity-" + id).val();
			window.location = "/user/editCart/" + id + "/" + quantity;
		})
	</script> </content>
</body>