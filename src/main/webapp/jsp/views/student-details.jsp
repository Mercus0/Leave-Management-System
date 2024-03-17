<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student | Details</title>
<c:url var="classDetails" value="/resources/class-details.css"></c:url>
<link rel="stylesheet" href="${classDetails}" type="text/css">
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap">
</head>
<body>
	<c:import url="/jsp/include/navbar.jsp">
		<c:param name="view" value="students"></c:param>
	</c:import>

	<div class="container">
		<div class="d-flex justify-content-between my-4">
			<h2><i class="bi bi-clipboard-fill"></i> Student Details</h2>

			<div class="d-flex">
				<c:url var="edit" value="/students/edit">
					<c:param name="id" value="${ dto.student.id }"></c:param>
				</c:url>

				<a class="btn btn-outline-custom-blue me-3" href="${edit}"><i
					class="bi bi-pencil"></i> Edit</a>
					
				<c:url var="status" value="/students/status">
					<c:param name="id" value="${ dto.student.id }"></c:param>
					<c:param name="email" value="${ dto.student.email }"></c:param>
					<c:param name="status" value="${ dto.student.deleted }"></c:param>
				</c:url>
				<a class="btn btn-outline-danger" href="${ status }"> <i
					class="${dto.student.deleted ? 'bi-check' : 'bi-trash'}"></i> <span>
						<c:choose>
							<c:when test="${ dto.student.deleted }">
						Activate
					</c:when>
							<c:otherwise>
						Delete
					</c:otherwise>
						</c:choose>
				</span>
				</a>
			</div>
		</div>

		<div class="card mb-4">
			<div class="card-header">Student Information</div>
			<div class="card-body row mb-3">

				<div class="row mb-3">
					<div class="col">
						<label for="" class="form-label">Student Id</label> <span
							class="form-control">${dto.student.realId }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Name</label> <span
							class="form-control">${dto.student.name }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Phone</label> <span
							class="form-control">${dto.student.phone }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Email</label> <span
							class="form-control">${dto.student.email }</span>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col">
						<label for="" class="form-label">Gender</label> <span
							class="form-control">${dto.student.gender }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Address</label> <span
							class="form-control">${dto.student.address }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Assign Date</label> <span
							class="form-control">${dto.student.assignDate }</span>
					</div>
					<div class="col">
						<label for="" class="form-label">Education</label> <span
							class="form-control">${dto.student.education }</span>
					</div>
				</div>

			</div>
		</div>
		
		<c:choose>
			<c:when test="${empty dto.registrations }">
				<div class="alert alert-info">There is no class for ${ dto.student.name }.</div>
			</c:when>
			<c:otherwise>
				<div class="row g-3">
			<c:forEach items="${ dto.registrations }" var="item">
				<div class="col-6">
					<div class="card card-body">
						<!-- Details -->
						
						<c:choose>
							<c:when test="${item.deleted ==1}">
								<h5>${ item.classInfo } <span class="badge text-bg-danger">Closed</span></h5>
							</c:when>
							<c:otherwise>
								<h5>${ item.classInfo } <span class="badge text-bg-success">Open</span></h5>
							</c:otherwise>
						</c:choose>
						


						<div class="d-flex justify-content-between text-secondary mb-4">
							<span>${ item.startDate }</span> <span>${ item.teacher }</span>
						</div>

						<div>
							<c:url var="details"
								value="/classes/registration/${item.classId }/${item.studentId }">
							</c:url>
							<a href="${ details }" class="btn btn-outline-success"> <i
								class="bi bi-cursor"></i> Details
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>