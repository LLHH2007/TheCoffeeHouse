<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="/assets/css/login.css" rel="stylesheet" type="text/css"
	media="all">
<!-- Favicons -->
<link href="<c:url value="/assets/ico/favicon.ico"/>"
	rel="shortcut icon">
<style>
.error {
	color: red;
}
</style>
</head>
<body style="background-image: url('/assets/img/backgroundLogin.png');">
	<div class="login-wrap">
		<div class="login-html">
			<c:choose>
				<c:when test="${not empty register}">
					<input id="tab-1" type="radio" name="tab" class="sign-in">
					<label for="tab-1" class="tab">Sign In</label>
					<input id="tab-2" type="radio" name="tab" class="sign-up" checked>
					<label for="tab-2" class="tab">Sign Up</label>
				</c:when>
				<c:otherwise>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
					<label for="tab-1" class="tab">Sign In</label>
					<input id="tab-2" type="radio" name="tab" class="sign-up">
					<label for="tab-2" class="tab">Sign Up</label>
				</c:otherwise>
			</c:choose>
			<div class="login-form">

				<form name="loginForm"
					action="<c:url value='j_spring_security_login' />" method='POST'>
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">Username</label> <input
								name="username" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label> <input
								name="password" type="password" class="input"
								data-type="password">
						</div>
						<!--<div class="group">
							<input id="check" type="checkbox" class="check" checked> <label
								for="check"><span class="icon"></span> Keep me Signed in</label>
						</div>-->
						<div class="group">
							<input name="submit" type="submit" class="button" value="Sign In">
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<p>${message }</p>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="<c:url value="home"/>">Trở về trang chủ</a>
						</div>

					</div>
				</form>

				<form:form name="registerForm" action="/register"
					modelAttribute="userRegister" method="POST">
					<div class="sign-up-htm">
						<div class="group">
							<label for="user" class="label">Username</label>
							<form:input path="username" type="text" class="input" />
							<form:errors path="username" cssClass="error" />
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label>
							<form:input path="password" type="password" class="input"
								data-type="password" />
							<form:errors path="password" cssClass="error" />
						</div>
						<!-- div class="group">
						<label for="pass" class="label">Repeat Password</label> <input
							id="pass" type="password" class="input" data-type="password">
					</div>-->
						<div class="group">
							<label for="pass" class="label">Your Name</label>
							<form:input id="pass" type="text" class="input" path="name" />
							<form:errors path="name" cssClass="error" />
						</div>
						<div class="group">
							<label for="pass" class="label">PhoneNumber</label>
							<form:input id="pass" type="text" class="input"
								path="phoneNumber" />
							<form:errors path="phoneNumber" cssClass="error" />
						</div>
						<div class="group">
							<input name="submit" type="submit" class="button" value="Sign Up">
						</div>
						<p>${mess }</p>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">Already Member?</label>
						</div>
					</div>
				</form:form>

			</div>
		</div>
	</div>
</body>
</html>