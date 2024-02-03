<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student | Details</title>
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
</head>
<body>
	<c:import url="/jsp/include/navbar.jsp">
		<c:param name="view" value="students"></c:param>
	</c:import>

	<div class="container">
		<h3 class="my-4">Teacher Details</h3>
		<div class="card mb-4">
			<c:forEach items="${ list }" var="item">
				<div class="card-header">Teacher Information</div>
				<div class="card-body row mb-3">
					<div class="col">
						<label for="" class="form-label">Name</label> <span
							class="form-control">${ item.name }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Phone</label> <span
							class="form-control">${ item.phone }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Email</label> <span
							class="form-control">${ item.email }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Assign Date</label> <span
							class="form-control">${ item.assignDate }</span>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div class="row g-3">
		<c:forEach items = "${ dto }" var="item">
			<div class="col-4">
				<div class="card">
					<div class="card-body">
						<h4>${ item.teacherName }</h4>
						<div class="text-secondary">${item.description }</div>
						<span class="text-secondary">${ item.startDate }</span>
						
						<div class="row mt-4">
							<div class="col-4">
								<h5><i class="bi bi-people"></i> ${ item.studentCount }</h5>
								<span class="text-secondary">Students</span>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col">
							<c:url var="details" value="/classes/${item.id }">
		
							</c:url>
								<a href="${details}" class="btn btn-outline-success"><i class="bi bi-send"></i> Show Details</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>

</body>
</html>