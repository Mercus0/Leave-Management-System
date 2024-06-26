<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classes | Edit</title>
<c:url var="editClass" value="/resources/edit-class.css"></c:url>
<link rel="stylesheet" href="${editClass}" type="text/css">
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
		<c:param name="view" value="classes"></c:param>
	</c:import>
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-9 col-sm-12">
				<h2 class="my-4">${empty param.id ? '<i class="bi-plus-lg"></i> Add New' : '<i class="bi-pencil"></i> Edit' } Class</h2>
				<c:url var="save" value="/classes"></c:url>
				<sf:form action="${save}" method="post" modelAttribute="classForm">
					<sf:hidden path="id" />
					<!-- Teacher id -->
					<div class="mb-3">
						<label class="form-label">Select Teacher</label>
						<sf:errors path="teacherName" cssClass="alert alert-warning" element="div"> </sf:errors>
						<sf:select path="teacherName" items="${teachers}" itemValue="id" itemLabel="name"
							cssClass="form-select"></sf:select>
					</div>
					
					<div class="row mb-2">
						<!-- Start date -->
						<div class="col">
							<label class="form-label">Start Date</label>
							<sf:errors path="start" cssClass="alert alert-warning" element="div"> </sf:errors>
							<sf:input path="start" type="date" cssClass="form-control" />
						</div>
						<!-- months -->
						<div class="col">
							<label class="form-label">Months</label>
							<sf:errors path="months" cssClass="alert alert-warning" element="div"> </sf:errors>
							<sf:input path="months" type="number" cssClass="form-control"  min="1" />
						</div>
					</div>

					<!-- description -->
					<div class="mb-3">
						<label class="form-label">Description</label>
						<sf:errors path="description" cssClass="alert alert-warning" element="div"> </sf:errors>
						<sf:textarea path="description" cssClass="form-control"/>
					</div>
					<button type="submit" class="btn btn-outline-custom-blue">Save</button>
				</sf:form>
			</div>
			<div class="col-lg-6 col-md-9 col-sm-12">
				<img class="img img-fluid" alt="logo Image"
					src="<c:url value='/images/logo-8.png' />" width="650"
										height="auto" />
			</div>
		</div>
	</div>
</body>
</html>