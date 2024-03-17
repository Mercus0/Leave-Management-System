<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class | Details</title>
<c:url var="classDetails" value="/resources/class-details.css"></c:url>
<link rel="stylesheet" href="${classDetails}" type="text/css">
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap">
</head>
<body>
	<c:import url="/jsp/include/navbar.jsp">
		<c:param name="view" value="leaves"></c:param>
	</c:import>
	<div class="container">
		<div class="d-flex justify-content-between my-4">
			<h2><i class="bi bi-clipboard-fill"></i> Class Details</h2>
			
			<c:url var="status" value="/classes/status">
				<c:param name="id" value="${ dto.classInfo.id }"></c:param>
				<c:param name="status" value="${ dto.classInfo.deleted }"></c:param>
			</c:url>
			<a class="btn btn-outline-danger" href="${ status }">
			<i class="${dto.classInfo.deleted == 1 ? 'bi-check' : 'bi-trash'}"></i>
			<span>
				<c:choose>
					<c:when test="${ dto.classInfo.deleted == 1}">
						Activate
					</c:when>
					<c:otherwise>
						Delete
					</c:otherwise>
				</c:choose>
			</span>
		</a>	
		</div>
		
		<div class="card mb-4">
			<div class="card-header">Class Information</div>
			<div class="card-body row mb-3">
				<div class="col">
					<label for="" class="form-label">Teacher</label> <span
						class="form-control">${dto.classInfo.teacherName}</span>
				</div>
				<div class="col">
					<label for="" class="form-label">Start Date</label> <span
						class="form-control">${dto.classInfo.startDate}</span>
				</div>
				<div class="col">
					<label for="" class="form-label">Durations</label> <span
						class="form-control">${dto.classInfo.months}</span>
				</div>
				<div class="col">
					<label for="" class="form-label">Description</label> <span
						class="form-control">${dto.classInfo.description}</span>
				</div>
			</div>
		</div>
		
		<div class="d-flex justify-content-between mb-4">
			<ul class="nav nav-pills">
				<li class="nav-item">
					<button class="nav-link bg-gold active" data-bs-toggle="pill"
						data-bs-target="#registrations">
						<i class="bi bi-people-fill"></i>
						Registrations</button>
				</li>

				<li class="nav-item">
					<button class="nav-link bg-gold" data-bs-toggle="pill"
						data-bs-target="#leaves">
						<i class="bi bi-person-add"></i>
						Leaves Applications</button>
				</li>
			</ul>

			<div>
			<c:url var="editClass" value="/classes/edit">
				<c:param name="id" value="${dto.classInfo.id }"></c:param>
			</c:url>
				<a href="${editClass}" class="btn btn-outline-custom-blue"> 
				<i class="bi bi-pencil"></i> Edit Class</a>
				
				<c:choose>
					<c:when test="${ dto.classInfo.deleted == 1 }">	
					</c:when>
					<c:otherwise>
						<c:url var="addRegistration" value="/classes/registration">
							<c:param name="classId" value="${dto.classInfo.id }"></c:param>
							<c:param name="startDate" value="${dto.classInfo.startDate }"></c:param>
							<c:param name="teacherName" value="${dto.classInfo.teacherName }"></c:param>
						</c:url>
				<a href="${addRegistration}" class="btn btn-outline-custom-blue"> 
				<i class="bi bi-plus-lg"></i>
				Add New Registration </a>
					</c:otherwise>
				</c:choose>
			</div>
			
		</div>
		<div class="tab-content" id="contents">
			<div class="tab-pane fade show active" id="registrations">
			<c:choose>
				<c:when test="${empty dto.registrations}">
					<div class="alert alert-info">There is no registration data.</div>
				</c:when>
				<c:otherwise>
					<c:import url="/jsp/include/class-registration.jsp"></c:import>
				</c:otherwise>
			</c:choose>
			</div>
			<div class="tab-pane fade" id="leaves">
			<c:choose>
				<c:when test="${empty dto.leaves}">
					<div class="alert alert-info">There is no leaves.</div>
				</c:when>
				<c:otherwise>
					 <c:import url="/jsp/include/class-leaves.jsp"></c:import> 
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</body>
</html>