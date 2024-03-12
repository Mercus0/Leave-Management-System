<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave | Edit</title>
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
		<c:param name="view" value="classes"></c:param>
	</c:import>

	<div class="container">
		<h3 class="my-4 text-primary">Leave Application</h3>
		<div class="row">
			<div class="col-4">
				<!-- Class Name -->
				<sf:form method="Post" modelAttribute="form">
					<sf:hidden path="studentId" />
					<sf:hidden path="classId" />
					<c:if test="${not empty error}">
						<div class="alert alert-info">${error}</div>
					</c:if>

					<div class="mb-3">
						<label class="form-label ">Class Name</label>
						<div class="form-control">${classAndTeacher[0].className}</div>
					</div>

					<!-- Teacher Name -->
					<div class="mb-3">
						<label for="" class="form-label">Teacher Name</label> <span
							class="form-control">${ classAndTeacher[0].teacherName }</span>
					</div>

					<!-- Start Date -->
					<div class="mb-3">
						<label class="form-label">Start Date</label>
						<sf:errors path="startDate">
							<div class="alert alert-warning" role="alert">Please Select
								Start Date.</div>
						</sf:errors>
						<sf:input path="startDate" type="date" class="form-control" />
					</div>

					<!-- Days -->
					<div class="mb-3">
						<label class="form-label">Leaves Days</label>
						<sf:errors path="days">
							<div class="alert alert-warning" role="alert">Please Enter
								Leaves days.</div>
						</sf:errors>
						<sf:input path="days" type="number" class="form-control" min="1"
							max="7" value="1" />
					</div>

					<!-- Reason -->
					<div class="mb-3">
						<label class="form-label">Reason</label>
						<sf:errors path="reason">
							<div class="alert alert-warning" role="alert">Please Enter
								Reason.</div>
						</sf:errors>
						<sf:textarea class="form-control" placeholder="eg. I am writing to inform you that I am unwell and unable to attend classes." path="reason" style="height: 100px"></sf:textarea>
					</div>
					<div>
						<button id="saveBtn" class="btn btn-outline-danger" type="submit">
							<i class="bi bi-save"> Save</i>
						</button>
					</div>
				</sf:form>
			</div>

			<div class="col-8">
				<img class="img-fluid" alt="Mail Picture"
					src="<c:url value='/static/image/mail.png'/>" width="800"
					height="800">		
			</div>
		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {

			var startDateInput = document
					.querySelector('input[name="startDate"]');
			var today = new Date().toISOString().split('T')[0];
			startDateInput.min = today;
		});
	</script>
</body>
</html>