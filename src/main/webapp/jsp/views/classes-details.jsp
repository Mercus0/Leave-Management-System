<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class | Details</title>
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
		<c:param name="view" value="leaves"></c:param>
	</c:import>
	<div class="container">
		<h3 class="my-4">Class Details</h3>
		<div class="card mb-4">
			<div class="card-header">Class Information</div>
			<div class="card-body row mb-3">
				<div class="col">
					<label for="" class="form-label">Teacher</label> <span
						class="form-control">Tr.Ei</span>
				</div>
				<div class="col">
					<label for="" class="form-label">Start Date</label> <span
						class="form-control">2023-12-28</span>
				</div>
				<div class="col">
					<label for="" class="form-label">Durations</label> <span
						class="form-control">3 Months</span>
				</div>
				<div class="col">
					<label for="" class="form-label">Description</label> <span
						class="form-control">C++</span>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-between mb-4">
			<ul class="nav nav-pills">
				<li class="nav-item">
					<button class="nav-link active" data-bs-toggle="pill"
						data-bs-target="#registrations">
						<i class="bi bi-people-fill"></i>
						Registrations</button>
				</li>

				<li class="nav-item">
					<button class="nav-link" data-bs-toggle="pill"
						data-bs-target="#leaves">
						<i class="bi bi-person-add"></i>
						Leaves Applications</button>
				</li>
			</ul>

			<div>
			<c:url var="editClass" value="/classes/edit">
				<c:param name="id" value="1"></c:param>
			</c:url>
				<a href="${editClass}" class="btn btn-outline-danger"> 
				<i class="bi bi-pencil"></i>
				Edit Class </a>
			<c:url var="addRegistration" value="/classes/registration">
				<c:param name="classId" value="1"></c:param>
			</c:url>
				<a href="${addRegistration}" class="btn btn-outline-primary"> 
				<i class="bi bi-plus-lg"></i>
				Add New Registration </a>
			</div>
		</div>
		<div class="tab-content" id="contents">
			<div class="tab-pane fade show active" id="registrations">
				<c:import url="/jsp/include/class-registration.jsp"></c:import>
			</div>
			<div class="tab-pane fade" id="leaves">
				<c:import url="/jsp/include/class-leaves.jsp"></c:import>
			</div>
		</div>
	</div>
</body>
</html>