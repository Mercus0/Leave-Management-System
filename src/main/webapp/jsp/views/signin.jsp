<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave | Sign In</title>
<c:url var="loginCss" value="/resources/login.css"></c:url>
<link rel="stylesheet" href="${loginCss}" type="text/css">
</head>
<body class="wh-100">
	<section class="container">
		<div class="login-container">
			<div class="circle circle-one"></div>
			<div class="form-container">
				<div class="container-logo">
					<img class="logo"
						src="https://cdn.discordapp.com/attachments/1118377328993636473/1203324918939262976/Logo-3.png?ex=65d0aea9&is=65be39a9&hm=05eaf89a22e9350cf4bbd90a5fa54ba1463ad25cf9bd16808f1276d0d60cb511&"
						alt="logo" />
				</div>
				<c:url var="signin" value="/signin"></c:url>
				<sf:form action="${signin}" method="POST">

					<c:if test="${not empty param.error}">
						<div class="alert alert-warning">Login Error.</div>
					</c:if>

					<div class="mb-3">
						<label class="form-label">Email</label> <input type="email"
							name="username" placeholder="Enter Email Address"
							class="form-control" autocomplete="off"/>
					</div>

					<div class="mb-3">
						<label class="form-label">Password</label> <input type="password"
							name="password" placeholder="Enter your password"
							class="form-control" autocomplete="off"/>
					</div>

					<div class="mb-3">
						<button type="submit" class="opacity">
							<i class="bi bi-door-open"></i>Sign In
						</button>
					</div>
				</sf:form>
				<div class="register-forget opacity">
					<a href="">Register</a> <a href="">Forgot Password</a>
				</div>
			</div>
			<div class="circle circle-two"></div>
		</div>
		<div class="theme-btn-container"></div>
	</section>
</body>
<c:url var="loginJs" value="/resources/login.js"></c:url>
<link rel="stylesheet" href="${loginJs}" type="text/javascript">
</html>