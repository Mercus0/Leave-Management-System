<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classes | Edit</title>
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
		<c:param name="view" value="classes"></c:param>
	</c:import>
	<div class="container">
		<h3 class="my-4">${empty param.id ? 'Add New' : 'Edit' }Class</h3>
		<div class="row">
			<div class="col-lg-6 col-md-9 col-sm-12">
				<c:url var="save" value="/classes"></c:url>
				
				<sf:form action="${save}" method="post" modelAttribute="classForm">
					<sf:hidden path="id" />
					
					<sf:errors path="*" cssClass="alert alert-warning" element="div"> </sf:errors>
					<!-- Teacher id -->
					<div class="mb-3">
						<label class="form-label">Teacher</label>
						<sf:select path="teacherName" items="${teachers}" itemValue="id" itemLabel="name"
							cssClass="form-select"></sf:select>
							<sf:errors path="teacherName" cssClass=""></sf:errors>
					</div>
					<div class="row mb-2">
						<!-- Start date -->
						<div class="col">
							<label class="form-label">Start Date</label>
							<sf:input path="start" type="date" cssClass="form-control" />
							<sf:errors path="start"></sf:errors>
						</div>
						<!-- months -->
						<div class="col">
							<label class="form-label">Months</label>
							<sf:input path="months" type="number" cssClass="form-control"
								placeholder="Enter Months" />
								<sf:errors path="months"></sf:errors>
						</div>
					</div>

					<!-- description -->
					<div class="mb-3">
						<label class="form-label">Description</label>
						<sf:textarea path="description" cssClass="form-control"/>
						<sf:errors path="description"></sf:errors>
					</div>
					<button type="submit" class="btn btn-outline-danger">Save</button>
				</sf:form>
			</div>
		</div>
	</div>
</body>
</html>