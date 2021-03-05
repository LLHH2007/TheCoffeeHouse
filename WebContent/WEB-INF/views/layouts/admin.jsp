<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title><decorator:title default="Master-layout" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap styles -->
<link href="<c:url value="/assets/css/bootstrap.css"/>" rel="stylesheet">
<!-- Customize styles -->
<link href="<c:url value="/assets/css/style.css"/>" rel="stylesheet">
<!-- font awesome styles -->
<link href="<c:url value="/assets/font-awesome/css/font-awesome.css"/>"
	rel="stylesheet">

<!-- Favicons -->
<link href="<c:url value="/assets/ico/favicon.ico"/>"
	rel="shortcut icon">

<!-- datatables -->
<link href="<c:url value="/assets/css/jquery.dataTables.min.css"/>"
	rel="stylesheet">
<decorator:head />
</head>
<body>
	<!-- 
	Upper Header Section 
-->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
						<a href="#"><span class="icon-twitter"></span></a> <a href="#"><span
							class="icon-facebook"></span></a> <a href="#"><span
							class="icon-youtube"></span></a> <a href="#"><span
							class="icon-tumblr"></span></a>
					</div>
					<a id="homeActive" href="<c:url value ="/user/home"/>"> <span
						class="icon-home"></span>Trang chủ
					</a>
				</div>
			</div>
		</div>
	</div>

	<!--
Lower Header Section 
-->
	<div class="container">
		<div id="gototop"></div>
		<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>
		<decorator:body />

	</div>
	<!-- /container -->
	<a class="gotop" href="#"><i class="icon-double-angle-up"></i></a>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/assets/js/jquery.js" />"></script>
	<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/assets/js/jquery.easing-1.3.min.js" />"></script>
	<script
		src="<c:url value="/assets/js/jquery.scrollTo-1.4.3.1-min.js" />"></script>
	<script src="<c:url value="/assets/js/shop.js" />"></script>
	<script src="<c:url value="/assets/js/jquery-3.5.1.js" />"></script>
	<script src="<c:url value="/assets/js/jquery.dataTables.min.js" />"></script>
	<script src="<c:url value="/assets/js/dataTables.fixedHeader.min.js" />"></script>
	<decorator:getProperty property="page.script"></decorator:getProperty>
</body>
</html>