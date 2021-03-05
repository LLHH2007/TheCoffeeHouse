<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<title>All product</title>
<body>

	<script>
		document.getElementById("nav-allProduct").className = "active";
	</script>
	<!-- 
Body Section 
-->
	<h3>All Product view</h3>
	<c:forEach var="item" items="${product}" varStatus="count">
		<c:if test="${count.index%3==0}">
			<ul class="thumbnails">
		</c:if>
		<li class="span4">
			<div class="thumbnail">
				<a class="overlay"
					href="<c:url value="/admin/productDetails/${item.id}"/>"></a> <a
					title="Mua hàng" class="zoomTool"
					href="<c:url value="/admin/productDetails/${item.id}"/>"><span
					class="icon-search"></span> QUICK VIEW</a> <a
					href="<c:url value="/admin/productDetails/${item.id}"/>"><img
					alt="" src="<c:url value="/assets/img/${item.img}"/>"></a>
				<div class="caption cntr">
					<p>${item.name }</p>
					<p>
						<strong> <fmt:formatNumber type="number"
								groupingUsed="true" value="${item.price}" />đ
						</strong>
					</p>
					<a class="btn btn-mini btn-danger edit-cart" type="button"
						href="<c:url value="/admin/editProduct/${item.id}"/>"> <span
						class="icon-edit"></span>
					</a> <br class="clr">
				</div>
			</div>
		</li>
		<c:if test="${count.index%3==2}">
			</ul>
		</c:if>
	</c:forEach>



</body>