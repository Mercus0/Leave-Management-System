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
		<h3 class="my-4">Leave Application</h3>

		<div class="row">
			<div class="col-lg-6 col-md-9 col-sm-12">

				<sf:form method="Post" modelAttribute="form" cssClass="col-6">
				
					<sf:hidden path="studentId"/>
					<sf:hidden path="classId"/>
					
					<sf:errors path="*"></sf:errors>
					
					<!-- Class Name -->
					<div class="mb-3">
						<label for="" class="form-label">Class Name</label> 
						<span class="form-control">${param.className}</span>
					</div>
					
					<!-- Teacher Name -->
					<div class="mb-3">
						<label for="" class="form-label">Teacher Name</label> 
						<span class="form-control">${ param.teacherName }</span>
					</div>
					
					<!-- Start Date -->
					<div class="mb-3">
						<label for="" class="form-label">Start Date</label>
						<sf:input path="startDate" type="date" class="form-control"/>
					</div>
					
					<!-- Days -->
					<div class="mb-3">
						<label for="" class="form-label">Leaves Days</label>
						<sf:input path="days" type="number" class="form-control"/>
					</div>
					
					<!-- Reason -->
					<div class="mb-3">
						<label for="" class="form-label">Reason</label>
						<sf:input path="reason" type="text" class="form-control"/>
					</div>
					<div>
						<button class="btn btn-outline-danger" type="submit">
						<i class="bi bi-save"> Save</i>
					</button>
					</div>
				</sf:form>
			</div>
		</div>

	</div>
</body>
</html>