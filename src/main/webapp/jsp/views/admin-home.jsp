<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Classes</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="/jsp/include/navbar.jsp">
		<c:param name="view" value="classes"></c:param>
	</c:import>
		<div class="container">
		<h3 class="mt-4">Admin Home</h3>
			<div class="row">
			<div class="col-3">
				<div class="card">
				<div class="card-body">
					<h4 class="card-title text-center">Categories</h4>
					<canvas id="categoryChart"></canvas>
				</div>
			</div>
		</div>
		<div class="col-9">
			<canvas id="postChart"></canvas>
		</div>
	</div>
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			<c:url var="adminHome" value="/resources/admin-home.js"></c:url>
			<script src="${adminHome}"></script>
</body>
</html>