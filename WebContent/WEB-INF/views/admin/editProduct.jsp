<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa sản phẩm</title>
</head>
<body>
	<div class="row-fluid">
		<div class="span5">
			<div>
				<div class="item">
					<a href="#"> <img style="width: 100%" alt=""
						src="<c:url value="/assets/img/${viewedProduct.img}"/>"></a>
					<!-- link ảnh -->
				</div>
			</div>
		</div>
		<div class="span7">
			<h3>Mã sản phẩm: ${viewedProduct.id}</h3>
			<form action="<c:url value="/admin/deleteProduct"/>" method="post">
				<input type="hidden" name="productId" value="${viewedProduct.id }" >
				<button type="submit" class="btn btn-mini btn-danger delete-cart">
					<h4 class="icon-remove">Xóa</h4>
				</button>
			</form>


			<hr class="soft">

			<form:form class="form-horizontal qtyFrm" method="POST"
				modelAttribute="viewedProduct" enctype="multipart/form-data"
				action="/admin/editProduct">
				<form:input path="id" type="hidden" class="input" />
				<form:input path="date" type="hidden" class="input" />
				<form:input path="img" type="hidden" class="input"/>
				<div class="control-group">
					<label for="name" class="control-label"><span>Tên
							sản phẩm*</span></label>
					<form:input path="name" type="text" class="input" required="true" />
				</div>
				<div class="control-group">
					<label for="price" class="control-label"><span>Giá*</span></label>
					<form:input path="price" type="number" min="1000" step="1000"
						class="input" required="true" />
					đ
				</div>

				<div class="control-group">
					<label class="control-label"><span>Danh mục*</span></label>
					<form:input path="category" list="listCategory" />
					<datalist id="listCategory">
						<c:forEach var="item" items="${category}">
							<option value="${item.id}">${item.name }</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="control-group">
					<label class="control-label"><span>Hình ảnh (Bỏ qua
							nếu không muốn cập nhật)</span></label> <input type="file" name="file" />
				</div>
				<div class="control-group">
					<label for="description" class="control-label"><span>Mô
							tả</span></label>
					<form:textarea path="description" type="text" class="input"
						style="margin: 0px; width: 327px; height: 80px;" />
				</div>
				<div class="control-group">
					<label for="title" class="control-label"><span>Tiêu
							đề</span></label>
					<form:input path="title" type="text" class="input" />
				</div>
				<div class="control-group">
					<label for="details" class="control-label"><span>Chi
							tiết</span></label>
					<form:textarea path="details" type="text" class="input"
						style="margin: 0px; width: 327px; height: 175px;" />
				</div>
				<div class="control-group">
					<input name="submit" type="submit" class="button" value="Hoàn tất">
				</div>

			</form:form>
		</div>
	</div>
</body>
</html>