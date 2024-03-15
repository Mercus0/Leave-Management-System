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
					 <img class="logo" alt="Profile Image"
			                src="<c:url value='/images/BUC.png' />" />
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
			</div>
			<div class="circle circle-two"></div>
		</div>
		<div class="theme-btn-container"></div>
	</section>
</body>
<c:url var="loginJs" value="/resources/login.js"></c:url>
<script src="${ loginJs }"></script>
</html>