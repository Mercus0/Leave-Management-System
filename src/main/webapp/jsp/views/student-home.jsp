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
		<h3 class="my-4">Student Home</h3>

		<div class="row">
			<div class="col-3">
				<div class="card">
					<div class="card-header">Personal Information</div>
					<div class="card-body">
						<div>
							<span class="text-secondary">Name</span>
							<h5>${dto.student.name }</h5>
						</div>
						<div class="mt-3">
							<span class="text-secondary">Phone</span>
							<h5>${dto.student.phone }</h5>
						</div>
						<div class="mt-3">
							<span class="text-secondary">Email</span>
							<h5>${dto.student.email }</h5>
						</div>
						<div class="mt-3">
							<span class="text-secondary">Education</span>
							<h5>${dto.student.education }</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="row g-3">
					<c:forEach items="${ dto.registrations }" var="item">
						<div class="col-6">
							<div class="card card-body">
								<!-- Details -->

								<c:forEach items="${ list }" var="t">
									<h5>${ t.description }</h5>

									<div class="d-flex justify-content-between text-secondary mb-4">
										<span>${ item.startDate }</span> <span>${ item.teacher }</span>
									</div>

									<div>
										<c:url var="applyLeave" value="/leaves/edit">
											<c:param name="classId" value="${ item.classId }"></c:param>
											<c:param name="studentId" value="${ item.studentId }"></c:param>
											<c:param name="className" value="${ t.description }"></c:param>
											<c:param name="teacherName" value="${ item.teacher }"></c:param>
										</c:url>
										<a href="${ applyLeave }" class="btn btn-outline-success">
											<i class="bi bi-send"></i> Apply Leave
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>