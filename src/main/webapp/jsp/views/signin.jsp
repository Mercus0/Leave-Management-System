<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave | Sign In</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<c:url var="commonCss" value="/resources/application.css"></c:url>
<link rel="stylesheet" href="${commonCss}" type="text/css">
</head>
<body class="wh-100">
	<div class="d-flex vh-100 justify-content-center align-items-center">
		<div class="card login-form">
			<div class="card-header">
				<i class="bi-door-open"></i>Sign In
			</div>

			<div class="card-body">
				<c:url var="signin" value="/signin"></c:url>
				<sf:form action="${signin}" method="POST">
				
					<c:if test="${not empty param.error}">
						<div class="alert alert-warning">Login Error.</div>
					</c:if>
					
					<div class="mb-3">
						<label class="form-label">Email</label> <input type="email"
							name="username" placeholder="Enter Email Address"
							class="form-control" />
					</div>

					<div class="mb-3">
						<label class="form-label">Password</label> <input type="password"
							name="password" placeholder="Enter your password"
							class="form-control" />
					</div>

					<div class="mb-3">
						<button type="submit" class="btn btn-outline-success">
							<i class="bi bi-door-open"></i>Sign In
						</button>
					</div>
				</sf:form>
			</div>
		</div>
	</div>
</body>
</html>