<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<head>
<title>Thông tin cá nhân</title>
<style>
.error {
	color: red;
}
</style>
</head>

<body>
	<script>
		document.getElementById("userInformationActive").className = "active";
	</script>
	<c:if test="${not empty message}">
		<script type="text/javascript">
			var message = "${message}";
			alert(message);
		</script>
	</c:if>
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
					<li><a class="totalInCart" href="cart.html"><strong>Total
								Amount <span class="badge badge-warning pull-right"
								style="line-height: 18px;">${totalPriceCart }</span>
						</strong></a></li>
				</ul>
			</div>
			<div class="well well-small">
				<a href="#"><img alt="payment method paypal"
					src="<c:url value="/assets/img/paypal.jpg"/>"></a>
			</div>

		</div>
		<div class="span9">
			<ul class="nav nav-tabs" id="productDetail">
				<li class="active"><a href="#home" data-toggle="tab">Thông
						tin cá nhân</a></li>
				<li><a href="#profile" data-toggle="tab">Đổi mật khẩu </a></li>
			</ul>
			<div class="tab-content tabWrapper" id="myTabContent">
				<div class="tab-pane fade active in" id="home">

					<hr>
					<h2>Thông tin cá nhân</h2>
					<br>

					<form:form class="bs-docs-example form-horizontal"
						action="/user/userInformation/update" modelAttribute="userUpdate"
						method="POST">
						<div class="control-group warning">
							<label class="control-label" for="inputWarning">Tên</label>
							<div class="controls">
								<form:input path="name" id="inputWarning" type="text"
									class="input" value="${userInfo.name }" />
								<form:input path="username" id="inputWarning" type="hidden"
									class="input" value="${userInfo.username }" />
								<span class="help-inline"><form:errors path="name" /></span>
							</div>
						</div>
						<div class="control-group error">
							<label class="control-label" for="inputError">Số điện
								thoại</label>
							<div class="controls">
								<form:input path="phoneNumber" class="input" id="inputError"
									type="text" value="${userInfo.phoneNumber}" />
								<span class="help-inline"><form:errors path="phoneNumber"
										cssClass="error" /></span>
							</div>
						</div>
						<div class="control-group info">
							<label class="control-label" for="inputInfo">Mật khẩu</label>
							<div class="controls">
								<form:input path="password" id="inputInfo" type="password"
									class="input" data-type="password" />
								<span class="help-inline"><form:errors path="password"
										cssClass="error" /></span>
							</div>
						</div>
						<div>
							<div class="controls">
								<input name="submit" type="submit" class="button"
									value="Cập nhật"> <br>
							</div>
						</div>
					</form:form>
				</div>

				<div class="tab-pane fade" id="profile">

					<hr>
					<h2>Đổi mật khẩu</h2>
					<br>

					<form class="bs-docs-example form-horizontal"
						action="/user/userInformation/changePassword" method="POST">
						<div class="control-group warning">
							<label class="control-label" for="inputWarning">Mật khẩu
								cũ</label>
							<div class="controls">
								<input name="oldPassword" id="inputWarning" type="password"
									pattern=".{8,}" class="input" required
									title="8 characters minimum">
							</div>
						</div>
						<div class="control-group error">
							<label class="control-label" for="inputError">Mật khẩu
								mới</label>
							<div class="controls">
								<input name="newPassword" id="inputWarning" type="password"
									pattern=".{8,}" class="input" required
									title="8 characters minimum">
							</div>
						</div>
						<div>
							<div class="controls">
								<input name="submit" type="submit" class="button"
									value="Đổi mật khẩu"> <br>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>