<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../common/taglib.jsp"%>

<header id="header">
	<div class="row">
		<div class="span4">
			<h1>
				<a class="logo" href="<c:url value="/home"/>"><span>logo</span> <img alt="bootstrap sexy shop"
					src="/assets/img/logo-bootstrap-shoping-cart.png"> </a>
			</h1>
		</div>
		<div class="span4"></div>
		<div class="span4 alignR">



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

					<c:forEach var="item" items="${menu}">
						<li id="nav-${item.url }">
						<a href="<c:url value="/${item.url}"/>">${item.name} </a>
						</li>
					</c:forEach>


				</ul>
				<form class="navbar-search pull-left" action="#">
					<input class="search-query span2" type="text" placeholder="Search">
				</form>
				<ul class="nav pull-right">
					<li><a href="<c:url value="/login"/>">Đăng nhập</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>