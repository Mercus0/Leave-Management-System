<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student | Home</title>
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
		<c:param name="view" value="leaves"></c:param>
	</c:import>

	<div class="container">
		<h3 class="my-4 ms-4 text-primary">Welcome ${dto.student.name }</h3>

		<div class="row">

			<div class="my-3 col-3">
				<table class="table table-borderless text-center">
					<tr>
						<td><c:choose>
								<c:when test="${empty dto.student.profileImage}">
									<img class="img img-fluid" alt="Profile Image"
										src="<c:url value='/static/image/profile.png' />" width="300"
										height="300" />
								</c:when>
								<c:otherwise>
									<img class="img img-gird img-fluid " alt="Profile Image"
										src="<c:url value='/images/${dto.student.profileImage}' />" />
								</c:otherwise>
							</c:choose></td>

					</tr>
					<tr>
						<td><button id="photoUploadBtn" type="button"
								class="btn btn-primary">
								<i class="bi-camera"></i> Change Photo
							</button></td>
					</tr>
				</table>

			</div>

			<div class="col mt-5">
				<div class="card border-success">
					<div class="card-header">Personal Information</div>
					<div class="card-body">

						<div class="row">
							<div class="col">
								<span class="text-secondary">Id</span>
								<h5>
									<span class="badge bg-danger">${dto.student.realId }</span>
								</h5>
							</div>
							<div class="col">
								<span class="text-secondary">Name</span>
								<h5>${dto.student.name }</h5>
							</div>
						</div>

						<div class="row mt-3">
							<div class="col">
								<span class="text-secondary">Phone</span>
								<h5>${dto.student.phone }</h5>
							</div>
							<div class="col">
								<span class="text-secondary">Email</span>
								<h5>${dto.student.email }</h5>
							</div>
						</div>

						<div class="row mt-3">
							<div class="col">
								<span class="text-secondary">Education</span>
								<h5>${dto.student.education }</h5>
							</div>

							<div class="col">
								<span class="text-secondary">Gender</span>
								<h5>${dto.student.gender == 'Male' ? '<i class="bi bi-gender-male text-primary"></i>':'<i class="bi bi-gender-female text-danger"></i>'}</h5>
							</div>
						</div>

						<div class="row mt-3">
							<div class="col">
								<span class="text-secondary">Address</span>
								<h5>${dto.student.address }</h5>
							</div>
							<div class="col">
								<span class="text-secondary">Password</span>
								<h5>Password is here</h5>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<c:forEach items="${ dto.registrations }" var="item">
					<div class="col-6">
						<div class="card card-body">
							<!-- Details -->
							<h5>${ item.classInfo }</h5>


							<div class="d-flex justify-content-between text-secondary mb-4">
								<span>${ item.startDate }</span> <span>${ item.teacher }</span>
							</div>

							<div class="d-flex justify-content-between">
								<c:choose>
									<c:when test="${ item.deleted == 1 }"></c:when>
									<c:otherwise>
										<div>
											<c:url var="applyLeave" value="/leaves/edit">
												<c:param name="classId" value="${ item.classId }"></c:param>
												<c:param name="studentId" value="${ item.studentId }"></c:param>
												<c:param name="className" value="${ item.classInfo }"></c:param>
												<c:param name="teacherName" value="${ item.teacher }"></c:param>
											</c:url>
											<a href="${ applyLeave }" class="btn btn-outline-danger">
												<i class="bi bi-box-arrow-up"></i> Apply Leave
											</a>
										</div>
									</c:otherwise>
								</c:choose>
								
								<c:url var="details" value="/leaves">
									<c:param name="className" value="${ item.classInfo }"></c:param>
									<c:param name="teacherName" value="${ item.teacher }"></c:param>
								</c:url>
								<a href="${ details }" class="btn btn-outline-success">
									<i class="bi bi-send"></i> Details</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<form id="photoUploadForm"
		action="<c:url value='/member/profile/image' />"
		enctype="multipart/form-data" method="post" class="d-none">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> 
			<input type="file" name="file"
			id="photoUploadInput" />
	</form> 

	<c:url var="profileEdit" value="/resources/profile-edit.js"></c:url>
	<script src="${profileEdit}"></script>
</body>
</html>