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
		<h3 class="my-4">Student Details</h3>

		<c:url var="edit" value="/students/edit">
			<c:param name="id" value="${ dto.student.id }"></c:param>
		</c:url>
		
		<a class="btn btn-outline-info mb-3" href="${edit}"><i class="bi bi-pencil me-3"></i>Edit</a>
		
		<c:url var="edit" value="/students/edit">
			<c:param name="id" value="${ dto.student.id }"></c:param>
		</c:url>
		
		<c:choose>
			<c:when test="${param.status eq true}">
					<a class="btn btn-outline-danger mb-3" href="${edit}"><i class="bi bi-trash"></i>Activate</a>
			</c:when>
			<c:otherwise>
        			<a class="btn btn-outline-danger mb-3" href="${edit}"><i class="bi bi-trash"></i>Delete</a>
    		</c:otherwise>
		</c:choose>
		
		

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
		<div class="row g-3">
			<c:forEach items="${ dto.registrations }" var="item">
				<div class="col-6">
					<div class="card card-body">
						<!-- Details -->
						<h5>${ item.classInfo }</h5>


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
	</div>
</body>
</html>