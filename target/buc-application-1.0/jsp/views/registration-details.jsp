<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h3 class="my-4">
			Registration Details
		</h3>
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header bg-primary">
						Class Information
					</div>
					<div class="card-body">
						<div class="mb-3">
							<label for="" class="form-label">Student Name</label>
							<span class="form-control">Yan Naing</span>
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Phone</label>
							<span class="form-control">09423031913</span>
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Email</label>
							<span class="form-control">yn453368@gmail.com</span>
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Education</label>
							<span class="form-control">HDIT</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card-header">
						Student Information
					</div>
					<div class="card-body">
						<div class="mb-3">
							<label for="" class="form-label">Teacher Name</label>
							<span class="form-control">Yan Naing</span>
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Start Date</label>
							<span class="form-control">2022-10-03</span>
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Duration</label>
							<span class="form-control">6 Months</span>
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Description</label>
							<span class="form-control">Java</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-4">
		<c:url var="edit" value="/classes/registration">
			<c:param name="registId" value="1"></c:param>
		</c:url>
			<a href="${edit}" class="btn btn-outline-danger">
				<i class="bi bi-pencil"></i>Edit Registration
			</a>
		</div>
	</div>
</body>
</html>