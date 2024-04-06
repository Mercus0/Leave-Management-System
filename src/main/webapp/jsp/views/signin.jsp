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
			<!-- <div class="circle circle-one"></div> -->
			<div class="form-container">
				<div class="container-logo">
					 <img class="logo" alt="Profile Image"
			                src="<c:url value='/images/BUC.png' />" />
				</div>
				<c:url var="signin" value="/signin"></c:url>
				<sf:form action="${signin}" method="POST">

					<c:if test="${not empty param.error}">
						<div class="alert alert-error">
						  
						  <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-octagon" viewBox="0 0 16 16">
							  <path d="M4.54.146A.5.5 0 0 1 4.893 0h6.214a.5.5 0 0 1 .353.146l4.394 4.394a.5.5 0 0 1 .146.353v6.214a.5.5 0 0 1-.146.353l-4.394 4.394a.5.5 0 0 1-.353.146H4.893a.5.5 0 0 1-.353-.146L.146 11.46A.5.5 0 0 1 0 11.107V4.893a.5.5 0 0 1 .146-.353zM5.1 1 1 5.1v5.8L5.1 15h5.8l4.1-4.1V5.1L10.9 1z"/>
							  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
							</svg> Incorrect email or password.</p>
						</div>
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

					<div class="mt-3">
						<button type="submit" class="opacity bg-gold">
							<i class="bi bi-door-open"></i>Sign In
						</button>
					</div>
				</sf:form>
			</div>
		</div>
		<div class="theme-btn-container"></div>
	</section>
</body>
<c:url var="loginJs" value="/resources/login.js"></c:url>
<script src="${ loginJs }"></script>
</html>