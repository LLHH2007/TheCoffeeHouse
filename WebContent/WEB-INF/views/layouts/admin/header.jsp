<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../common/taglib.jsp"%>

<header id="header">
	<div class="row">
		<div class="span4">
			<h1>
				<a class="logo" href="<c:url value="/admin/home"/>"><span>Twitter
						Bootstrap ecommerce template</span> <img alt="bootstrap sexy shop"
					src="/assets/img/logo-bootstrap-shoping-cart.png"> </a>
			</h1>
		</div>
		<div class="span4"></div>
		<div class="span4 alignR">
			<form action="<c:url value="/j_spring_security_logout" />"
				method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="submit" value="Logout" />
			</form>
		</div>
	</div>
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<div class="nav-collapse">
				<ul class="nav">
					<li id="nav-product"><a href="<c:url value="/admin/product"/>">Sản
							phẩm </a></li>
					<li id="nav-allProduct"><a
						href="<c:url value="/admin/allProduct"/>">Tất cả sản phẩm </a></li>
					<li id="nav-user"><a href="<c:url value="/admin/user"/>">Khách
							hàng</a></li>
					<li id="nav-revenue"><a href="<c:url value="/admin/revenue"/>">Doanh
							thu</a></li>
					<li id="nav-billDetails"><a href="<c:url value="/admin/billDetails"/>">Chi tiết hóa đơn</a></li>
					<li id="nav-addProduct"><a href="<c:url value="/admin/addProduct"/>">Thêm sản phẩm</a></li>

				</ul>
				<ul class="nav pull-right">
					<li><a><b>Xin chào
								${pageContext.request.userPrincipal.name}!</b></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>